#ifndef HLS_DESIGN_H
#define HLS_DESIGN_H

#include <iostream>
#include <fstream>
#include <vector>
#include <queue>
#include <assert.h>
#include <string>

#include "vhls_sim.h"

#define __USE_PRIORITYQ

#ifdef __USE_DEBUG
#define DEBUG(x) x
#else
#define DEBUG(x) 
#endif

enum HLS_PortClass {hls_signal=1, hls_clock, hls_reset, hls_start, hls_ready, hls_done, hls_continue,hls_predone};
typedef enum HLS_PortClass HLS_PortClass;

enum HLS_PortType {hls_in=1, hls_out, hls_inout};
typedef enum HLS_PortType HLS_PortType;  
  
// forward declaration
class HLS_Design;
class HLS_Port;
void hls_port_fire_function(HLS_Port*);
void hls_ap_done_fire_function(HLS_Port*);
void hls_ap_idle_fire_function(HLS_Port*);
void hls_ap_start_fire_function(HLS_Port*);

void hls_put_value_function(HLS_Port* p);
void hls_ap_start_put_value_post_function(HLS_Port*);
void hls_fifo_status_put_value_post_function(HLS_Port* p);

typedef void(*fire_function_type)(HLS_Port*);
typedef void(*put_value_function_type)(HLS_Port*);
typedef void(*prep_function_type)(HLS_Port*);

struct Port_Property{
	Port_Property(const char* n, HLS_UINT32 w, HLS_PortType t,
                  HLS_INT32 g, const char* mode, const char* a,
                  HLS_UINT32 d): name(n), width(w), type(t), group(g), iomode(mode), attrib(a), depth(d)
	{}
	std::string name;	
	HLS_UINT32 width;
	HLS_PortType type;
	HLS_INT32 group;
	std::string iomode;
	std::string attrib;
    HLS_UINT32 depth;
};

class HLS_Port{
friend class HLS_Design;
friend void hls_port_fire_function(HLS_Port*);
friend void hls_ap_done_fire_function(HLS_Port*);
friend void hls_ap_idle_fire_function(HLS_Port*);
friend void hls_ap_start_fire_function(HLS_Port*);

public:
	
    static HLS_Port* Create(HLS_INT32 idx, HLS_Design* m, HLS_UINT32 depth=1);

	HLS_Port(const Port_Property p, HLS_Design* m);
	
	virtual ~HLS_Port() 
	{
		delete [] mData;
	}

	void put_value(void*);

	void get_value(void*) const;

	const char* get_name() const
	{
		return prop.name.c_str();
	}

    HLS_UINT32 get_word_num() const
    {
        return mNumWord;
    }

	Port_Property prop;
		
	HLS_PortClass portClass;

	HLS_Design* const mModule;

	fire_function_type fire_function;

	prep_function_type prep_function;

    put_value_function_type put_value_function;

    put_value_function_type post_put_value_function;

	HLS_UINT32* mData;
	
	bool mInvalid;

	HLS_UINT32 mTransactions;

    std::vector<HLS_Port*> groups;

	// index in the mPorts vector
	//HLS_UINT32 mPosition;

protected:
	HLS_UINT32 mNumWord;
};

class HLS_Data_Port: public HLS_Port {
	friend class HLS_Design;

public:
	HLS_Data_Port(const Port_Property p, HLS_Design* m, HLS_UINT32 depth)
        : ::HLS_Port(p, m), mValue(depth, std::vector<HLS_UINT32>(mNumWord, 0)), mDepth(depth) 
	{
		mRHead = 0;
		mWHead = 0;
	}
	
	void move_read_header();

	void copy_output_value();

	void write_c_value(const HLS_UINT32* data);

	HLS_UINT32* read_c_value();

	HLS_UINT32 get_depth() const
    {
        return mDepth;
    }

  public:
    const HLS_UINT32 mDepth;

protected:
	std::vector<std::vector<HLS_UINT32> > mValue;

	
	mutable HLS_UINT32 mRHead;
	
	HLS_UINT32 mWHead;
	
};

class HLS_Fifo_Data_Port: public HLS_Data_Port {
	friend class HLS_Design;
	friend void hls_fifo_input_fire_function(HLS_Port*);
public:
	HLS_Fifo_Data_Port(const Port_Property p, HLS_Design* m, HLS_UINT32 depth)
        : ::HLS_Data_Port(p, m, depth)
	{
		fifo_status_port = 0;
		fifo_update_port = 0;
		readData = false;
		head = tail = 0;
		nIncCounter = true;
        almostFull = false;
        lock = false;
		transactor.resize(mDepth);
		for(HLS_UINT32 i=0; i<mDepth; ++i)
			transactor[i].resize(mNumWord);
	}
	
	void push_data_to_transactor()
	{
        if (tail >= mDepth)
            tail = 0;
		// write data and move tail 
		for(HLS_UINT32 i=0; i<mNumWord;++i)
			transactor[tail][i] = mData[i];
		tail += 1;
	}

	void read_data_from_transactor(HLS_UINT32* data)
	{
         if (head == mDepth)
			head = 0;
		// read data and move head
		for(HLS_UINT32 i=0; i<mNumWord;++i)
			data[i] = transactor[head][i];
		head += 1;
       
	}

    void peak_data_from_transactor(HLS_UINT32* data)
	{
        if (head == mDepth)
			head = 0;
		// read data and move head
		for(HLS_UINT32 i=0; i<mNumWord;++i)
			data[i] = transactor[head][i];       
	}

	HLS_UINT32 get_transactor_size() const
	{
		if (tail >= head)
			return tail - head;
		else
			return tail + mDepth - head;
	}

	bool is_transactor_empty() const
	{
		return (get_transactor_size() == 0);
	}

	// reset need to be called for each transaction?
	void reset()
	{
		head = 0;
		tail = 0;
		nIncCounter = true;
        almostFull = false;
	}
	
	
	HLS_Port* fifo_status_port;
	HLS_Port* fifo_update_port;
	std::vector<std::vector<HLS_UINT32> > transactor;
	bool readData;
	HLS_UINT32 head, tail;
	// true if not incr counter yet
	bool nIncCounter;
    bool almostFull;
    bool lock;
};

struct HLS_Sim_Event {
	HLS_Sim_Event(HLS_UINT64 t, HLS_Port* p): time(t), port(p) {}
	
	HLS_UINT64 time;
	HLS_Port* port;
};

struct HLS_Sim_Event_Compare {
	bool operator () (const HLS_Sim_Event& l, const HLS_Sim_Event& r)
	{
		return l.time > r.time;
	}
};

enum HLS_Error_Class {Fifo_Empty_Err=1, Fifo_Full_Err};
typedef enum HLS_Error_Class HLS_Error_Class;

class HLS_Design{
    static const char* error_msg_table[2];
public:
	friend class HLS_Port;
	friend class HLS_Data_Port;
	friend class HLS_Fifo_Data_Port;
	friend void hls_ap_done_fire_function(HLS_Port*);
	friend void hls_ap_start_fire_function(HLS_Port*);
	friend void hls_fifo_input_fire_function(HLS_Port*);
    friend void hls_fifo_output_fire_function(HLS_Port*);
    friend void hls_put_value_function(HLS_Port*);
    friend void hls_ap_start_post_put_value_function(HLS_Port*);
    friend void hls_fifo_status_post_put_value_function(HLS_Port*);


	virtual ~HLS_Design(void);
		
	HLS_Design(p_hls_setup_info);
	
	/* @return the number of ports on the top level */
	HLS_INT32 get_number_of_ports();

	/* @return the port index of the given port name 
	* if no such port, return -1
	*/
	HLS_INT32 get_port_index(const char*);

	/*put value into the given port*/
	void put_value(HLS_INT32,  void*);
	
	/*get value from the given port*/
	void  get_value(HLS_INT32, void*); 

	void run(void);

	/*get the simulation status*/
	HLS_INT32 get_status() const
	{
		return mStatus;
	}

    void set_status(HLSErrorType st, HLS_Error_Class cl, const HLS_Port* p)
    {
        mStatus = st;
        if (hlsError == st) {
            char buf[512];
            sprintf(buf, error_msg_table[cl], p->prop.name.c_str());
            mErrorInfo = buf;
            DEBUG(mLogFile << "set error: " << mErrorInfo << " @ " << get_current_time() << std::endl);
        }
    }

    const char* get_error_info()
    {
        return mErrorInfo.c_str();
    }
    
	HLS_UINT64 get_current_time() const
	{
		return mTimer;
	}

    HLS_UINT64 get_start_time() const
    {
        return mStartTime;
    }

    void record_start_time()
    {
        DEBUG(mLogFile << "get start @ " << get_current_time() << std::endl);
        mStartTime = get_current_time();
    }

    void restart();

    bool is_start_this_cycle() const
    {
        return (mTimer  == next_start_time);
    }

    void set_ready_time()
    {
        ready_time = next_start_time + mII - 1;
    }

    std::ofstream mLogFile;
    
protected:
    void schedule_run_c_sim();

    bool is_fsm_locked();

	void run_c_sim();

	void move_output_read_headers();

	void copy_output_values();

    void toggle_vld_values();

	void analyze_ports();

	bool inputs_ready() const;

    bool inputs_will_ready_this_cycle() const;

    void print_eventQ(std::ostream&) const;


private:

	typedef std::vector<HLS_Port*> Ports_Type;
	typedef Ports_Type::iterator Ports_Iterator_Type;
	
	typedef std::vector<HLS_Data_Port*> Data_Ports_Type;
	typedef Data_Ports_Type::iterator Data_Ports_Iterator_Type;

	typedef std::vector<HLS_Fifo_Data_Port*> Fifo_Data_Ports_Type;
	typedef Fifo_Data_Ports_Type::iterator Fifo_Data_Ports_Iterator_Type;

	Ports_Type mPorts;
    Ports_Type mInputPorts;
	Fifo_Data_Ports_Type mFifoDataPorts;
	Fifo_Data_Ports_Type mFifoInputs;
	Fifo_Data_Ports_Type mFifoOutputs;
    HLS_UINT32 mFifoOutPutsMaxDepth;
    HLS_UINT32 mFifoInPutsMaxDepth;
	Data_Ports_Type mOutputScalarPorts;
    Ports_Type mOutputVldPorts;
	
	HLS_Port*  hls_ap_start_port;
	HLS_Port*  hls_ap_ready_port;
	HLS_Port*  hls_ap_done_port;
	HLS_Port*  hls_ap_continue_port;
	HLS_Port*  hls_ap_idle_port;
	HLS_Port*  hls_ap_rst_port;

	HLS_UINT64 mTimer;
    HLS_UINT64 mStartTime;
    
#ifdef __USE_PRIORITYQ
    typedef std::priority_queue<HLS_Sim_Event, std::vector<HLS_Sim_Event>, HLS_Sim_Event_Compare> EventQ_Type;
    EventQ_Type mEventQ;
#else
    std::queue<HLS_Sim_Event>  mEventQ;
#endif
    
	HLS_UINT64 mLatency;

	HLS_UINT32 mII;

	HLS_INT32 nInputReadyCnt;

    HLS_INT32 nLastInputReadyCnt;

    HLSErrorType mStatus;

    std::string mErrorInfo;

    HLS_UINT64 next_start_time;

    HLS_UINT64 ready_time;

    HLS_UINT64 ready_down_time;
};

#endif
