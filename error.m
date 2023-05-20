% Codigo adaptado para:
% calcular a tensao de saida com base na tensao de entrada
% de um circuito RC paralelo (RC passa - baixa)

clear all,close all, clc
%% x=[0:.1:100]'; k=0.2; y0=200; y=y0.*exp(k.*x); % VALOR EXATO
x=[0:0.00007:.007]'; %% x = tempo t (ms)
y0 = 0;
x0 = 0;
R = 1000; % 1k Ohm
C = 0.000001; % 1uF
tau = R.*C;
y = 1 - exp(-x./tau); %% RESPOSTA EXATA
tensao_inicial = 1; % Volts
a=0; b=0.007; h=7.*10.^(-5);  m=(b-a)/h; xj(1)=x0; yj(1)=y0;  % DADOS PVI

funcao_y_linha = @(ti,yj) (ti - yj)./tau;
%% com base na figura 1, tensao_inicial = u(t)
%%                            0 , t < a
%% considere u(t-a) = ua(t) = 1 , t >= a
%% se a = 0, entao u(t-0) = u(t) = 1
%% Resposta ao degrau unitário do Filtro RC Passa-Baixa.
for j=1:m %% o j é utilizado para calcular cada intervalo de tempo
          %% e tambem a imagem y(j+1)
    xj(j+1)=xj(j)+h;
    yj(j+1)=yj(j)+h.*funcao_y_linha(tensao_inicial,yj(j));
end

j=[0:m]'; ej1=abs((1 - exp(-xj./tau)) - yj);
[j,xj',yj' ej1']


hold on
plot(xj,ej1,'m','Linewidth',.5);




%RK2 - EULER MODIFICADO

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
    K1 = f(xj(j),yj(j)) % ( tensao_inicial - y(j) )./ tau;
    K2 = f( xj(j) + (h./2),yj(j) + (h./2).*K1);%( tensao_inicial - (y(j) + (h./2).*K1) )./ tau;

    yj(j+1) = yj(j) + h.*K2;
    xj(j+1) = xj(j) + h;

end

j=[0:m]'; ej2=abs((1 - exp(-xj./tau)) - yj);
[j,xj',yj' ej2']

plot(xj,ej2,'b','Linewidth',.5)









% RK3

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
    K3 = f( xj(j) + h, yj(j) + 2.*h.*K2 - h.*K1);

    yj(j+1) = yj(j) + (h./6).*(K1 + 4.*K2 + K3);
    xj(j+1) = xj(j) + h;

end


j=[0:m]'; ej3=abs((1 - exp(-xj./tau)) - yj);
[j,xj',yj' ej3']

plot(xj,ej3,'g','Linewidth',.5)


%RK4

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


j=[0:m]'; ej4=abs((1 - exp(-xj./tau)) - yj);

plot(xj,ej4,'r','Linewidth',.5)
