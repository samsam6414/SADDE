a1=0.005;a2=0.005;a3=0;a4=0;a5=0;a6=0.01;d=0.06;eps=2.56;
[yexp]=fx(a1,a2,a3,a4,a5,a6,d);
load everyitbest;
% load objf
bmi=regbestmemit;
regit=size(regbestmemit);
it=(regit(1))/10;
DF=zeros(1,it+1);
DP=zeros(1,it+1);
DEPS=zeros(1,it+1);
ycal=zeros(1,100);
% objfnew=zeros(1,it);
DP(1)=sqrt((d-bmi(1,7))^2/d^2)*100;
DF(1)=sum(sqrt(((yexp-fx(bmi(1,1),bmi(1,2),bmi(1,3),bmi(1,4),bmi(1,5),bmi(1,6),bmi(1,7))).^2)./(yexp.^2)));
DEPS(1)=sqrt((eps-bmi(1,8))^2/eps^2)*100;
for i=1:it
    DP(i+1)=sqrt((d-bmi(i*10,7))^2/d^2)*100;
    DF(i+1)=sum(sqrt(((yexp-fx(bmi(i*10,1),bmi(i*10,2),bmi(i*10,3),bmi(i*10,4),bmi(i*10,5),bmi(i*10,6),bmi(i*10,7))).^2)./(yexp.^2)));
    DEPS(i+1)=sqrt((eps-bmi(i*10,8))^2/eps^2)*100;
%     objfnew(i)=objf(10*i);
end
xbase=0:it;
x=10*xbase;
%-------------------------------------------------------------figure1
figure(1);
[hAx,hLine1,hLine2] = plotyy(x,DF,x,DP);
hLine1.Color = 'r';
hLine2.Color = 'b';
% set(hAx(1),'YTick',[0:5:40])
% set(hAx(2),'YTick',[0:1:8])
grid on
set(get(hAx(1),'Ylabel'),'String','Relative DF error(%)')
set(get(hAx(2),'Ylabel'),'String','Relative DP error(%)')
xlabel('Generation')
set(hAx(1),'YColor','r')
set(hAx(2),'YColor','b')
legend('DF','DP')
hold on
% plot(x,objfnew)
x1=0:100;
% y11=140*ones(size(x1));
% y12=160*ones(size(x1));
% plot(y11,x1,'k--')
% plot(y12,x1,'k--')
y21=50*ones(size(x1));
y22=30*ones(size(x1));
plot(y21,x1,'k--')
plot(y22,x1,'k--')
hold off
%-------------------------------------------------------------figure2
figure(2);
[hAx,hLine1,hLine2] = plotyy(x,DF,x,DEPS);
hLine1.Color = 'r';
hLine2.Color = '[0.3 0.3 0]';
% set(hAx(1),'YTick',[0:5:40])
% set(hAx(2),'YTick',[0:0.5:4])
grid on
set(get(hAx(1),'Ylabel'),'String','Relative DF error(%)')
set(get(hAx(2),'Ylabel'),'String','Relative DEPS error(%)')
xlabel('Generation')
xlabel('Generation')
set(hAx(1),'YColor','r')
set(hAx(2),'YColor','[0.3 0.3 0]')
legend('DF','DEPS')
hold on
% plot(x,objfnew)
% y11=80*ones(size(x1));
% y12=90*ones(size(x1));
% plot(y11,x1,'k--')
% plot(y12,x1,'k--')
% y21=7*ones(size(x1));
% y22=8*ones(size(x1));
% plot(y21,x1,'k--')
% plot(y22,x1,'k--')
hold off


