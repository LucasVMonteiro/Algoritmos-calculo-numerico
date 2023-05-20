% Codigo adaptado para:
% calcular a tensao de saida com base na tensao de entrada
% de um circuito RC paralelo (RC passa - baixa)

clear all,close all, clc
%% x=[0:.1:100]'; k=0.2; y0=200; y=y0.*exp(k.*x); % VALOR EXATO
x=[0:0.00007:.007]'; %% x = tempo t (ms)
y0 = 0;
x0 = 0;
R = 1000; % 1k Ohm
C = 0.000001; % 1uF
tau = R.*C;
y = 1 - exp(-x./tau); %% RESPOSTA EXATA
tensao_inicial = 1; % Volts
a=0; b=0.007; h=7.*10.^(-5);  m=(b-a)/h; xj(1)=x0; yj(1)=y0;  % DADOS PVI

funcao_y_linha = @(ti,yj) (ti - yj)./tau;
%% com base na figura 1, tensao_inicial = u(t)
%%                            0 , t < a
%% considere u(t-a) = ua(t) = 1 , t >= a
%% se a = 0, entao u(t-0) = u(t) = 1
%% Resposta ao degrau unitário do Filtro RC Passa-Baixa.
for j=1:m %% o j é utilizado para calcular cada intervalo de tempo
          %% e tambem a imagem y(j+1)
    xj(j+1)=xj(j)+h;
    yj(j+1)=yj(j)+h.*funcao_y_linha(tensao_inicial,yj(j));
end


%% com base na figura 2, tensao_inicial = v(t), onde v(t):
%%         1 , t < 3                                         0 , t < a
%% v(t)=   0 , t >= 3           , considere U(t-a) = Ua(t) = 1 , t >= a
%%                    ENTAO se a = 3 -> v(t) = 1 - U(t-3)

a=0; b=0.006; h=6.*10.^(-5);  m=(b-a)/h; xjtr(1)=x0; yjtr(1)=y0;  % DADOS PVI
xtr=[0:0.00006:.006]'; %% x = tempo t (ms)
ytr = max(yj).*exp(-[0:0.00006:.006]'./tau); %% RESPOSTA EXATA para a descarga capacitiva
%% Resposta transitória do Filtro RC Passa-Baixa, t = 6 * tau
##funcao_descarga = @(ymax,yjtr)
for j=1:m %% o j é utilizado para calcular cada intervalo de tempo
          %% e tambem a imagem y(j+1)
    if ( m != m/2 )
      xjtr(j+1)=xjtr(j)+h;
      yjtr(j+1)=yjtr(j)+h.*funcao_y_linha(tensao_inicial,yjtr(j));

    else
      xjtr(j+1)=xjtr(j)+h;
      yjtr(j+1)=yjtr(j)+h.*funcao_y_linha(0,yjtr(j));
    end

end

##ax=axes;
figure(1);
hold on
plot(x,y,'b','Linewidth',.5)
plot(xj,yj,'k--',xj,yj,'ko','MarkerSize',2)
hold off
##set(ax,'Fontsize',24);
L1=xlabel('tempo (ms)');
L2=ylabel('y(t) (volt)');
L3=title('Resposta ao degrau unitário do Filtro RC Passa-Baixa.');
set(L1,'fontname','TimesNewRoman','FontSize',40);
set(L2,'fontname','TimesNewRoman','FontSize',40);
set(L3,'FontSize',32,'FontWeight','Normal');
axis([0 b 0 1.1])
axis square, box off, grid on
j=[0:m]'; ej=abs((1 - exp(-xj./tau)) - yj);
[j,xj',yj' ej']


figure(2);
hold on
plot(xtr,ytr,'b','Linewidth',.5)
plot(xjtr,yjtr,'k--',xjtr,yjtr,'ko','MarkerSize',2)
hold off
##set(ax,'Fontsize',24);
L1=xlabel('tempo (ms)');
L2=ylabel('y(t) (volt)');
L3=title('Resposta transitória do Filtro RC Passa-Baixa, t = 6 * tau');
set(L1,'fontname','TimesNewRoman','FontSize',40);
set(L2,'fontname','TimesNewRoman','FontSize',40);
set(L3,'FontSize',32,'FontWeight','Normal');
axis([0 b 0 1.1])
axis square, box off, grid on
j=[0:m]'; ej=abs((1 - exp(-xj./tau)) - yj);
[j,xj',yj' ej']

##function y_linha = funcao_y_linha(tensao_inicial,yj,j,tau)
##  y_linha = (tensao_inicial - yj(j))./tau;
##end

