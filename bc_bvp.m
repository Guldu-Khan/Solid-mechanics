function bc=bc_bvp(yl,yr)

%% Standard conditions for supporting the beam are enforced in boundary
% Choose whichever suits the situation (uncomment)
% This can be made more user friendly by GUI
% Some more conditions can be added
% Only fixed free is tested

%HINGED HINGED
 bc=[yl(1);yl(3);yr(3);yr(1)];

%FIXED FREE
%bc=[yl(1);yl(2);yr(3);yr(2)];

%FIXED FIXED
%bc=[yl(1);yl(2);yr(2);yr(1)];

%FIXED HINGED
%bc=[yl(1);yr(1);yl(2);yr(3)];

%HINGED FIXED
%bc=[yr(1);yl(1);yr(2);yl(3)];