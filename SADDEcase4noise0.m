clc
clear all

start = tic;
tic; 

%calculate iteration time 
% Initialization and run of differential evolution optimizer.
% A simpler version with fewer explicit parameters is in run0.m
%
% Here for Rosenbrock's function
% Change relevant entries to adapt to your personal applications
%
% The file ofunc.m must also be changed 
% to return the objective function
%
% diary('case4noise0')
% VTR		"Value To Reach" (stop when ofunc < VTR)
		VTR =0.000001; 

% D		number of parameters of the objective function 
		D = 9; 

% XVmin,XVmax   vector of lower and bounds of initial population
%    		the algorithm seems to work well only if [XVmin,XVmax] 
%    		covers the region where the global minimum is expected
%               *** note: these are no bound constraints!! ***
% 		XVmin = [0 0 0 0 0 0 0.03 2]; 
% 		XVmax = [0.01 0.01 0.005 0.005 0.005 0.012 0.095 3];
        
%        XVmax = [0.04,  0.008,  0.008,  0.008,  0.008,  0.008,   0.015,  0.008,  0.008]; 
%  		 XVmin = [0.02, -0.002, -0.002, -0.002, -0.002, -0.002,  -0.002, -0.002, -0.002];

        XVmax = [0.04,  0.1,  0.1,  0.1,  0.1,  0.1,   0.1,  0.1,  0.1]; 
        XVmin = [0.02,  0,    0,    0,    0,    0,     0,    0,    0  ];

% y		problem data vector (remains fixed during optimization)
		y=[]; 

% NP            number of population members
		NP = 75; 

% itermax       maximum number of iterations (generations)
		 itermax = 500; 
       

% F             DE-stepsize F ex [0, 2]
		F = 0.86; 
        factor_method=0;
%F_cr
        F_cr=0.55;
        factor_method_cr=0;
        
% CR            crossover probabililty constant ex [0, 1]
		CR = 0.6; 

% strategy       1 --> DE/best/1/exp           6 --> DE/best/1/bin
%                2 --> DE/rand/1/exp           7 --> DE/rand/1/bin
%                3 --> DE/rand-to-best/1/exp   8 --> DE/rand-to-best/1/bin
%                4 --> DE/best/2/exp           9 --> DE/best/2/bin
%                5 --> DE/rand/2/exp           else  DE/rand/2/bin

		strategy = 10;

% refresh       intermediate output will be produced after "refresh"
%               iterations. No intermediate output will be produced
%               if refresh is < 1
		refresh = 1;         
% noise=1+rand*0.01;
 noise=1;
% a1=0.005;a2=0.005;a3=0;a4=0;a5=0;a6=0.01;d=0.06;eps=2.56;
 a1=0.03; a2=0; a3=0;  a4=0; a5=0;  a6=0;  a7=0;  a8=0.004;  a9=0;
% Esexp=direct(a1,a2,a3,a4,a5,a6,d,eps)
Esexp=directH(a1,a2,a3,a4,a5,a6,a7,a8,a9);
% Esexp=directH(ACT,AST)
Esexp=Esexp*noise;
save Esexp Esexp
[x,f,nf] = SADDE('inv1',VTR,D,XVmin,XVmax,y,NP,itermax,F,factor_method,F_cr,factor_method_cr,CR,strategy,refresh);

% Draw the picture

Leader_pos = x;

[x_size,y_size] = size(Leader_pos(1,:));

AC_D = Leader_pos(1,1:y_size-4);
AS_D = Leader_pos(1,y_size-3:y_size);

ACT=[  a1,a2,a3,a4,a5 ]; AST=[  a6, a7, a8, a9 ];

M=0.06;
NDIS=100;
DISR = 0;
NTU=9;
NTERM=(NTU-1)/2;
NTERMT=NTERM;

H=2.*pi/real(NDIS-1);
for I=1:NDIS
           SM=H*(I-1);
           FR=0;
           FF=0;

         for II=1:NTERM
             FF=ACT(II+1)*cos(II*SM)+AST(II)*sin(II*SM)+FF;
             FR=AC_D(II+1)*cos(II*SM)+AS_D(II)*sin(II*SM)+FR;
         end
           FF=ACT(1)+FF;
           FR=AC_D(1)+FR;
           DISR=((FR-FF)/FR).^2/NDIS+DISR;

           X(I)=FR*cos(SM);
           Y(I)=FR*sin(SM);
           x1(I)=FF*cos(SM);
           y1(I)=FF*sin(SM);
end

toc;

DISR = sqrt(DISR)*100 

plot(X,Y,x1,y1);

C=[0 1];
axis square;
colormap(jet);colorbar;
xlabel('X-axis (m)','fontsize',16);
ylabel('Y-axis (m)','fontsize',16);
grid off 
set(gca,'xtick',[-M:0.01:M])
set(gca,'ytick',[-M:0.01:M])
yticklabels([-M:0.01:M]);
% colormapeditor;
axis([-M M -M M]); 

D = duration(0,0,toc,'Format','hh:mm:ss');
title(...
"Iteration: " + itermax  + ", " + ...
"time: " + string(D))

