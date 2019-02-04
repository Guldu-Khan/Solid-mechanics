close all; clear all; clc;
%% Main program - run this
% Defining variables

global L;   %Length
global n;   % Number of divisions
global Yield_stress;    
%% Initialising variables
L = 10;
n=100;
Yield_stress=9.3;
[EI,Icz,Icy,Z,Y, EA, E, IG, Cy, Cz, A] = centroid();

%% Select which element 
a=input('Enter 1 for shaft, 2 for beam, 3 for bars');

if a==1
    % Run torsion module
   W= angleoftwist_and_Torque_diagram_for_shafts(L,n);
 
     
%% Finding stresses
    
     ystep=1;
        for  y=min(Y):1:max(Y)
  %          Sigma_x(ystep,:)=(W(3,:).*(y-Cy))./Icz;
            
        for j=1:n
           Sigma_y(ystep,j)=W(2,j)./(EI*max(Y)/E);
        end
        ystep=ystep+1;
        end
        
          %% PLotting pcolor
             %Creating meshgrid to plot variation     
      
        dummy_1=linspace(0,L,n);
        dummy_2=linspace(min(Y),max(Y),((max(Y)-min(Y))/1+1));
        [dum_2,dum_1]=meshgrid(dummy_1,dummy_2);
      
        
        figure(5)
        pcolor(dum_2,dum_1,Sigma_y); colorbar;
        shading interp;
        ylabel('Height')
        xlabel('Length')
        drawnow;
        
       %% Failure criterion
       Test_fail=zeros(2);
       a1=0;
 
       for j=1:n
           for i=1:ystep-1
             if a1==0
%                
%                  Test_fail(1,1,i,j)=Sigma_x(i,j);
                 Test_fail(1,2,i,j)=Sigma_y(i,j);
                 Test_fail(2,1,i,j)=Test_fail(1,2,i,j);
                 Test_Principal(:,:,i,j)=Principal_stress(Test_fail(:,:,i,j));
                 a1=failure_criterion(Test_fail(:,:,i,j),Test_Principal(:,:,i,j),Yield_stress);
             else
                 break;
                 break;
             end
           
              
          
           end
       end
 
elseif a==2
    % Run beam module
    % loading given in shear_x
    % Cross section and geometric parameters in centroid
     W =  MOS_Moment_diagram(L,n);
     
%% Finding stresses
    
     ystep=1;
        for  y=min(Y):1:max(Y)
            Sigma_x(ystep,:)=(W(3,:).*(y-Cy))./Icz;
            
        for j=1:n
           Sigma_y(ystep,j)=W(4,j)./A;
        end
        ystep=ystep+1;
        end
        
          %% PLotting pcolor
             %Creating meshgrid to plot variation     
      
        dummy_1=linspace(0,L,n);
        dummy_2=linspace(min(Y),max(Y),((max(Y)-min(Y))/1+1));
        [dum_2,dum_1]=meshgrid(dummy_1,dummy_2);
      
        
        figure(5)
        pcolor(dum_2,dum_1,Sigma_x); colorbar;
        shading interp;
        ylabel('Height')
        xlabel('Length')
        drawnow;
        
       %% Failure criterion
       Test_fail=zeros(2);
       a1=0;
 
       for j=1:n
           for i=1:ystep-1
             if a1==0
               
                 Test_fail(1,1,i,j)=Sigma_x(i,j);
                 Test_fail(1,2,i,j)=Sigma_y(i,j);
                 Test_fail(2,1,i,j)=Test_fail(1,2,i,j);
                 Test_Principal(:,:,i,j)=Principal_stress(Test_fail(:,:,i,j));
                 a1=failure_criterion(Test_fail(:,:,i,j),Test_Principal(:,:,i,j),Yield_stress);
             else
                 break;
                 break;
             end
           
              
          
           end
       end
 
  
  %% Failure criterian
% Input 2-d stress
% Convert to principle stress
% Apply criterian
% Plot envelope

% Principal stress - B
%  B=Principal_stress(A);
%  failure_criterion(A,Yield_Stress);



     
elseif a==3
    % Run bars module
     W=  displacement_and_force_diagram_for_bars(L,n);

%% Finding stresses
    
     ystep=1; sigma_y=0;
        for  y=min(Y):1:max(Y)
            Sigma_x(ystep,:)=(W(2,:)/A) ;
               ystep=ystep+1;
        end
        
          %% PLotting pcolor
             %Creating meshgrid to plot variation     
      
        dummy_1=linspace(0,L,n);
        dummy_2=linspace(min(Y),max(Y),((max(Y)-min(Y))/1+1));
        [dum_2,dum_1]=meshgrid(dummy_1,dummy_2);
      
        
        figure(5)
        pcolor(dum_2,dum_1,Sigma_x); colorbar;
        shading interp;
        ylabel('Height')
        xlabel('Length')
        drawnow;
        
       %% Failure criterion
       Test_fail=zeros(2);
       a1=0;
 
       for j=1:n
           for i=1:ystep-1
             if a1==0
               
                 Test_fail(1,1,i,j)=Sigma_x(i,j);
                 Test_fail(2,1,i,j)=Test_fail(1,2,i,j);
                 Test_Principal(:,:,i,j)=Principal_stress(Test_fail(:,:,i,j));
                 a1=failure_criterion(Test_fail(:,:,i,j),Test_Principal(:,:,i,j),Yield_stress);
             else
                 break;
                 break;
             end
           
              
          
           end
       end
 
else error('Input wrong')
end


