%Lucas Vieira Monteiro
%20212610030

clear all, close all, clc, format long
% SIMPSON 2
a=-3;
b=3;
pontos = 28;
x = linspace(a,b,pontos);
n = length(x)-1;%total de subintervalos
h = (b-a)./n;

y = 1./(x.^2 + 9);
p = pontos;
somas = 0;
sinalizador = 1;
for i=1 : p

    if(i==1)

        somas = somas + y(1);

    elseif(i==p)

        somas = somas + y(p);

    elseif(sinalizador == 1 || sinalizador == 2)

        somas = somas + y(i).*3;
        sinalizador = sinalizador +1;

    elseif(sinalizador == 3)

        somas = somas + y(i).*2;
        sinalizador = 1;
    end

end

I = ((3.*h)./8).*somas;
Iexato=pi./6;
ET=(-(b-a).^5/(80.*n.^4)).*((24.*(5.*3.^4-90.*3.^2+81))./(3.^2+9).^5);
Ir=I+ET;
E=abs(Iexato-Ir);

##disp(sprintf('%.8f',I));
disp(sprintf('  Iexato = %2.8f, %d subintervalos',Iexato,n));
disp(sprintf('  Inum   = %2.8f,    ET = %2.8f',I,ET));
disp(sprintf('  Ir     = %2.8f,    E  = %2.8f',Ir,E));
