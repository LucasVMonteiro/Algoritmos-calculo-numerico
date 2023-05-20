% INTERPOLAÇÃO DE NEWTON
% AUTOR: LUCAS VIEIRA MONTEIRO ; MATRICULA = 20212610030

clc, clear all, close all, format long

##Pontos = [2009,191480630;
##          2011,192379287;
##          2012,193904015;
##          2013,201032714;
##          2014,202768562;
##          2015,204450049;
##          2016,206081432;
##          2017,207660929;
##          2018,208494900;
##          2019,210147125;
##          2020,211755692;
##          2021,213317639];

##Pontos = [ 0,1.35 ; 1 , 2.94 ];
Pontos = [ 0, 1.011 ; 0.5 , 1.636 ; 1 , 11.011; 1.5 , 51.636];
N = length(Pontos);

for L = 1 : N

  Xd(L) = Pontos(L,1);
  Yd(L) = Pontos(L,2);

end

%calculando diferenças divididas

%ordem 0
for q = 1:N

  ddY(q,1) = Yd(q);
end
u = N-1;
%ordem n
for ord = 2: N

  for i = 1: u
    ddY(i,ord) = (ddY(i+1,ord-1) - ddY(i,ord-1))./(Xd(i+ord-1) - Xd(i));
  end
  u = u - 1;
end

x = min(Xd):0.5:max(Xd);

for K = 1 : length(x)
  y(K) = 0;
  %for - somatorio
  for i = 1 : N-1
    produt = 1;
    %for - produtorio
    for j = 1 : i
      produt = produt*(x(K) - Xd(j));
    end
    %diferença dividida de ordem i

    y(K) = y(K) + produt*ddY(1,i);
  end
  y(K) = y(K) + ddY(1,1);
end

Fig=figure(1);
ax=axes;
a=plot(Xd,Yd,'ko',x,y,'r-');
set(a,'MarkerSize',9,'Linewidth',1);
L(1)=legend('pontos dos dados','pontos interpolados');
title('Grafico')
L(2)=xlabel('x'); L(3)=ylabel('y');
set(L,'fontsize',35);set(ax,'fontsize',30);
set(L(1),'Box','Off','Location','NorthWest','fontsize',25);

axis([min(Xd) max(Xd) min(y) max(y)])
grid on



