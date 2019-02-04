
%% User Guide
% Input parameters - Length
% Note - As of now, mass,E cross section has to be given in function centroid.m
% Adaptive finite difference routine inbuilt in matlab is used
% Not yet tested for all cases
[EI,Icz,Icy,Z,Y, EA, E, IG, Cy, Cz, A] = centroid();
global L
%Length
  

% Creates equally spaced 100 points of span L
x=linspace(0,L,100);

% Solver is initialised with zeros
% Critical in non linear equations
% Not so critical here
lambda=1;
ic=bvpinit(x,[0 0],lambda);

% Solution is stored in structured array sol
% Second order equation is reduced to linear system of 4 variables
% right hand side is given by function named rhs_bvp_bars
% Boundary conditions are enforced with the function bc_bvp_bars
% For clarity of order, check out these functions
sol=bvp4c('rhs_bvp_buckling','bc_bvp_buckling',ic);

% Required parameters are extracted from sol
% deval does it for us
% W contains all the parameters
% Namely deflection
W=deval(sol,x);

%%Plotting

figure(1)
plot(x,W(1,:));
title('Deflection vs length')


