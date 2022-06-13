aexact=[0.005,0.005,0,0,0,0.01,0.06];
a1=0.005;a2=0.005;a3=0;a4=0;a5=0;a6=0.01;d=0.06;eps=2.56;
load everyitbest
ath= regbestmemit(1,1:7);
afinal=regbestmemit(500,1:7);
[xexa,yexa]=plotfx(aexact);
[xth,yth]=plotfx(ath);
[xfinal,yfinal]=plotfx(afinal);
plot(xfinal(1:2:100),yfinal(1:2:100),'gx','linewidth',1.2)
hold on
plot(xth,yth,'r','linewidth',1.2)
plot(xexa,yexa,'k-','linewidth',1.2)
h=legend('Final Generation','First Generation','Exact');
set(h,'Fontsize',10);
xlabel('X-axis(m)','Fontsize',14)
ylabel('Y-axis(m)','Fontsize',14)
xr=-0.05:0.01:0.05;
yr=0.01*ones(1,11);
xr1=0.01*ones(1,10);
yr1=-0.04:0.01:0.05;
plot(xr,yr,'w')
plot(xr1,yr1,'w')
hold off