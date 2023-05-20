%============================================================== % IFPB, JOÃO PESSOA, 25/08/2020
% CURSO SUPERIOR DE ENGNEHARIA ELÉTRICA
% LAB#02 - MÉTODOS ITERATIVOS DE JACOBI E GAUSS-SEIDEL
% AUTOR: PROF. PAULO HENRIQUE DA FONSECA SILVA
%==============================================================
clc, clear all, close all
K=20*2; EPSILON=1E-6;
x1(1)=0; x2(1)=0; epsilon(1)=0;
for k=1:K
  x1(k+1)= (1+x2(k))/2;
  x2(k+1)= (3-x1(k))/2;
  epsilon(k+1)=max(abs([(x1(k+1)-x1(k)) (x2(k+1)-x2(k))]));
  if epsilon(k+1)<EPSILON, break; end
end
disp(' MÉTODO DE JACOBI');
disp(' k x1(k) x2(k) epsilon');
disp([(1:k+1)' x1' x2' epsilon']);

clear all
K=20*2; EPSILON=1E-6;
x1(1)=0; x2(1)=0; x3(1)=0; epsilon(1)=0;
for k=1:K
  x1(k+1)= (1+x2(k))/2;
  x2(k+1)= (3-x1(k+1))/2;
  epsilon(k+1)=max(abs([(x1(k+1)-x1(k)) (x2(k+1)-x2(k))]));
  if epsilon(k+1)<EPSILON, break; end
end
disp(' MÉTODO DE GAUSS-SEIDEL');
disp(' k x1(k) x2(k) epsilon');
disp([(1:k+1)' x1' x2' epsilon']);
