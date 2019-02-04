function a1=failure_criterion(A,B,Yield_stress)


%% Failure criteria by Von Mosis 
if ( B(2,2)^2 + B(1,1)^2 - B(1,1)*B(2,2)) < Yield_stress^2
    a1=0;
else
    disp('FAIL')
    a1=1;
end

%% Plotting the ellipse in Von Mosis
figure(2)
ezplot('x^2-x*y+y^2-1');
title('Von Mises envelope');
xlabel('Sigma_x');
ylabel('Sigma_y');
grid on; hold on;
plot(A(1,1)/Yield_stress,A(2,2)/Yield_stress,'o','MarkerSize',10);
axis equal;
axis tight;
