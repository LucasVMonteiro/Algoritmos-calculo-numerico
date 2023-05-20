clc, clear all, close all

nome_arquivo = "cana-de-acucar-mil-reais.csv"
caminho = strcat("dados/", nome_arquivo);

dados = csvread(caminho);
dados = dados( 2:length(dados) , : );

