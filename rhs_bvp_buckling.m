function rhs=rhs_bvp_buckling(x,y)


[EI,Icz,Icy,Z,Y, EA, E, IG, Cy, Cz, A] = centroid();
I=min(Icz, Icy);
IE=E*I;
P=5;
% HINGED HINGED
%defining the moments for each case separately 
M=(-P)*y(1);

% FIXED HINGED
% L=10; M_o=50;
% %M depends on x, that is why the imput parameter x
%  M=(-P)*y(1)+ M_o*(1-x/L);

rhs=[y(2);M/IE];
    