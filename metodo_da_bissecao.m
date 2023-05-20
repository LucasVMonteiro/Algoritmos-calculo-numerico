% INSTITUTO FEDERAL DA PARAÍBA
% CURSO SUPERIOR DE BACHARELADO EM ENGENHARIA ELÉTRICA
% CÁLCULO NUMÉRICO 2020
% EQUACÖES TRANSCENDENTES E ALGÉBRICAS
% CALCULO DE RAÍZES - MÉTODO DA BISSECAO
% EXEMPLO 3.19 PÁGINA 108 DO LIVRO-TEXTO
% AUTOR: PROF. PAULO HENRIQUE DA FONSECA SILVA
% p(x)=x^(3) - 6x^(2) + 11x - 6

% Atualizado por: Lucas Vieira Monteiro
% + Agora o programa percorre os 3 intervalos para encontrar as 3 raizes
% + Adicionado dois modos de plot

clear all, close all, clc, format short

% opt_plot controla o tipo de plot do grafico de convergencia
% 1 - Todos três gráficos no mesmo plano
% 2 - Todos três gráficos na mesma janela e separados
opt_plot = 2;


% Intervalos
la = [0 1.6 2.6];
lb = [1.6 2.6 3.6];

for i = 1: 3

  a=la(i); b = lb(i); Nmax=10; tol=1e-6;
  n=1; e(n)=b-a; xi(n)=0;
  while(n<=Nmax)
    n=n+1;

    ya=a^(3) - 6*a^(2) + 11*a - 6;
    yb=b^(3) - 6*b^(2) + 11*b - 6;

    % Ponto medio entre x = a e x = b
    xi(n)=a+(b-a)/2;

    % Calculando o novo y com base no ponto medio obtido
    yi(n)= xi(n)^(3) - 6*xi(n)^(2) + 11*xi(n) - 6;

    % Verificando se o novo y é igual a zero
    % Verificando se o novo ponto medio é raiz
    if (yi(n)==0)
      e(n)=abs(xi(n)-xi(n-1));
      break;
    endif

    % Verificando se as imagens dos extremos do intervalo xa e x_medio são
    % negativos, se sim substitua o xb pelo ponto medio
    % se não, substitua o xa pelo ponto medio
    if (ya*yi(n)<0)
      b=xi(n);
     else
      a=xi(n);
     end

    e(n)=abs(xi(n)-xi(n-1));
    if (e(n) < tol), break; endif

  endwhile

% adicionar a raiz encontrada a lista de raizes
raizes(i) = xi(n);
iteracoes(i) = n;
% a variavel "erros" é um cell array, cada indice de erros comporta um vetor de comprimento "n"
% por esse motivo uma matriz normal não pode ser utilizada
erros(i) = {e};

N=0:n - 3;
disp('       N        XN      F(XN)       E')
disp([N' xi(3:n)' yi(3:n)' e(3:n)'])

endfor



dom1 = 1:iteracoes(1);
dom2 = 1:iteracoes(2);
dom3 = 1:iteracoes(3);

if (opt_plot == 1)

  % Exibição do gráfico

  semilogy(dom1,erros{1},'g-',dom1,erros{1},'go',dom2,erros{2},'r-',dom2,erros{2},'ro',dom3,erros{3},'b-',dom3,erros{3},'bo')
  xlabel('Iterações')
  ylabel('Erro de truncamento')
  title('Gráfico de convergencia(Bisseção)')
  legend( "Raiz 1","Raiz 1","Raiz 2","Raiz 2","Raiz 3","Raiz 3")
  axis([1 n min(e) max(e)])
  grid on

elseif(opt_plot == 2)
  subplot (1, 3, 1);
  semilogy(dom1,erros{1},'g-',dom1,erros{1},'go')
  xlabel('Iterações')
  ylabel('Erro de truncamento')
  title (sprintf ("convergencia\n(Bisseção)\nRaiz X1 = %d", 1));
  axis([1 iteracoes(1) min(erros{1}) max(erros{1})])
  grid on

  subplot (1, 3, 2);
  semilogy(dom2,erros{2},'r-',dom2,erros{2},'ro')
  xlabel('Iterações')
  ylabel('Erro de truncamento')
  title (sprintf ("convergencia\n(Bisseção)\nRaiz X2 = %d", 2));
  axis([1 iteracoes(2) min(erros{2}) max(erros{2})])
  grid on

  subplot (1, 3, 3);
  semilogy(dom3,erros{3},'b-',dom3,erros{3},'bo')
  xlabel('Iterações')
  ylabel('Erro de truncamento')
  title (sprintf ("convergencia\n(Bisseção)\nRaiz X3 = %d", 3));
  axis([1 iteracoes(3) min(erros{3}) max(erros{3})])
  grid on

endif

