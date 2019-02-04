function [Y Z] = circle(r)
th = 0:pi/50:2*pi;
Z = r * cos(th);
Y = r * sin(th);

