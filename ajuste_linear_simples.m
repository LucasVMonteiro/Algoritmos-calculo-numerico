%% Ajuste linear simples
%% aplicado ao exemplo 7.2 da pagina 328 do livro de Barroso
clc,clear all, close all, format long

P = [ 1.3,2  ;
      3.4,5.2;
      5.1,3.8;
      6.8,6.1;
      8  ,5.8];


somatorio_xi = 0;
somatorio_yi = 0;
somatorio_xi_yi = 0;
somatorio_xi_2 = 0;
somatorio_yi_2 = 0;

n = length(P);

for c = 1 : length(P);
  somatorio_xi = somatorio_xi + P(c,1);
  somatorio_yi = somatorio_yi + P(c,2);
  somatorio_xi_yi = somatorio_xi_yi + (P(c,1).*P(c,2));
  somatorio_xi_2 = somatorio_xi_2 + P(c,1).^2;
  somatorio_yi_2 = somatorio_yi_2 + P(c,2).^2;
end


B1 = (n.*somatorio_xi_yi - somatorio_xi.*somatorio_yi)./((n.*somatorio_xi_2) - (somatorio_xi).^2);

B0 = ( somatorio_yi - B1.*(somatorio_xi) )./n;

R2 = ((somatorio_xi_yi - (somatorio_xi.*somatorio_yi)./n).^2)./((somatorio_xi_2-((somatorio_xi).^2)./n).*(somatorio_yi_2-(somatorio_yi.^2)./n));

x = linspace(0,10,10);

Y = B0 + B1.*x;

disp(["B0 = ",num2str(B0),"\nB1 = ",num2str(B1),"\nR2 = ",num2str(R2)]);
grafico = plot(x,Y,'r-',P(1:length(P), 1),P(1:length(P), 2), 'k.');
axis([min(x) max(x) 0 10]);
L = legend("Reta Y = B0 + B1.*x;","Pontos P");
set(grafico,'MarkerSize',15,'Linewidth',1.5);
set(L,'Box','Off','Location','NorthWest','fontsize',6);
grid on

