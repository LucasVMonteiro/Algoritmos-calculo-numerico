%Autor: Lucas Vieira Monteiro
%Matrícula: 20212610030
%Interpolação de Gregory Newton

clc, clear all, close all, format long

## CONJUNTOS DE PONTOS
## basta remover o comentario


##P = [0,0;
##    0.2618,1.0353;
##    0.5236, 2.0000;
##    0.7854, 2.8284;
##    1.0472, 3.4641;
##    1.3090, 3.8637];

                                % NOTAS:
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

P = [2.4,11.2;
          2.6,13.46;
          2.8,16.44;
          3.0,20.08;
          3.2,24.53;
          3.4,29.96;
          3.6,36.59;
          3.8,44.70];

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

% GERANDO INTERVALO em X
x = linspace( min(P(1:n+1,1)) ,max(P(1:n+1,1)) ,50);

yexp = exp(x(1:length(x)));

% CALCULAR TODOS OS PONTOS NO INTERVALO DE X0 A XN

% 'w' equivale a ordem:
% neste caso criei um 'for' que executa o
% calculo do polinomio interpolador Pn no dominio a:b
for w = 1: length(P) - 1
%for w = 1:1
  %%========================================================
  for i = 1: length(x)  %% for i = 1: length(x);  percorre todo o domino, e calcula a imagem de cada x

    z = (x(i) - P(1,1))./h;
    y(i) = P(1,2) + z.*mDF(1,2); % + z.*(z - 1).*(mDF(1,3)./factorial(2));% primeiro Y;

    if( w > 1)
      % somatorio
      flag1 = 1;
      %%========================================================
      for g = 2: w                                               %% loop que calcula os produtos relacionados a 'z':
        produtos_z = z; %z.*(z - 1);                             %% Ex: z(z-1) ; z(z-1)(z-2) ; z(z-1)(z-2)(z-3)
        for j = 1: flag1
          produtos_z = produtos_z.*(z - j);
        end
        flag1 = flag1+1;
        y(i) = y(i) + produtos_z.*(mDF(1,g+1)./factorial(g));    %% Executa o passo equivalente a: somas_anteriores + z(z-1)...(z-(n-1))(diferenca finita)(1/fatorial(n))
      end
      %%========================================================
    end
    %% Calculo dos ERROS ponto a ponto
    E(i,w) = abs( yexp(i) - y(i) );                             %% erro de interpolacao para cada imagem

    %% Armazenamento em 'my'
    my(i,w) = y(i);                                              %% a cada iteração de "for i = 1: length(x);"
  end                                                            %% o loop é finalizado com o armazenamento da imagem
                                                                 %% numa matriz "my" - matrix y - que agrupa todas as
                                                                 %% imagens geradas para cada ordem "w"
  %%========================================================

end





for w = 1: length(P) - 1
%for w = 1:1
  %%========================================================
    z = (pi - P(1,1))./h;
    y1 = P(1,2) + z.*mDF(1,2); % + z.*(z - 1).*(mDF(1,3)./factorial(2));% primeiro Y;

    if( w > 1)
      % somatorio
      flag1 = 1;
      %%========================================================
      for g = 2: w                                               %% loop que calcula os produtos relacionados a 'z':
        produtos_z = z; %z.*(z - 1);                             %% Ex: z(z-1) ; z(z-1)(z-2) ; z(z-1)(z-2)(z-3)
        for j = 1: flag1
          produtos_z = produtos_z.*(z - j);
        end
        flag1 = flag1+1;
        y1 = y1 + produtos_z.*(mDF(1,g+1)./factorial(g));    %% Executa o passo equivalente a: somas_anteriores + z(z-1)...(z-(n-1))(diferenca finita)(1/fatorial(n))
      end
      %%========================================================
    end

    Ei(w) = abs( exp(pi) - y1 );
end








%%========================================================
subplot(2,2,1)
##figure(1)
% PLOTAR O GRAFICO DOS POLINOMIOS E FUNCAO EXP
cores = ['r-','b-','k-','m-','c-','y-','g-'];
for ordpt = 1: columns(my)                        %% Plota o grafico de cada ordem 'w'
                                                  %% pode ser executado ate 7 vezes
  plot(x,my(1:size(my)(1),ordpt),cores(ordpt));   %% caso ultrapasse pode surgir um erro
  hold on                                         %% pois length(cores) é 7

end

plot(P(1:size(P)(1),1),P(1:size(P)(1),2),'ko');  %% os pontos dos dados utilizados

##plot(x,my(1:size(my)(1),5),'r-');
title('Interpolação de GREGORY-NEWTON');
%%axis([x(1) x(length(x)) min(P(1:size(P)(1),2)) max(P(1:size(P)(1),2)) ]);
#axis([x(1) x(length(x)) min(P(1:size(P)(1),2)) 5 ]);
grid on
axis([x(1) x(length(x))]);
if(n==7)
  L1=legend( 'n = 1','n = 2','n = 3','n = 4','n = 5','n = 6','n = 7');
  set(L1,'Location','NorthWest','fontsize',16);
end

%%========================================================


%%========================================================
subplot(2,2,2)
##figure(2)
%Grafico dos erros
for ordpt = 1: columns(my)                        %% Plota o grafico de cada ordem 'w'

                %% pode ser executado ate 7 vezes
  plot(x,E(1:size(E)(1),ordpt),cores(ordpt));   %% caso ultrapasse pode surgir um erro
  hold on                                         %% pois length(cores) é 7

end

title('Erros entre Pn e EXP a cada ponto X');
axis([x(1) x(length(x))]);
grid on
if(n==7)
  L2=legend( 'n = 1','n = 2','n = 3','n = 4','n = 5','n = 6','n = 7');
  set(L2,'Location','NorthWest','fontsize',16);
end

%%========================================================


subplot(2,2,3)
plot(x,yexp,'r-');
title("Função exp(x)");
grid on
axis([x(1) x(length(x))]);

subplot(2,2,4)
plot(1:7,Ei,'r-');
axis([1 7 -1 3.6]);
hold on




title("Ei(n) x N");
grid on
axis([1 7]);


