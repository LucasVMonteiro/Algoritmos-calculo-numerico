% INTERPOLAÇÃO DE NEWTON
% AUTOR: LUCAS VIEIRA MONTEIRO ; MATRICULA = 20212610030

clc, clear all, close all, format long

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

##Pontos = [2010,209541109; # cabeças bovinas
##          2011,212815311;
##          2012,211279082;
##          2013,211764292;
##          2014,212366132;
##          2015,215220508;
##          2016,218190768;
##          2017,215003578;
##          2018,213809445;
##          2019,214689984;
##          2020,217836282;
##          2021,224602112];

Pontos = [2.4,11.2;
          2.6,13.46;
          2.8,16.44;
          3.0,20.08;
          3.2,24.53;
          3.4,29.96;
          3.6,36.59;
          3.8,44.70];

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


%% calculando para pi

yi = 0;
  %for - somatorio
  for i = 1 : N-1
    produt = 1;
    %for - produtorio
    for j = 1 : i
      produt = produt*(pi - Xd(j));
    end
    %diferença dividida de ordem i

    yi = yi + produt*ddY(1,i);
  end
  yi = yi + ddY0(1);

disp(["P",num2str(N),"(pi) = ",num2str(yi)]);
disp(["exp(pi) = ", num2str(exp(pi))]);
inter_Erro = exp(pi) - yi;
disp(["Erro de interpolação: exp(pi) - P",num2str(N),"(pi) = ",num2str(exp(pi))," - ",num2str(yi)]);
disp(["= ",num2str(inter_Erro)]);

subplot(1,2,1)
plot(Xd,Yd,'ko',x,y,'r-');
title('Grafico do Polinomio de Newton')
axis([x(1) x(length(x)) min(y) max(y)]);
grid on
subplot(1,2,2)
plot(x,exp(x),'g-');
title('Grafico de exp(x)')
##Fig=figure(1);
##ax=axes;
##a=plot(Xd,Yd,'ko',x,y,'r-');
##set(a,'MarkerSize',9,'Linewidth',1);
##L(1)=legend('pontos dos dados','pontos interpolados');
##title('Grafico')
##L(2)=xlabel('x'); L(3)=ylabel('y');
##set(L,'fontsize',35);set(ax,'fontsize',30);
##set(L(1),'Box','Off','Location','NorthWest','fontsize',25);

axis([x(1) x(length(x)) min(y) max(y)]);
grid on

exp_pi = exp(pi);



