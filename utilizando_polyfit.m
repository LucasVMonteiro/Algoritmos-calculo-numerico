#utilizando polyfit
clc, clear all, close all, format long

##Pontos = [2.4,11.2;
##          2.6,13.46;
##          2.8,16.44;
##          3.0,20.08;
##          3.2,24.53;
##          3.4,29.96;
##          3.6,36.59;
##          3.8,44.70];
Pontos = [2010,30715460; #Produção de leite por ano
          2011,32096214;
          2012,32304421;
          2013,34255236;
          2014,35124360;
          2015,34609588;
          2016,33680401;
          2017,33313230;
          2018,33907899;
          2019,34871669;
          2020,35316667;
          2021,35305047];
Pn = polyfit(Pontos(1:length(Pontos),1),Pontos(1:length(Pontos),2),13);

y = polyval(Pn,Pontos(1:length(Pontos)));

plot(Pontos(1:length(Pontos)),y,'r-');
hold on
plot(Pontos(1:length(Pontos),1),Pontos(1:length(Pontos),2),'ko');

