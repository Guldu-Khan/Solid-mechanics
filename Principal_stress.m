function B=Principal_stress(A)
%% Convert to principal stress by finding Eigen values
% eig returns Eigen vector
b=eig(A);
B=eye(2);
% Diagonal matrix of eigen values
B(1,1)=b(1);
B(2,2)=b(2);

%% Plotting Mohr's circle

% Centre is (mean of principal stresses,0)
X=(B(1,1)+B(2,2))/2;
% Radius is given below
R=sqrt(((A(1,1)-A(2,2))/2)^2+A(1,2)^2);

%% Plotting a circle
figure(3)
t = linspace(0,2*pi,100);
plot(R*cos(t)+X,R*sin(t)); hold on;
plot(0,0,'o','MarkerSize',4);
grid on;
title('Mohr circle');
hold off;



