% INSTITUTO FEDERAL DA PARAÍBA
% CURSO SUPERIOR DE BACHARELADO EM ENGENHARIA ELÉTRICA
% CÁLCULO NUMÉRICO 2020
% EQUACÖES TRANSCENDENTES E ALGÉBRICAS
% CALCULO DE RAÍZES - MÉTODO DE NEWTON
% AUTOR: PROF. PAULO HENRIQUE DA FONSECA SILVA
% p(x)=x^(3) - 6*x^(2) + 11*x - 6
% p'(x) = 3*x^(2) - 12*x + 11
% x(n+1) = x(n) - ( p(x(n)) / p'(x(n)) )

% Atualizado por: Lucas Vieira Monteiro
% + Agora o programa percorre os 3 intervalos para encontrar as 3 raizes
% + Adicionado dois modos de plot

clear all, close all, clc, format long
TOL=1E-6; Nmax=15;


% essa variavel permite que a tolerancia seja verificada ou não
% sendo verificada, o laço while sera interrompido ao atingir um valor menor que a tolerancia
verificar_tolerancia = false;

% opt_plot controla o tipo de plot do grafico de convergencia
% 1 - Todos três gráficos no mesmo plano
% 2 - Todos três gráficos na mesma janela e separados
opt_plot = 1;


% Intervalos em que o algoritmo ira buscar as raizes
la = [0 1.6 2.6];
lb = [1.6 2.3 3.6];

for i=1:3

  a=la(i); b=lb(i); x(1)=a;

  % essas linhas sao responsaveis por testar o valor inicial de x
  % EXEMPLO:
  %         seja x = a, se p(x) * p''(x) > 0 então x = a
  %         seja x = a, se p(x) * p''(x) < 0 então x = b

  produto = (x(1).^(3) -6.*x(1).^(2) +11.*x(1) -6) * (6.*x(1) - 12);
  %verifique se p(x) * p''(x) < 0
  if(produto < 0)

    %se x == a, entao x = b
    if(x(1) == a)
      x(1) = b;

    %se x == b, entao x = a
    elseif(x(1) == b)
      x(1) = a;
    endif

  endif

  % fim do teste de valor inicial

  n=1; e(1)=0; CP=1;
  while(n<=Nmax)
   %  p = (x(n).^(3) -6.*x(n).^(2) +11.*x(n) -6);
   %  dp = (3.*x(n).^(2) -12.*x(n) +11);
   %  x(n+1) = x(n) - p./dp;
     x(n+1) = x(n) - (x(n).^(3) -6.*x(n).^(2) +11.*x(n) -6) ./ (3.*x(n).^(2) -12.*x(n) +11);
     e(n+1)=abs(x(n+1)-x(n)); CP=e(n+1);
     if( e(n+1) < TOL && verificar_tolerancia)
       n = n+1;
       break;
     endif;
     n = n+1;
  endwhile;

  % adicionar a raiz encontrada a lista de raizes
  raizes(i) = x(n);
  iteracoes(i) = n;
  % a variavel "erros" é um cell array, cada indice de erros comporta um vetor de comprimento "n"
  % por esse motivo uma matriz normal não pode ser utilizada
  erros(i) = {e};

  X=[(0:length(x)-1)' x' e'];
  disp('   -----------------------------')
  disp(X)
  disp(['   TOL = ' num2str(TOL)]);
  disp(['   Iteraçöes: ' num2str(n-1)])
  disp('   -----------------------------')

endfor



dom1 = 1:iteracoes(1);
dom2 = 1:iteracoes(2);
dom3 = 1:iteracoes(3);

if (opt_plot == 1)

  % Exibição do gráfico

  semilogy(dom1,erros{1},'g-',dom1,erros{1},'go',dom2,erros{2},'r-',dom2,erros{2},'ro',dom3,erros{3},'b-',dom3,erros{3},'bo')
  xlabel('Iterações')
  ylabel('Erro de truncamento')
  title('Gráfico de convergencia(Newton)')
  legend( "Raiz 1","Raiz 1","Raiz 2","Raiz 2","Raiz 3","Raiz 3")
  axis([1 n min(e) max(e)])
  grid on

elseif(opt_plot == 2)
  subplot (1, 3, 1);
  semilogy(dom1,erros{1},'g-',dom1,erros{1},'go')
  xlabel('Iterações')
  ylabel('Erro de truncamento')
  title (sprintf ("convergencia\n(Newton)\nRaiz X1 = %d", 1));
  axis([1 iteracoes(1) min(erros{1}) max(erros{1})])
  grid on

  subplot (1, 3, 2);
  semilogy(dom2,erros{2},'r-',dom2,erros{2},'ro')
  xlabel('Iterações')
  ylabel('Erro de truncamento')
  title (sprintf ("convergencia\n(Newton)\nRaiz X2 = %d", 2));
  axis([1 iteracoes(2) min(erros{2}) max(erros{2})])
  grid on

  subplot (1, 3, 3);
  semilogy(dom3,erros{3},'b-',dom3,erros{3},'bo')
  xlabel('Iterações')
  ylabel('Erro de truncamento')
  title (sprintf ("convergencia\n(Newton)\nRaiz X3 = %d", 3));
  axis([1 iteracoes(3) min(erros{3}) max(erros{3})])
  grid on

endif


% Exibição do gráfico
##dom = 1:n;
##plot(dom,e,'k-',dom,e,'ro')
##xlabel('Iterações')
##ylabel('Erro de truncamento')
##title('Gráfico de convergencia(Newton)')
##axis([1 n min(e) max(e)])
##grid on
