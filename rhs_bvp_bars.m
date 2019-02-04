function rhs=rhs_bvp_bars(x,y)

% EA is the product of Young's modulus and Area
% p is load distribution along x
[EI,Icz,Icy,Z,Y, EA, E, IG, Cy, Cz, A] = centroid();
p = axial_force_bars(x);
rhs=[y(2);(-p)/EA];
    