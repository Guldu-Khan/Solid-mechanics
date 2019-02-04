%% General distribution as a function of x is returned
% Select the two singularity functions if required
function rhs = shear_x(x)

% Can handle singularity functions as well
% Heaviside function in built in matlab is used for step
% Unfortunately, dirac function in matlab can't be used as it 
% blows up the linear system
% Doesn't work so well with point moments

% Step function for q
rhs = 1e2*(heaviside(x-5)-heaviside(x-5.1));
% rhs=1e4;
% rhs=1e4*heaviside(x-4);
% Dirac function for q at x=2 
% First order approxiamtion of heaviside function is used to create the 
% Dirac function
% Seems to be working fine
 % rhs = 2*(heaviside(x-0.1)-heaviside(x))/0.1;
% rhs = dirac(x);
