close all;
  miu=0.02;

       miu1=0.02;   
%     miu=0.01;
%  beta=0.1;
%        miu1=0.01;     
	D=u(:,1);
c1=0.4;


J1=5;
J2=5;
r1=1;
r2=0.8;
m1=0.5;
m2=1.5;



n=length(D);    
Dsub=[0;D(1:n-1,1)];
Comp=abs(D-Dsub)~=0;
trigs=Comp;

n1=length(D);
j=0;
i0=1;
for i=2:n1
    if abs(D(i)-D(i-1))<0.0001
    else
        j=j+1
         trig(j,1)=t(i);
           trig(j,2)=t(i)-t(i0);
              i0=i;
    end
end
 
 
 
 
ft=14;
figure(1)
hold on;
plot(t,qd(:,1),'b','linewidth',2);
plot(t,q(:,1),'r--','linewidth',2);
plot(t,qd(:,2),'-','Color',[1 0.8 0],'linewidth',2);
plot(t,q(:,2),'--','Color',[0.1 0.7 0.2],'linewidth',2);
 set(gca,'FontSize',ft);
grid;
legend('q_{d1}','q_1','q_{d2}','q_2');
 xlabel('t (sec)');ylabel('Angles (rad)');
box on;
hold off;

% figure(2)
% hold on;
% plot(t,qddot(:,1),'b','linewidth',2);
% plot(t,qdot(:,1),'r--','linewidth',2);
% plot(t,qdot(:,2),'c--','linewidth',2);
% plot(t,qddot(:,2),'Color',[0 0.8 0.5],'linewidth',2);
% 
% grid;
% box on;
% legend('qddot1','qdot1','qdot2','qddot2');
% hold off;


% % 
figure(4)
hold on;
plot(t,qu(:,1),'b-','linewidth',2);
plot(t,qu(:,2),'r--','linewidth',2);
grid;
 set(gca,'FontSize',ft);
  xlabel('t (sec)');ylabel('u');
legend('u1','u2');
box on;
hold off;


 
  n1= length(zetav);
ez=zetav([floor(0.5*n1):n1],:);

normv=sqrt(sum(ez.^2, 2));
maxnorm=max(normv)
 
 
 
