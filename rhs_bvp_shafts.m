function rhs=rhs_bvp_shafts(x,y)

% IG is the product of Area Inertia and Rigidity Modulus
% t is torque distribution along x

[EI,Icz,Icy,Z,Y, EA, E, IG, Cy, Cz, A] = centroid();
t = torque_shafts(x);
rhs=[y(2);(-t)/IG];
    