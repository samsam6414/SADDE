function ET=EOUT(X,Y,AC,AS,NTERM,BN,N,K3)
% CR=complex(0,0);
% E1=exp(-j*K1*(X*sin(FI1)+(Y+A)*cos(FI1)))+CR*exp(-j*K1*(X*sin(FI1)-(Y+A)*cos(FI1)));
RESULT=0;

H=2*pi/real(N);

for I=1:N
    SP=(I-1)*H;
    FF=0;
    for II=1:NTERM
        FF=AC(II+1)*cos(II*SP)+AS(II)*sin(II*SP)+FF;
    end
    FF=FF+AC(1);
    BB1=sqrt((X-(FF*cos(SP))).^2+(Y-(FF*sin(SP))).^2)*K3;
%   BB1=sqrt((X-FF*cos(SP)).^2+(Y-FF*sin(SP)).^2)*K3;
    SUM1=besselh(0,2,BB1);
    RESULT=BN(I)*SUM1*j/4*H+RESULT;
end
% ET=E1-RESULT;
 ET=-RESULT;
return
end