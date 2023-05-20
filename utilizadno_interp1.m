#utilizando interp1

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

y = interp1( Pontos(1:length(Pontos),1), Pontos(1:length(Pontos),2), linspace(2010,2021,1000));

plot(Pontos(1:length(Pontos),1), Pontos(1:length(Pontos),2),'ko');
hold on
plot(linspace(2010,2021,1000),y,'r-');
