function W=MOS_Moment_diagram(L,n)
%% User Guide
% Input parameters - Length
% Note - As of now, mass,E cross section has to be given in function centroid.m
% Adaptive finite difference routine inbuilt in matlab is used
% Not yet tested for all cases

% global L
% Length
% L = 10;    

% Creates equally spaced 100 points of span L
x=linspace(0,L,n);

% Solver is initialised with zeros
% Critical in non linear equations
% Not so critical here
ic=bvpinit(x,[0 0 0 0]);

% Solution is stored in structured array sol
% Fourth order equation is reduced to linear system of 4 variables
% right hand side is given by function named rhs_bvp
% Boundary conditions are enforced with the function bc_bvp
% For clarity of order, check out these functions
sol=bvp4c('rhs_bvp','bc_bvp',ic);

% Required parameters are extracted from sol
% deval does it for us
% W contains all the parameters
% Namely deflection, flexure, moment and shear force
W=deval(sol,x);

%%Plotting

figure(1)
subplot(4,1,1)
plot(x,W(1,:));
title('Deflection vs length')
subplot(4,1,2)
plot(x,W(2,:));
title('Slope of deflection vs length')
subplot(4,1,3)
plot(x,W(3,:));
title('Bending Moment vs length');
subplot(4,1,4)
plot(x,W(4,:));
title('Shear Force vs length');
