% INTERPOLAÇÃO DE NEWTON
% AUTOR: LUCAS VIEIRA MONTEIRO ; MATRICULA = 20212610030

clc, clear all, close all, format long

Pontos = [%2009,191480630;
          2011,192379287;
          2012,193904015;
          2013,201032714;
          2014,202768562;
          2015,204450049;
          2016,206081432;
          2017,207660929;
          2018,208494900;
          2019,210147125;
          2020,211755692;
          2021,213317639];


##Pontos = [0,0;
##    0.2618,1.0353;
##    0.5236, 2.0000;
##    0.7854, 2.8284;
##    1.0472, 3.4641;
##    1.3090, 3.8637];

##Pontos = [2.4,11.2;
##          2.6,13.46;
##          2.8,16.44;
##          3.0,20.08;
##          3.2,24.53;
##          3.4,29.96;
##          3.6,36.59;
##          3.8,44.70];

##Pontos = [0.2618,1.0353; 0.5236,2; 0.7854, 2.8284 ; 1.0472, 3.4642];

##Pontos = [ 0,1.35 ; 1 , 2.94 ];
##Pontos = [ 0, 1.011 ; 0.5 , 1.636 ; 1 , 11.011; 1.5 , 51.636];
N = length(Pontos);

for L = 1 : N

  Xd(L) = Pontos(L,1);
  Yd(L) = Pontos(L,2);

end

%calculando diferenças divididas

%ordem 0
ddY0 = Yd;


%ordem 1
u = N-1;
for i = 1: u
   ddY(i,1) = (ddY0(i+1) - ddY0(i))./(Xd(i+1) - Xd(i));
end
u = u - 1;
%ordem n
for ord = 2: N-1

  for i = 1: u
    ddY(i,ord) = (ddY(i+1,ord-1) - ddY(i,ord-1))./(Xd(i+ord) - Xd(i));
  end
  u = u - 1;
end

%%x = min(Xd):0.5:max(Xd);
%% calculando todos os pontos

x = linspace(min(Xd),max(Xd),1000);
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
  y(K) = y(K) + ddY0(1);
end




plot(Xd,Yd,'ko',x,y,'r-');
##Fig=figure(1);
##ax=axes;
##a=plot(Xd,Yd,'ko',x,y,'r-');
##set(a,'MarkerSize',9,'Linewidth',1);
##L(1)=legend('pontos dos dados','pontos interpolados');
title('Interpolação de NEWTON')
##L(2)=xlabel('x'); L(3)=ylabel('y');
##set(L,'fontsize',35);set(ax,'fontsize',30);
##set(L(1),'Box','Off','Location','NorthWest','fontsize',25);

axis([x(1) x(length(x)) min(y) max(y)]);
grid on



