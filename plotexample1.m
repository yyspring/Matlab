close all;
 miu=0.02;
 beta=0.2;
 miu1=0.02;      
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
 sqrt(2*(1+c1^2))*(2*miu+beta)
 
 
 
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


b1=sqrt(1+c1^2)*(beta+2*miu);
b2=sqrt(1+c1^2)*beta;
p=[0:0.1:30];
figure(14)
hold on;

plot(t,sr(:,2),'r--','linewidth',2);
plot(t,sr(:,1),'b-','linewidth',2);

plot([0 15],[ b1 b1],'g--','linewidth',2);
plot([0 15],[ -b1 -b1],'g--','linewidth',2);
 set(gca,'FontSize',ft);
 axis([0 15 -0.2 0.5]);
 xlabel('t (sec)');ylabel('s');
grid;
h=legend('$s_2$','$s_1$','$\sqrt{1+c_1^2}(\beta+2\mu)$');
set(h,'Interpreter','latex') ;
box on;
hold off;
% 
figure(5);
hold on;
%stem(trig(:,1), trig(:,2));
plot(trig(:,1), trig(:,2), '+','linewidth',1.5);
 set(gca,'FontSize',ft);
 xlabel('t (sec)');
 ylabel('Inter event time');
 box on;
 hold off;

 
 
 
eig1=[];
for i=1:1000;
b12 = m2*r1*r2*sin(q(i,2));
dq1=qdot(i,1);
dq2=qdot(i,2);
C0 = b12*[-dq1 -2*dq1; 0 dq2];
G0=9.8*[(m1+m2)*r1*cos(q(i,2))+m2*r2*cos(q(i,1)+q(i,2));m2*r2*cos(q(i,1)+q(i,2))];
M0 =[(m1+m2)*r1^2+m2*r2^2+J1+2*m2*r1*r2*cos(q(i,2)) m2*r2^2+m2*r1*r2*cos(q(i,2)); m2*r2^2+m2*r1*r2*cos(q(i,2)) m2*r2^2+J2];
f0=-inv(M0)*(C0*[dq1;dq2]+G0);

lf=15;
qf=[q(i,1);q(i,2);dq1;dq2];
if norm(f0)<=lf*norm(qf)

else
        i
end

end



