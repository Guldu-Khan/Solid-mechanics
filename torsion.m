%Torsion Module
%zy plane of cross scetion
%x- axis of the shaft
clc; clear all; clear; clf(figure)
syms x;
%Torque_x= input ('enter the torque as a function of x ')
T=5*x;%(N-m)
%importing the values from centroid.m
[EI,Icz,Icy,Z,Y, EA, E, IG] = centroid();

I=EI/E;

 %X=input('enter the location where the torque and the angle of twist needs
%to be measured in terms of metre '); --- used in cases where a changing
%torque function needs to be defined.

 %SUbsstituing X to get Torque at that location : Note X is along the axis
 %of the shaft;
 X=3; %x=3m;
 Torque=subs(T,x,X);
 %Stress_max is when x_max
stress_max= Torque* max(Z)/I

%dividing into sun intervals to be able to plot the curve for Shear Stress
ZZ= [min(Z):0.01:max(Z)];
Stress= (stress_max*ZZ)/max(Z);

figure(1)

plot(ZZ,Stress)


    