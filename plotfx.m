function [x,fx]=plotfx(a)
cns=100;
xplot=0:100;
x=xplot*a(7)/cns-a(7)/2;
fx=a(1)*cos(2*pi/a(7)*x)+a(2)*cos(2*pi/a(7)*2*x)+a(3)*cos(2*pi/a(7)*3*x)+a(4)*sin(2*pi/a(7)*x)+a(5)*sin(2*pi/a(7)*2*x)+a(6)*sin(2*pi/a(7)*3*x);

