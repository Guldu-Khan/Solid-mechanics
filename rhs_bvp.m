function rhs=rhs_bvp(x,y)

% Refer notes(with Sanjay Gorur) for converting to linear system
% EI is the product of Young's modulus and Moment of inertia
% q is the shear force per length 
% Function shear_x is used to input loading

EI=centroid()
q=shear_x(x);
rhs=[y(2);y(3)/EI;y(4);q];
    