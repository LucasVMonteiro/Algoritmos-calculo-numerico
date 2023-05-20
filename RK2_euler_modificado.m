%RK2 - EULER MODIFICADO
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
%% y = tensao_inicial - exp(-x./tau);
%% y' = [tensao_inicial - y(t)] ./  tau;
f = @(x,y) ( 1 - y )./ tau; %% f = y'
for j=1:m
    K1 = f(xj(j),yj(j)); % ( tensao_inicial - y(j) )./ tau;
    K2 = f( xj(j) + (h./2),yj(j) + (h./2).*K1);%( tensao_inicial - (y(j) + (h./2).*K1) )./ tau;

    yj(j+1) = yj(j) + h.*K2;
    xj(j+1) = xj(j) + h;

end

%% y'(t) = (Vin - Vout)/RC
%% K1 = y'(t,Vout) = (Vin - Vout)/RC
%% K2 = y'(t+h, Vout + hK1) = (Vin - (Vout + hK1))/RC
%% function tensao = Tensao_saida(

#ax=axes;

hold on
plot(x,y,'b','Linewidth',.5);
plot(xj,yj,'k--',xj,yj,'ko','MarkerSize',2);
hold off
##set(ax,'Fontsize',24);
L1=xlabel('tempo (ms)');
L2=ylabel('y(t) (volt)');
L3=title('Método de Euler Modificado');
set(L1,'fontname','TimesNewRoman','FontSize',40);
set(L2,'fontname','TimesNewRoman','FontSize',40);
set(L3,'FontSize',32,'FontWeight','Normal');
axis([0 b 0 1.1])
axis square, box off, grid on;
j=[0:m]'; ej=abs((1 - exp(-xj./tau)) - yj);
[j,xj',yj' ej']

