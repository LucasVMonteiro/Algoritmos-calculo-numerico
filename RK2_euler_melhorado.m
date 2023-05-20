%RK2 - EULER MELHORADO
clear all,close all, clc, format long
% DADOS DO PVI
R = 1000;
C = 0.000001;
tensao_inicial = 1;
tau = R.*C;
a=0; b=7E-3; m=100; h=(b-a)/m;
xj(1) = 0;
yj(1) = 0;
x=[0:0.00007:.007]'; %% x = tempo t (ms)
y = 1 - exp(-x./tau); %% RESPOSTA EXATA

f = @(x,y) ( 1 - y )./ tau; %% f = y'
for j=1:m
    K1 = f(xj(j),yj(j)); % ( tensao_inicial - y(j) )./ tau;
    K2 = f( xj(j) + h,yj(j) + h.*K1);%( tensao_inicial - (y(j) + (h./2).*K1) )./ tau;

    yj(j+1) = yj(j) + (h./2).*(K1 + K2);
    xj(j+1) = xj(j) + h;

end



hold on
plot(x,y,'b','Linewidth',.5)
plot(xj,yj,'k--',xj,yj,'ko','MarkerSize',2)
hold off
##set(ax,'Fontsize',24);
L1=xlabel('tempo (ms)');
L2=ylabel('y(t) (volt)');
L3=title('Método de Euler Melhorado');
set(L1,'fontname','TimesNewRoman','FontSize',40);
set(L2,'fontname','TimesNewRoman','FontSize',40);
set(L3,'FontSize',32,'FontWeight','Normal');
axis([0 b 0 1.1])
axis square, box off, grid on
j=[0:m]'; ej=abs((1 - exp(-xj./tau)) - yj);
[j,xj',yj' ej']

