function BN=INCUR(AC,AS,NTERM,N)
global  FI3 A K3 
H=2*pi/real(N);
for I=1:N
    SM=H*(I-1);
    FF=0;
    for II=1:NTERM
        FF=AC(II+1)*cos(II*SM)+AS(II)*sin(II*SM)+FF;
    end
    F=FF+AC(1);
    E3SM(I,1)=exp(-j*K3*((F*cos(SM))*sin(FI3)+(F*sin(SM)+A)*cos(FI3)));
%   E3SM(I,1)=exp(-j*K3*(F*cos(SM)*sin(FI3)+(F*sin(SM)+A)*cos(FI3)));
    for II=1:N
        RESULT=LMN(I,II,AC,AS,NTERM,N,K3);
        LNN(I,II)=RESULT;
    end
end
% LNNINV=inv(LNN);
% BN=LNNINV*E3SM;
BN=LNN\E3SM;
return
end