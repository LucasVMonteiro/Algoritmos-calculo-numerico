%  INSTITUTO FEDERAL DA PARA�BA
%  CURSO SUPERIOR DE BACHARELADO EM ENGENHARIA EL�TRICA
%  C�LCULO NUM�RICO 2020
%  INTEGRA��O NUM�RICA - REGRA DOS TRAP�ZIOS
%  AUTOR: PROF. PAULO HENRIQUE DA FONSECA SILVA

clear all, close all, clc, format long,
a=0; b=4; n=16; h=(b-a)/n;
x=a:h:b; y=x./(sqrt(x.^2 + 9));
I=0; Iexato=2;
for i=1:n
  I=I+(h/2)*(y(i)+y(i+1));
end
ET=-(b-a)^3/(12*n^2)*(diff(b./(sqrt(b.^2 + 9)),2));
Ir=I+ET;
E=abs(Iexato-Ir);
disp('<INTEGRA��O NUM�RICA - REGRA DOS TRAP�ZIOS>')
disp(' ')
disp(sprintf('  Iexato = %2.8f',Iexato));
disp(sprintf('  Inum   = %2.8f,    ET = %2.8f',I,ET));
disp(sprintf('  Ir     = %2.8f,    E  = %2.8f',Ir,E));
