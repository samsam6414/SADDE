function RESULT=LMN(M,N,AC,AS,NTERM,NT,K3)
H=2*pi/real(NT);
SM=(M-1)*H;
SP=(N-1)*H;
FR=0;
FF=0;
FRP=0;
for I=1:NTERM
    FR=AC(I+1)*cos(I*SM)+AS(I)*sin(I*SM)+FR;
    FF=AC(I+1)*cos(I*SP)+AS(I)*sin(I*SP)+FF;
%     FRP=AC(I+1)*(-I)*sin(I*SM)+AS(I)*I*cos(I*SM)+FRP;
end
FR=FR+AC(1);
FF=FF+AC(1);
sum=complex(0,0);
if (M==N)
    RESULT=H*j/4*(1-j*2/pi*(log(K3*FR*H/4)+0.5772156649-1))+H*sum;
else
    BB1=sqrt(FR*FR+FF*FF-2*FR*FF*cos(SM-SP))*K3;
    SUM1=besselh(0,2,BB1);
    RESULT=H*(j/4*SUM1+sum);
end
return
end