%RK4 - Carga_capacitor
clear all,close all, clc
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

f = @(x,y) ( 1 - y )./ tau;

for j=1:m
    K1 = f(xj(j),yj(j))
    K2 = f( xj(j) + (h./2),yj(j) + (h./2).*K1);
    K3 = f( xj(j) + (h./2), yj(j) + (h./2).*K2);
    K4 = f( xj(j) + h , yj(j) + h.*K3);

    yj(j+1) = yj(j) + (h./6).*(K1 + 2.*K2 + 2.*K3 + K4);
    xj(j+1) = xj(j) + h;

end



figure(1);
hold on
plot(x,y,'b','Linewidth',.5)
plot(xj,yj,'k--',xj,yj,'ko','MarkerSize',2)
hold off

L1=xlabel('tempo (ms)');
L2=ylabel('y(t) (volt)');
L3=title('Método de Runge-Kutta de 3ª Ordem');
set(L1,'fontname','TimesNewRoman','FontSize',40);
set(L2,'fontname','TimesNewRoman','FontSize',40);
set(L3,'FontSize',32,'FontWeight','Normal');
axis([0 b 0 1.1])
axis square, box off, grid on
j=[0:m]'; ej=abs((1 - exp(-xj./tau)) - yj);
[j,xj',yj' ej']

figure(2);
plot(xj,ej,'b','Linewidth',.5)
