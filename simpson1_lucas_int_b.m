%Lucas Vieira Monteiro
%20212610030

clear all, close all, clc, format long
% SIMPSON 1
a=0;
b= 4;
pontos = 25;
x = linspace(a,b,pontos);
n = length(x)-1;%total de subintervalos
h = (b-a)./n;
y = x./(sqrt(x.^2 + 9));
somas = 0;
p = pontos;

sinalizador = 1;

for i=1 : p

    if(i==1)

        somas = somas + y(1);

    elseif(i==p)

        somas = somas + y(p);

    elseif(sinalizador == 1)

        somas = somas + y(i).*4;
        sinalizador = sinalizador +1;

    elseif(sinalizador == 2)

        somas = somas + y(i).*2;
        sinalizador = 1;
    end

end

I = (h./3).*somas;
Iexato=2;
ET=(-(b-a).^5/(180.*n.^4)).*((135.*4.*(27-4.*4.^2))./(4.^2+9).^(9./2));
Ir=I+ET;
E=abs(Iexato-Ir);

%%disp(sprintf('%.8f',I));
disp(sprintf('  Iexato = %2.8f, %d subintervalos',Iexato,n));
disp(sprintf('  Inum   = %2.8f,    ET = %2.8f',I,ET));
disp(sprintf('  Ir     = %2.8f,    E  = %2.8f',Ir,E));
