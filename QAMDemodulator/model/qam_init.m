close all;
clear all;
clc;

qam_mode   = 2;
Fsymb = 6.25;   
Fw    = 8;      
Fadc  = 50;    
Fif   = Fadc/4;  
Feq   = Fadc/2;  
Fclk  = 100;
Tclk  = 1/Fclk;

load cc;


