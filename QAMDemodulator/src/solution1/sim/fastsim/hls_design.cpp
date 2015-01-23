
#ifdef __USE_VC_COMPILER
#include "StdAfx.h"
#endif

//#define __USE_DEBUG

#include "hls_design.h"
#include "hls_design_meta.h"

#include <algorithm>
#include <assert.h>
#include <iostream>


using namespace std;

void hls_put_value_function(HLS_Port* p)
{

    static HLS_UINT32 num_puts = 0;
    num_puts += 1;
    HLS_Design* module = p->mModule;
    DEBUG( module->mLogFile << "put value for " << p->prop.name << " @ " << p->mModule->get_current_time() << std::endl);
    HLS_UINT32 input_size = module->mInputPorts.size();
    // if (num_puts == input_size) {
    if (p == p->mModule->hls_ap_start_port) {
        // perform post put all values actions
        for(HLS_UINT32 i=0; i<input_size; ++i)
        {
            HLS_Port* input = module->mInputPorts[i];
            if (input->post_put_value_function)
                input->post_put_value_function(input);
        }
        num_puts = 0;
    }
}

void toggle_value(HLS_Port* p)
{
	if (p->mData[0] == 0)
		p->mData[0] = 1;
	else
		p->mData[0] = 0;
}

void hls_port_fire_function(HLS_Port* p)
{
	DEBUG(p->mModule->mLogFile << "\t\tcalling fire_function for port " << p->prop.name << " at " << p->mModule->get_current_time() << " current value = " << p->mData[0] << std::endl);
}

void hls_ap_rst_fire_function(HLS_Port* p)
{
	hls_port_fire_function(p);
}



void hls_ap_start_post_put_value_function(HLS_Port* p)
{
    HLS_Design* module = p->mModule;
    DEBUG(module->mLogFile << "fire ap_start_post_put: value = " << p->mData[0] << "  is_start_this_cycle() = " << module->is_start_this_cycle() \
          << "ready_time = " << module->ready_time << " down_time = "<< module->ready_down_time << std::endl);
	if (!p->mInvalid && p->mData[0]) {
		HLS_Port* ap_idle_port = module->hls_ap_idle_port;
		if (ap_idle_port)
			ap_idle_port->prep_function(ap_idle_port);
        if (module->is_start_this_cycle()) {
            module->set_ready_time();
        }
    }

    HLS_UINT64 current_time = module->get_current_time();
    if (module->ready_down_time == current_time) {
        module->hls_ap_ready_port->mData[0] = 0;
        module->hls_ap_ready_port->mInvalid = 0;
    }
    if (module->ready_time == current_time) {
        if (module->inputs_will_ready_this_cycle()) {
            module->hls_ap_ready_port->mData[0] = 1;
            module->hls_ap_ready_port->mInvalid = 0;
            module->ready_down_time = current_time + 1;
        } else
            module->ready_time += 1;
    }
}



void hls_ap_start_fire_function(HLS_Port* p)
{
	hls_port_fire_function(p);
	HLS_Design* module = p->mModule;
	if (!p->mInvalid && p->mData[0]) {
        module->record_start_time();
		// reset nInputReadyCnt
		module->nInputReadyCnt = module->nLastInputReadyCnt = module->mFifoInputs.size();
        for(HLS_UINT32 i=0; i<module->mFifoInputs.size(); ++i)
		{
            module->mFifoInputs[i]->reset();
		}

		if (module->inputs_ready()) {
            module->schedule_run_c_sim();
		}
	}else {
		module->mEventQ.push(HLS_Sim_Event(module->get_current_time() + 1, module->hls_ap_start_port));
        module->next_start_time = module->get_current_time() + 1;
	}
}

void hls_ap_done_fire_function(HLS_Port* p)
{
	hls_port_fire_function(p);
	toggle_value(p);
	p->mInvalid = 0;
    p->mModule->toggle_vld_values();
	// advance the Read header
	if(0 == p->mData[0]) 
		p->mModule->move_output_read_headers();
    // reset output fifo
   //  if(0 == p->mData[0]) {
//         HLS_Design* module = p->mModule;
//         for(HLS_UINT32 i=0; i<module->mFifoOutputs.size(); ++i)
//             module->mFifoOutputs[i]->reset();
//     }
		

}

void hls_ap_ready_fire_function(HLS_Port* p)
{
	hls_port_fire_function(p);
	toggle_value(p);
	p->mInvalid = 0;
}

void hls_ap_continue_fire_function(HLS_Port* p)
{
	hls_port_fire_function(p);
}

void hls_ap_idle_fire_function(HLS_Port* p)
{
	hls_port_fire_function(p);
	DEBUG(p->mModule->mLogFile << "     ap_idle port mTransaction = " << p->mTransactions << std::endl);
    DEBUG(assert(p->mTransactions >0));
		p->mTransactions -= 1;
		if (p->mTransactions == 0) {
			p->mData[0] = 1;
			p->mInvalid = 0;
		}
}

void hls_ap_idle_prep_function(HLS_Port* p)
{
	p->mTransactions += 1;
	if (p->mTransactions) {
		p->mData[0] = 0;
		p->mInvalid = 0;
	}
}

bool is_fifo_not_empty(HLS_Port* p)
{
    if (p->mData[0] && p->mInvalid == 0)
        return true;
    return false;
}

bool is_fifo_not_full(HLS_Port* p)
{
    if (p->mData[0] && p->mInvalid == 0)
        return true;
    return false; 
}

void hls_fifo_status_post_put_value_function(HLS_Port* p)
{
    HLS_Design* module = p->mModule;
    DEBUG(module->mLogFile << "fire fifo put value @ " << module->get_current_time() << std::endl);

    HLS_Fifo_Data_Port* fifoP = static_cast<HLS_Fifo_Data_Port*>(p->groups[0]);
    if (fifoP->prop.type == hls_in) {
        fifoP->readData = false;
        fifoP->fifo_update_port->mData[0] = 0;
        fifoP->fifo_update_port->mInvalid = 0;
        HLS_UINT32 transactor_size = fifoP->get_transactor_size();
        HLS_Port* ap_start_p = module->hls_ap_start_port;
        if (is_fifo_not_empty(p) &&
            ap_start_p &&
            ap_start_p->mData[0] &&
            fifoP->nIncCounter &&
            transactor_size < fifoP->mDepth) {        
            DEBUG(module->mLogFile << "transactor_size =  " << transactor_size);
            DEBUG(module->mLogFile << " from " << fifoP->prop.name << " @ " << module->get_current_time() << " depth = " << fifoP->mDepth << std::endl);
            //issue read signals if it is not empty
            fifoP->readData = true;
            fifoP->fifo_update_port->mData[0] = 1;
            fifoP->fifo_update_port->mInvalid = 0;
        }
    } else {
        // this is an output fifo
        HLS_UINT32 transactor_size = fifoP->get_transactor_size();
        if (transactor_size &&  !is_fifo_not_full(p))
            fifoP->lock = true;
        else
            fifoP->lock = false;
        
        HLS_Port* update_port = fifoP->fifo_update_port;
        if (is_fifo_not_full(p) && transactor_size) {
            update_port->mData[0] = 1;
            update_port->mInvalid = 0;
            fifoP->peak_data_from_transactor(fifoP->mData);
            fifoP->readData = true;
        } else {
            update_port->mData[0] = 0;
            update_port->mInvalid = 0;
            fifoP->readData = false;
        } 
    }
}


void hls_fifo_input_fire_function(HLS_Port* p)
{
	HLS_Fifo_Data_Port* fifoP = static_cast<HLS_Fifo_Data_Port*>(p);
	// prelogue: read last data
    fifoP->push_data_to_transactor();
    DEBUG(fifoP->mModule->mLogFile << "FIFO: read data " << fifoP->mData[0] \
          << " from " << fifoP->prop.name << " @ " << fifoP->mModule->get_current_time() << " Now transactor_size = " << fifoP->get_transactor_size() << std::endl);

	// clear status
//	fifoP->fifo_update_port->mData[0] = 0;
	
	HLS_Design* module = fifoP->mModule;
    // already read enough data
    if (fifoP->get_transactor_size() == fifoP->mDepth) {
        if (fifoP->nIncCounter) {
            fifoP->nIncCounter = false;
            module->nInputReadyCnt -= 1;
            if (module->nInputReadyCnt == 0) {
                module->schedule_run_c_sim();
            }
        }
    }
}




void hls_fifo_output_fire_function(HLS_Port* p)
{
    HLS_Fifo_Data_Port* fifoP = static_cast<HLS_Fifo_Data_Port*>(p);
	HLS_Design* module = fifoP->mModule;
    DEBUG(module->mLogFile << "fifo_output_fire_function: current_transactor_size = " << fifoP->get_transactor_size() << std::endl);
	if (fifoP->get_transactor_size() > 0) {
		//issue read signals if it is not full
		if (fifoP->fifo_status_port->mData[0]) {
            fifoP->read_data_from_transactor(fifoP->mData);
            fifoP->mInvalid = 0;
            DEBUG(module->mLogFile << "FIFO: write " << fifoP->mData[0] << std::endl);
			fifoP->fifo_update_port->mData[0] = 1;
            fifoP->fifo_update_port->mInvalid = 0;
            module->mEventQ.push(HLS_Sim_Event(module->get_current_time() + 1, fifoP));
        } else {
            module->set_status(hlsError, Fifo_Full_Err, fifoP);
        }
	} else {
        fifoP->fifo_update_port->mData[0] = 0;
    }
}


HLS_Port::HLS_Port(const Port_Property p, HLS_Design* m): prop(p), mModule(m)
{
    //invalid value when initialization
    mNumWord = prop.width / 32 + (prop.width % 32 == 0 ? 0 : 1);
    mData = new HLS_UINT32[mNumWord]();
    mInvalid = 0x1;
    fire_function = 0;
    prep_function = 0;
    put_value_function = hls_put_value_function;
    post_put_value_function = 0;
    mTransactions = 0;
    //mPosition = mModule->mPorts.size();
}

HLS_Port* HLS_Port::Create(HLS_INT32 idx, HLS_Design* m, HLS_UINT32 depth)
{
    const Port_Property p = HLS_Design_Meta::port_props[idx];
	HLS_Port* port = 0;
	if (p.name.compare("ap_rst") == 0) {
		port = new HLS_Port(p, m);
		port->fire_function = hls_ap_rst_fire_function;
		m->hls_ap_rst_port = port;

	}else if (p.name.compare("ap_start") == 0) {
		port =  new HLS_Port(p, m);
		port->fire_function = hls_ap_start_fire_function;
        port->post_put_value_function = hls_ap_start_post_put_value_function;
		m->hls_ap_start_port = port;
	}else if (p.name.compare("ap_done") == 0) {
		port = new HLS_Port(p, m);
		port->fire_function = hls_ap_done_fire_function;
		m->hls_ap_done_port = port;
	} else if (p.name.compare("ap_ready") == 0) {
		//port = new HLS_Ctrl_Port(n, m);
		port = new HLS_Port(p, m);
		port->fire_function = hls_ap_ready_fire_function;
		m->hls_ap_ready_port = port;
	} else if (p.name.compare("ap_continue") == 0) {
		//port = new HLS_Ctrl_Port(n, m);
		port = new HLS_Port(p, m);
		port->fire_function = hls_ap_continue_fire_function;
		m->hls_ap_continue_port = port;
	} else if (p.name.compare("ap_idle") == 0) {
		//port = new HLS_Idle_Port(n, m);
		port = new HLS_Port(p, m);
		port->fire_function = hls_ap_idle_fire_function;
		port->prep_function = hls_ap_idle_prep_function;
		m->hls_ap_idle_port = port;
		port->mData[0] = 1;
	} else if (p.iomode.compare("ap_fifo") == 0) {
		if (p.attrib.compare("fifo_data") == 0) {
			//HLS_Fifo_Data_Port* fifoP = new HLS_Fifo_Data_Port(p, m, depth);
            //fetch fifo depth from file
            HLS_UINT32 fifo_depth = p.depth;
			HLS_Fifo_Data_Port* fifoP = new HLS_Fifo_Data_Port(p, m, fifo_depth);
			port = fifoP;
			m->mFifoDataPorts.push_back(fifoP);
			if (hls_in == p.type) {
				m->mFifoInputs.push_back(fifoP);
				fifoP->fire_function = hls_fifo_input_fire_function;
			}
			else {
				m->mFifoOutputs.push_back(fifoP);
				fifoP->fire_function = hls_fifo_output_fire_function;
			}
		}
		else 
			port = new HLS_Port(p, m);
	}else if (HLS_Design_Meta::is_vld_port(idx))
        port = new HLS_Port(p, m);
    else
		port = new HLS_Data_Port(p, m, depth);

    if (port->prop.type == hls_in)
        m->mInputPorts.push_back(port);
	m->mPorts.push_back(port);
	return port;
}

void HLS_Port::put_value(void* value)
{
	bool inValid = false;
	for(HLS_UINT32 i=0; i<mNumWord; ++i)
	{
		mData[i] = (static_cast<p_hls_vlog_logicval>(value)+i)->aVal;
		if ((static_cast<p_hls_vlog_logicval>(value)+i)->bVal != 0)
			inValid = true;
	}
	mInvalid = inValid;
    // regiser hooks for certain ports
    if (put_value_function)
        put_value_function(this);
}

void HLS_Port::get_value(void* value) const
{
	for(HLS_UINT32 i=0; i<mNumWord; ++i)
		(static_cast<p_hls_vlog_logicval>(value)+i)->aVal = mData[i];
	static_cast<p_hls_vlog_logicval>(value)->bVal = mInvalid;
}

void HLS_Data_Port::write_c_value(const HLS_UINT32* data)
{
	for(HLS_UINT32 i=0; i<mNumWord; ++i)
		mValue[mWHead][i] = data[i];
	mInvalid = 0;
	mWHead += 1;
	if (mDepth == mWHead)
		mWHead = 0;
}

HLS_UINT32* HLS_Data_Port::read_c_value() 
{
	//HLS_UINT32 curRHead = mRHead;
	//move_read_header();
	//return mValue[curRHead];
	return mData;
}

void HLS_Data_Port::move_read_header()
{
	mRHead += 1;
	if (mDepth == mRHead)
		mRHead = 0;
}


void HLS_Data_Port::copy_output_value()
{
	for(HLS_UINT32 j=0; j<mNumWord; ++j)
		mData[j] = mValue[mRHead][j];
}

const char* HLS_Design::error_msg_table[2]= {"input FIFO %s is empty.", "output FIFO %s is full."};

HLS_Design::HLS_Design(p_hls_setup_info setup_info)
{
	if (setup_info->logFileName) {
	    mLogFile.open(setup_info->logFileName);
	} else
		mLogFile.open("hls_cosim.log");

	next_start_time = mTimer = 1;
	mLatency = HLS_Design_Meta::latency;
	mII = HLS_Design_Meta::II;
	HLS_UINT32 depth;
    if (mLatency > 0)
        depth = (HLS_UINT32)(mLatency/mII + (mLatency%mII == 0? 0:1));
    else
        depth = 1;
	DEBUG(mLogFile << "data buffer depth = " << depth << std::endl);
    
    mFifoOutPutsMaxDepth = 0;
    mStatus = hlsNormal;
    mErrorInfo = "";
    
	// initialize all the ports
	hls_ap_ready_port = hls_ap_start_port = hls_ap_done_port = hls_ap_continue_port = hls_ap_idle_port = 0;
	HLS_UINT32 size = sizeof(HLS_Design_Meta::port_props)/sizeof(Port_Property);
	for(HLS_UINT32 i=0; i<size; ++i)
	{
		HLS_Port* port = HLS_Port::Create(i, this, depth);
        if (HLS_Design_Meta::is_vld_port(i))
                mOutputVldPorts.push_back(port);
        HLS_Data_Port* data_port = dynamic_cast<HLS_Data_Port*>(port);
        if (!data_port)
            continue;
        if ( hls_out == data_port->prop.type && !dynamic_cast<HLS_Fifo_Data_Port*>(data_port)) 
            mOutputScalarPorts.push_back(data_port);
	}
	
	// initialize multicycle inputs ports
	analyze_ports();

    ready_time = 0;
    ready_down_time = 0;
    restart();
}


HLS_Design::~HLS_Design(void)
{
	for(HLS_UINT32 i=0; i<mPorts.size();++i)
	{
		HLS_Port* port = mPorts[i];
		delete port;
		mPorts[i] = NULL;
	}
}


HLS_INT32 HLS_Design::get_number_of_ports()
{
	return mPorts.size();
}


HLS_INT32 HLS_Design::get_port_index(const char* port_name)
{
	HLS_UINT32 i = 0;	
	for(i=0; i<mPorts.size(); ++i)
	{
		if (mPorts[i]->prop.name.compare(port_name) == 0)
			return i;
	}
	return -1;
}


void HLS_Design::put_value(HLS_INT32 port,  void* value)
{
	assert(port >=0 && port < (int)mPorts.size());
	mPorts[port]->put_value(value);
}

void HLS_Design::get_value(HLS_INT32 port, void* value)
{
	assert(port >=0 && port < (int)mPorts.size());
	mPorts[port]->get_value(value);
}

void HLS_Design::print_eventQ(ostream& os) const
{
    os << "EventQ size = " << mEventQ.size();
    os << "(" << mEventQ.top().time << ", " << mEventQ.top().port->prop.name << ") ";
    os <<  " @ " << get_current_time() << std::endl;
}


bool HLS_Design::is_fsm_locked()
{
    HLS_UINT32 size = mFifoOutputs.size();
    for(HLS_UINT32 i=0; i<size; ++i)
    {
        if (mFifoOutputs[i]->lock)
            return true;
    }
    return false;
}

void HLS_Design::run()
{
	DEBUG(mLogFile << "HLS_Design::run(): current time stamp " << mTimer << std::endl);
	DEBUG(mLogFile << "    eventQ size = " << mEventQ.size() << std::endl);
    
    // combination design
    if (0 == mLatency) {
        run_c_sim();
        move_output_read_headers();
        copy_output_values();

        if (hls_ap_start_port) {
            HLS_UINT32 ap_start_v = hls_ap_start_port->mData[0];
            hls_ap_ready_port->mData[0] = ap_start_v;
            hls_ap_ready_port->mInvalid = 0;

            hls_ap_done_port->mData[0] = ap_start_v;
            hls_ap_done_port->mInvalid = 0;

            hls_ap_idle_port->mData[0] = ap_start_v;
            hls_ap_idle_port->mInvalid = 0;
        }
    } else {
        // schedule fifo read
        if (is_fsm_locked()) {
            DEBUG(mLogFile << "fifo output locks: ");
            DEBUG(mLogFile << "Exit HLS_Design::run()" << std::endl);
            return;
        }
            
        for(HLS_UINT32 i=0; i< mFifoInputs.size(); ++i)
        {
            HLS_Fifo_Data_Port* fifoP = mFifoInputs[i];
            if (fifoP->readData) {
                hls_fifo_input_fire_function(fifoP);
            }
        }

        for(HLS_UINT32 i=0; i< mFifoOutputs.size(); ++i)
        {
            HLS_Fifo_Data_Port* fifoP = mFifoOutputs[i];
            if (fifoP->readData) {
                fifoP->read_data_from_transactor(fifoP->mData);
                if (fifoP->get_transactor_size() == 0)
                    fifoP->reset();
            }
        }
         
        if(!mEventQ.empty()){
            if(!mEventQ.empty() && mEventQ.top().time < mTimer) {
                HLS_Port *const port = mEventQ.top().port;
                DEBUG(mLogFile << "!!! assertion error for Queue: port " << port->prop.name << " event scheduled at " << mEventQ.top().time << ", current time = " << mTimer << std::endl);
                DEBUG(assert(0 && "eventQ error"));
            }
            while(!mEventQ.empty() && mEventQ.top().time == mTimer)
            {
                DEBUG(mLogFile << "    fire mEventQ " << mEventQ.top().port->get_name() << " at " << mTimer << std::endl);
                HLS_Port *const port = mEventQ.top().port;
                DEBUG(assert(port));
                port->fire_function(port);
                mEventQ.pop();
            }
        } else {
            DEBUG(mLogFile << "mEventQ is empty at " << mTimer << std::endl);
        }
        copy_output_values();
    }
    
	DEBUG(mLogFile << "Exit HLS_Design::run()" << std::endl);
	mTimer += 1;
}

void HLS_Design::move_output_read_headers()
{
	for(HLS_UINT32 i=0; i<mOutputScalarPorts.size(); ++i)
	{
		HLS_Data_Port* p = mOutputScalarPorts[i];
		p->move_read_header();
	}
}

void HLS_Design::copy_output_values()
{
	for(HLS_UINT32 i=0; i<mOutputScalarPorts.size(); ++i)
	{
		HLS_Data_Port* p = mOutputScalarPorts[i];
		p->copy_output_value();
		
	}
}

void HLS_Design::toggle_vld_values()
{
    for(HLS_UINT32 i=0; i<mOutputVldPorts.size(); ++i)
	{
		HLS_Port* p = mOutputVldPorts[i];
		toggle_value(p);
        p->mInvalid = 0;
	}
}

void HLS_Design::analyze_ports()
{
	for(HLS_UINT32 i=0; i<mFifoDataPorts.size(); ++i)
	{
		HLS_Fifo_Data_Port* fifo = mFifoDataPorts[i];
		HLS_INT32 group = fifo->prop.group;
		for(HLS_UINT32 j=0; j<mPorts.size(); ++j)
		{
			if (j == i)
				continue;
			HLS_Port* p = mPorts[j];
			if (p->prop.group != group)
				continue;
			if (p->prop.attrib.compare("fifo_status") == 0)
				fifo->fifo_status_port = p;
			if (p->prop.attrib.compare("fifo_update") == 0)
				fifo->fifo_update_port = p;
		}
        DEBUG(assert(fifo->fifo_update_port && fifo->fifo_status_port));
        fifo->fifo_update_port->groups.push_back(fifo);
        fifo->fifo_status_port->groups.push_back(fifo);
        fifo->fifo_status_port->post_put_value_function = hls_fifo_status_post_put_value_function;
	}

    // get the max depth of output fifo
    mFifoOutPutsMaxDepth = 0;
    for(HLS_UINT32 i=0; i<mFifoOutputs.size(); ++i)
    {
        HLS_UINT32 depth = mFifoOutputs[i]->mDepth;
        if (depth > mFifoOutPutsMaxDepth)
            mFifoOutPutsMaxDepth = depth;
    }

    mFifoInPutsMaxDepth = 0;
    for(HLS_UINT32 i=0; i<mFifoInputs.size(); ++i)
    {
        HLS_UINT32 depth = mFifoInputs[i]->mDepth;
        if (depth > mFifoInPutsMaxDepth)
            mFifoInPutsMaxDepth = depth;
    }
    if (mFifoInPutsMaxDepth > mII)
        mII = mFifoInPutsMaxDepth;
        

}

bool HLS_Design::inputs_ready() const
{
	if (this->nInputReadyCnt == 0)
		return true;
	return false;
}

bool HLS_Design::inputs_will_ready_this_cycle() const
{
    if (inputs_ready())
        return true;
    for(HLS_UINT32 i = 0; i<mFifoInputs.size(); ++i)
    {
        HLS_Fifo_Data_Port* fifoP = mFifoInputs[i];
        HLS_UINT32 transactor_size = fifoP->get_transactor_size();
        if (transactor_size == fifoP->mDepth)
            continue;
        if (transactor_size == fifoP->mDepth - 1 && fifoP->readData)
            continue;
        return false;
    }
    return true;
}

void HLS_Design::schedule_run_c_sim()
{
    DEBUG( mLogFile << " run c sim @ " << mTimer << std::endl);     
    run_c_sim();

    HLS_UINT64 ready_time, old_ready_time;
    ready_time = old_ready_time = get_start_time() + mII - 1;
    if (ready_time < get_current_time()) {
        ready_time = get_current_time();
         DEBUG(mLogFile << "@I: delayed ready time from " << old_ready_time << " to " << ready_time << std::endl);
    }

           
    mEventQ.push(HLS_Sim_Event(ready_time + 1, hls_ap_start_port));
    next_start_time = ready_time + 1;


    // calculate done time
    HLS_UINT64 delay = ready_time - old_ready_time;
    HLS_UINT64 done_time, old_done_time;
    done_time = old_done_time = get_start_time() + mLatency + delay;
    if (done_time < get_current_time() + mFifoOutPutsMaxDepth) {
        done_time = get_current_time() + mFifoOutPutsMaxDepth;
        DEBUG(mLogFile << "@I: delayed done time from " << old_done_time << " to " << done_time << std::endl);
    }
    
    if (done_time   < get_current_time() + 1)
        done_time = get_current_time() + 1;
   //  for(HLS_UINT32 k=0; k<mFifoOutputs.size();++k)
//     {
//         HLS_Fifo_Data_Port* outP = mFifoOutputs[k];
//         HLS_UINT64 fire_time = done_time -  outP->mDepth;
//         mEventQ.push(HLS_Sim_Event(fire_time, outP));
//     }

    mEventQ.push(HLS_Sim_Event(done_time - 1, hls_ap_done_port));
    mEventQ.push(HLS_Sim_Event(done_time - 1, hls_ap_idle_port));
    mEventQ.push(HLS_Sim_Event(done_time, hls_ap_done_port));
}

static bool hls_design_meta_string_match(const std::string& str, const std::string& pattern)
{
    HLS_UINT32 len = str.length();
    HLS_UINT32 pattern_len = pattern.length();
    if (len < pattern_len)
        return false;
    if (str.substr(len-pattern_len).compare(pattern) != 0)
        return false;
    return true;
}

bool HLS_Design_Meta::is_vld_port(HLS_UINT32 n)
{
    HLS_UINT32 size = sizeof(HLS_Design_Meta::port_props)/sizeof(Port_Property);
    DEBUG(assert(n < size));
    HLS_INT32 group = port_props[n].group;
    const std::string name = port_props[n].name;
    if (hls_design_meta_string_match(name, "ap_vld") == false)
        return false;
   
    for(HLS_UINT32 i=0; i<size; ++i)
    {
        if (group != port_props[i].group)
            continue;
        if (hls_design_meta_string_match(port_props[i].name, "ap_vld") == false)
            continue;
        if (port_props[i].name.length() > name.length())
            return false;
    }
    return true;
}

void HLS_Design::restart()
{
    mTimer = 1;
    while(mEventQ.size())
        mEventQ.pop();
    
	if (hls_ap_ready_port) {
        hls_ap_ready_port->mData[0] = 0;
        hls_ap_ready_port->mInvalid = 0;
    }

    if (hls_ap_done_port) {
        hls_ap_done_port->mData[0] = 0;
        hls_ap_done_port->mInvalid = 0;
    }
	if (hls_ap_idle_port){
        hls_ap_idle_port->mData[0] = 1;
        hls_ap_idle_port->mInvalid = 0;
    }
    for(HLS_UINT32 i=0; i<mOutputVldPorts.size(); ++i)
    {
        mOutputVldPorts[i]->mData[0]= 0;
        mOutputVldPorts[i]->mInvalid= 0;
    }
    
    for(HLS_UINT32 i=0; i<mFifoDataPorts.size(); ++i)
    {     
        mFifoDataPorts[i]->fifo_update_port->mData[0]= 0;      
        mFifoDataPorts[i]->fifo_update_port->mInvalid= 0;     
    }           
    // schedule start fire function
	mEventQ.push(HLS_Sim_Event(get_current_time(), hls_ap_start_port));
    next_start_time = get_current_time();
}
