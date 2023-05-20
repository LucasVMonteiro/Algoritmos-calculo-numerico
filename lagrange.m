% ---------------------------------------------
% INSTITUTO FEDERAL DA PARAÍBA
% CURSO SUPERIOR DE BACHARELADO EM ENGENHARIA ELÉTRICA
% DISCIPLINA: CÁLCULO NUMÉRICO 2020
% INTERPOLACAO: MÉTODO DE LAGRANGE
% JOÃO PESSOA, 26/09/2020.
% AUTOR: PROF. PAULO HENRIQUE DA FONSECA SILVA
% ---------------------------------------------

% VARIAVEIS PRINCIPAIS
% N - numero de pontos dados
% X - vetor que contem as abscissas dos pontos dados
% Y - vetor que contem as ordenadas dos pontos dados
% T - matriz tabela de dados definida por: T=[X' Y']
% x - vetor que contem as abscissas dos pontos interpolados
% y - vetor que contem as ordenadas dos pontos interpolados

clear all, close all, clc

Xd= 2010:2021;
Yd=[11580975 16228961 16711208 12820331 15683860 15875703 21397286 18546377 22622890 17653770 27290800 34896546];
T=[Xd' Yd'];
x = 2010:0.5:2021;
N=length(Xd);
NPi=length(x);

disp('INTERPOLACAO DE LAGRANGE');
disp(' '); disp('TABELA DE PONTOS')
for f=1:N, disp([f Xd(f) Yd(f)]); end
disp(' '); disp('TABELA DE RESULTADOS');

for k=1:NPi
    y(k)=0;
    for i=1:N
        parc=1;
        for j=1:N
            if(i~=j)
                parc=parc*((x(k)-T(j,1))/(T(i,1)-T(j,1)));
            end
        end
        y(k)=y(k)+parc*T(i,2);
    end
    disp([k x(k) y(k)]);
end

% SAÍDA GRÁFICA
Fig=figure(1);
ax=axes;
a=plot(Xd,Yd,'ko',x,y,'r.');
set(a,'MarkerSize',12,'Linewidth',1);
L(1)=legend('pontos dados (IBGE)','pontos interpolados');
title('População Brasileira')
L(2)=xlabel('ANO'); L(3)=ylabel('HAB. (milhões)');
set(L,'fontsize',35);set(ax,'fontsize',30);
set(L(1),'Box','Off','Location','NorthWest','fontsize',25);

axis([2010 2021 10000000 35000000])
grid on

