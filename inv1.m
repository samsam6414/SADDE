function result = inv1(x,y);
% Objective function for Differential Evolution
%
% Input Arguments:   
% ---------------
% x                  : parameter vector to be optimized
% y                  : data vector (remains fixed during optimization)
%
% Output Arguments:
% ----------------
% result              : objective function value
%
%-----Rosenbrock's saddle------------------
load Esexp 
%Escal=direct(x(1),x(2),x(3),x(4),x(5),x(6),x(7),x(8));
Escal=directH(x(1),x(2),x(3),x(4),x(5),x(6),x(7),x(8),x(9));
resultreg=sqrt(((real(Esexp)-real(Escal)).^2)+((imag(Esexp)-imag(Escal)).^2))./sqrt((real(Esexp).^2)+(imag(Esexp).^2));
[C,R]=size(resultreg);
result=sum(resultreg,'ALL')/(C*R);
    
