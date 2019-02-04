function [EI,Icz,Icy,Z,Y, EA, E, IG, Cy, Cz, A] = centroid();
%%
% Program to find centroid and moment of inertia(axid normal) of a polygon
% Moment of inertia is about (0,0)
% Our cross section is approximated to be a polygon
% Refer wikipedia for formula - https://en.wikipedia.org/wiki/Centroid#Centroid_of_polygon
% Refer https://en.wikipedia.org/wiki/List_of_moments_of_inertia
% Tested for square and triangle as test cases
% Input is given in one sense - clockwise or anticlockwise
% The last point is same as the first point and must be given as the input
% Works only for  polygons 
% i.e., there must be an area enclosed
%%
 E=10^9;
 G=80*10^12;
%  r= input('enter the radius ');
% [Y Z] = circle(r);
 Z=[1 1 -1 -1 1];
  Y=[1 -1 -1 1 1];
% Pre-allocating memory (initialising)
cz=0;
cy=0;
A=0;
ioz=0;
ioy=0;

sizez=size(Z);

for i=1:sizez(2)-1
    A = A + 0.5*(Z(i)*Y(i+1) - Z(i+1)*Y(i));
    cz = cz + (Z(i)+Z(i+1))*(Z(i)*Y(i+1) - Z(i+1)*Y(i));
    cy = cy + (Y(i)+Y(i+1))*(Z(i)*Y(i+1) - Z(i+1)*Y(i));
    ioz = ioz + (Y(i).^2+Y(i+1).^2+Y(i)*Y(i+1))*(Z(i)*Y(i+1) - Z(i+1)*Y(i));
    ioy = ioy + (Z(i).^2+Z(i+1).^2+Z(i)*Z(i+1))*(Z(i)*Y(i+1) - Z(i+1)*Y(i));
end

% Ix is integral y2da
% Iy is integral x2da
% Icx and Icy are area moments passing through centroid

Cz = cz/(6*A);
Cy = cy/(6*A);
Ioz = abs(ioz/12);
Ioy = abs(ioy/12);
Icz = Ioz + abs(A*Cy^2);
Icy = Ioy + abs(A*Cz^2);

%Plotting profile of the polygon
%plot(X,Y); 
EA=abs(A)*E;
EI=Icz*E;
IG=Icz*G;


