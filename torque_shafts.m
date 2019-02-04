%shafts Module
%zy plane of cross section
%x- axis of the shaft
function t= shaft(x)
%syms x;
% t_x= input ('enter the distributed torque as a function of x ')
 t=heaviside(x-5)+ 5;%(N-m)





    