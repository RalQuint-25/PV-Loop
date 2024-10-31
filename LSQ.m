close all
clc
clear
%% Cystometrogram Recreation

x_data=1:50:401; %Volume points from 1mL to 400mL
y_data=[0,10,11.667,13.333,20,20,20,21,21]; %Chosen pressures
fun = @(x,x_data) x(1)*x_data+x(2); %Log equation for the CMG
x0 = [1;1];
x = lsqcurvefit(fun,x0,x_data,y_data);
plot(x_data,y_data,'ro')
hold on
plot (x_data,x(1)*x_data+x(2),'b-')



