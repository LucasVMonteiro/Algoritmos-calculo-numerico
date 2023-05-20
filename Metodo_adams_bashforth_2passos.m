clear all, close all, clc, format long

A=1;
B=2;
H=0.1;
M=(B-A)./H;

% METODO DE EULER

XE(1) = A;
YE(1) = 0;

for J=1:M
  FXY = 1/XE(J);
  YE(J+1) = YE(J) + H*FXY;
  XE(J+1) = XE(J) + H;

end

% Metodo de Adams- Bashforth de dois passos

%VALORES INICIAS
XA(1) = A;
YA(1) = 0;
XA(2) = XE(2);
YA(2) = YE(2);

for J = 2: M
  FXY1 = 1./XA(J-1);
  FXY2 = 1./XA(J);

  YA(J+1) = YA(J) + H./2 .* (3.*FXY2-FXY1);
  XA(J+1) = XA(J) + H;

end

% Resposta exata

X(1) = A
Y(1) = 0;

for J = 1:M

  X(J+1) = X(J) + H;
  Y(J+1) = log(X(J+1));
end

% Tabela de valores numericos

for J=1: M+1;
  S = sprintf('X=%1.7f Y=%1.7f YE=%1.7f YA=%1.7f' , X(J), Y(J), YE(J) , YA(J));
  disp(S);
end

%Saida grafica

fig1 = figure(1);
set(fig1, 'Color', [1 1 1], 'Position', [1 49 1920 946]);
axe = axes;
set(axe,'NextPlot','Add','FontSize',14,'Visible','on','Box','On')
plot(X,Y,'k--',XE,YE,'ro-',XA,YA,'bs-')
xlabel('x');
ylabel('y(x)');
title('Solucoes do PVI dy/dx=1/x, y(1) = 0, na malha [1;2] com h=0.1');
legend('Solução Exata','Método de Euler', 'Método de Adams-Bashforth 2',4);
grid on, axis square;
