clc, clear all, close all

##Pontos = [2010,30715460; #Produção de leite por ano
##          2011,32096214;
##          2012,32304421;
##          2013,34255236;
##          2014,35124360;
##          2015,34609588;
##          2016,33680401;
##          2017,33313230;
##          2018,33907899;
##          2019,34871669;
##          2020,35316667;
##          2021,35305047];

##Pontos = [2010,3246719;  # producao de ovos(mil duzias) por ano
##          2011,3394020;
##          2012,3473021;
##          2013,3614178;
##          2014,3731796;
##          2015,3768233;
##          2016,3842896;
##          2017,4214488;
##          2018,4430236;
##          2019,4605431;
##          2020,4767519;
##          2021,4849697];

Pontos = [2010,209541109; # cabeças bovinas
          2011,212815311;
          2012,211279082;
          2013,211764292;
          2014,212366132;
          2015,215220508;
          2016,218190768;
          2017,215003578;
          2018,213809445;
          2019,214689984;
          2020,217836282;
          2021,224602112];

N = length(Pontos);

for L = 1 : N

  Xd(L) = Pontos(L,1);
  Yd(L) = Pontos(L,2);

end
%%x = 2009:0.12:2021;
n=1000;
x = linspace(2010,2021,n);
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



##plot(Xd,Yd,'ko',x,y,'r-');


Fig=figure(1);
ax=axes;
a=plot(Xd,Yd,'-ko',x,y,'r-');
set(a,'MarkerSize',9,'Linewidth',2);
L(1)=legend('pontos dados (IBGE)','pontos interpolados');
title('Grafico')
L(2)=xlabel('ANO'); L(3)=ylabel('Gado');
set(L,'fontsize',35);set(ax,'fontsize',30);
set(L(1),'Box','Off','Location','NorthWest','fontsize',25);

axis([x(1) x(length(x)) min(y) max(y)])
grid on

