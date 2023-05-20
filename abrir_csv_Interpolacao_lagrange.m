
% INTERPOLAÇÃO DE LAGRANGE
% 03/10/2022 23:35
% O QUE FAZ?
% ABRE UM ARQUIVO CSV, CONVERTE EM UMA TABELA Nx2, APLICA INTERPOLAÇÃO DE LAGRANGE
% AUTOR: LUCAS VIEIRA MONTEIRO ; MATRICULA = 20212610030

clc, clear all, close all

nome_arquivo = "banana-mil-reais.csv"
caminho = strcat("dados/", nome_arquivo);

dados = csvread(caminho);
Pontos = dados( 2:length(dados) , : );

N = length(Pontos);

for L = 1 : N

  Xd(L) = Pontos(L,1);
  Yd(L) = Pontos(L,2);

end

% x = 2009:0.12:2021;
x = min(Xd) : 0.12 : max(Xd);

for K = 1 : length(x)
  y(K) = 0;
  %for - somatorio
  for i = 1 : N
    produt = 1;
    %for - produtorio
    for j = 1 : N
      if (j ~= i)
        produt = produt*((x(K) - Xd(j)) / (Xd(i) - Xd(j)));
      endif
    endfor

    y(K) = y(K) + produt*Yd(i);
  end

end

% plot(Xd,Yd,'ko',x,y,'r.');
%plot(x,y);

Fig=figure(1);
ax=axes;
a=plot(Xd,Yd,'ko',x,y,'r-');
set(a,'MarkerSize',14,'Linewidth',4);
L(1)=legend('pontos dados (IBGE)','pontos interpolados');
title('Grafico')
L(2)=xlabel('X'); L(3)=ylabel('Y');
set(L,'fontsize',35);set(ax,'fontsize',30);
set(L(1),'Box','Off','Location','NorthWest','fontsize',25);

axis([min(Xd) max(Xd) min(Yd)-1 max(Yd)+1])
grid on



