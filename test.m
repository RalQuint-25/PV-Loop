clc
clear
close all
warning('off','all')
warning
path=append('JNP_long','.txt');
TableofData=readtable(path);
Time=table2array(TableofData(:,"Time"));
p_LV=table2array(TableofData(:,"LAS30a1_AnalogChannel01"));
V_LV=table2array(TableofData(:,"LAS30a1_AnalogChannel02"));
p_LV_ave=smoothdata(p_LV,'movmean',20); %20 Point Moving Average
V_LV_ave=smoothdata(V_LV,'movmean',20); %20 Point Moving Average
dp=diff(p_LV_ave); %First derivative Pressure
dp2=smoothdata(diff(dp),'movmean',20); %Second Derivative pressure

plot(Time,p_LV_ave)
plot(V_LV_ave,P_LV_ave)