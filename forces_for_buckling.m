%noting down the forces to compute moment
function lamda=forces_for_buckling(x,y)
[EI,Icz,Icy,Z,Y, EA, E, IG] = centroid();
I=min(Icz, Icy);
IE=E*I;
P=5;

% HINGED HINGED
M=(-P)*y;
% 
% FIXED HINGED
%L=10; M_o=50;
% M=(-P)*y+ M_o(1-x/L);

%lamda is just a variable here.. doesnt represent shear force
lamda=(M/IE);