function y_linha = funcao_y_linha(tensao_inicial,yj,j,tau)
  y_linha = (tensao_inicial - yj(j))./tau;
