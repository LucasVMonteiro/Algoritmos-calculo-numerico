## INSTITUTO FEDERAL DA PARAÍBA
## CURSO SUPERIOR DE BACHARELADO EM ENGENHARIA ELÉTRICA
## CÁLCULO NUMÉRICO 2020
## INTEGRAÇÃO NUMÉRICA - REGRA DOS TRAPÉZIOS
## AUTOR: PROF. PAULO HENRIQUE DA FONSECA SILVA

##clear all, close all, clc, format long
##a=0; b=1; n=420; h=(b-a)/n;
##x=a:h:b; y=2.^(x);
##I=0; Iexato=1.442695041;
##for i=1:n
##  I=I+(h/2)*(y(i)+y(i+1));
##end
##ET=-((b-a)^3/(12*n^2))*(((log(2)).^2).*2^1);
##Ir=I+ET;
##E=abs(Iexato-Ir);
##disp('<INTEGRAÇÃO NUMÉRICA - REGRA DOS TRAPÉZIOS>')
##disp(' ')
##disp(sprintf('  Iexato = %2.8f',Iexato));
##disp(sprintf('  Inum   = %2.8f,    ET = %2.8f',I,ET));
##disp(sprintf('  Ir     = %2.8f,    E  = %2.8f',Ir,E));

##clear all, close all, clc, format long
##a=0; b=4; n=410; h=(b-a)/n;
##x=a:h:b; y=x./(sqrt(x.^2 + 9));
##I=0; Iexato=2;
##for i=1:n
##  I=I+(h/2)*(y(i)+y(i+1));
##end
##ET=-((b-a).^3/(12.*n.^2)).*(-(27*4)/(4^2+9)^(5/2));
##Ir=I+ET;
##E=abs(Iexato-Ir);
##disp('<INTEGRAÇÃO NUMÉRICA - REGRA DOS TRAPÉZIOS>')
##disp(' ')
##disp(sprintf('  Iexato = %2.8f',Iexato));
##disp(sprintf('  Inum   = %2.8f,    ET = %2.8f',I,ET));
##disp(sprintf('  Ir     = %2.8f,    E  = %2.8f',Ir,E));

clear all, close all, clc, format long
a=-3; b=3; n=480; h=(b-a)/n;
x=a:h:b; y=1./(x.^2 + 9);
I=0; Iexato=0.523598775;
for i=1:n
  I=I+(h/2)*(y(i)+y(i+1));
end
ET=-((b-a).^3/(12.*n.^2)).*((6*((-3)^2-3))/((-3)^2+9)^3);
Ir=I+ET;
E=abs(Iexato-Ir);
disp('<INTEGRAÇÃO NUMÉRICA - REGRA DOS TRAPÉZIOS>')
disp(' ')
disp(sprintf('  Iexato = %2.8f',Iexato));
disp(sprintf('  Inum   = %2.8f,    ET = %2.8f',I,ET));
disp(sprintf('  Ir     = %2.8f,    E  = %2.8f',Ir,E));
