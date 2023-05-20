%Autor: Lucas Vieira Monteiro
%Matrícula: 20212610030
%Interpolação de Gregory Newton

clc, clear all, close all, format long

P = [0,0;
    0.2618,1.0353;
    0.5236, 2.0000;
    0.7854, 2.8284;
    1.0472, 3.4641;
    1.3090, 3.8637];

##                                % NOTAS:
##P = [%2009,191480630;           % *2009,191480630 é omitido pois o
##          2011,192379287;       % espaçamento entre ele e o proximo
##          2012,193904015;       % ponto X é DIFERENTE do espaçamento
##          2013,201032714;       % entre outras abcissas
##          2014,202768562;
##          2015,204450049;
##          2016,206081432;
##          2017,207660929;
##          2018,208494900;
##          2019,210147125;
##          2020,211755692;
##          2021,213317639];

h = P(2,1) - P(1,1);


% calcular as DIFERENÇAS DIVIDIDAS

n = length(P) - 1;                % simboliza o numero de diferencas finitas
mDF = P(1:n+1,2);                 % matriz das diferencas finitas
n_linhas = 0;                     % numero de linhas que devem ser ignoradas
for c = 2: length(P)

  for l = 1: n - n_linhas         % conta de 1 ate n - total de linhas ignoradas
     mDF(l,c) = mDF(l+1,c-1) - mDF(l,c-1);
  end
  n_linhas = n_linhas + 1;
end

% calculando para x = 0.6545;

x = 0.6545;

z = (x - P(1,1))./h;
y = P(1,2) + z.*mDF(1,2); % + z.*(z - 1).*(mDF(1,3)./factorial(2));% primeiro Y;

if( n > 1)
  % somatorio
  flag1 = 1;
  for g = 2: n
    produtos_z = z; %z.*(z - 1);
    for j = 1: flag1
      produtos_z = produtos_z.*(z - j);
      j
    end
    flag1 = flag1+1;
    y = y + produtos_z.*(mDF(1,g+1)./factorial(g));
  end
end
y

% GERANDO INTERVALO em X
x = linspace( min(P(1:n+1,1)) ,max(P(1:n+1,1)) ,50);

% CALCULAR TODOS OS PONTOS NO INTERVALO DE X0 A XN


% somatorio
%z = (x(i) - P(1,1))./h;
%y = P(1,2) + z.*mDF(1,2) + z.*(z - 1).*(mDF(1,3)./factorial(2));% primeiro Y;

for i = 1: length(x);

  z = (x(i) - P(1,1))./h;
  y(i) = P(1,2) + z.*mDF(1,2); % + z.*(z - 1).*(mDF(1,3)./factorial(2));% primeiro Y;

  if( n > 1)
    % somatorio
    flag1 = 1;
    for g = 2: n
      produtos_z = z; %z.*(z - 1);
      for j = 1: flag1
        produtos_z = produtos_z.*(z - j);
      end
      flag1 = flag1+1;
      y(i) = y(i) + produtos_z.*(mDF(1,g+1)./factorial(g));
    end
  end
end

% PLOTAR O GRAFICO
plot(x,y,'r-',P(1:length(P),1),P(1:length(P),2),'ko');
title('Interpolação de GREGORY-NEWTON')
axis([x(1) x(length(x)) min(y) max(y)]);
grid on

