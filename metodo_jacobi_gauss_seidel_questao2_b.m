%============================================================== % IFPB, JOÃO PESSOA, 25/08/2020
% CURSO SUPERIOR DE ENGNEHARIA ELÉTRICA
% LAB#02 - MÉTODOS ITERATIVOS DE JACOBI E GAUSS-SEIDEL
% AUTOR: PROF. PAULO HENRIQUE DA FONSECA SILVA
%==============================================================
clc, clear all, close all
K=20; EPSILON=1E-3;
x1(1)=0; x2(1)=0; x3(1)=0; epsilon(1)=0;
for k=1:K
  x1(k+1)= (11.33 + x2(k) + x3(k))/6;
  x2(k+1)= (32 + x1(k) + x3(k))/6;
  x3(k+1)= (-42 -x1(k) - x2(k))/6;
  epsilon(k+1)=max(abs( [(x1(k+1)-x1(k)) (x2(k+1)-x2(k)) (x3(k+1)-x3(k))] ) );
  disp(abs( [(x1(k+1)-x1(k)) (x2(k+1)-x2(k)) (x3(k+1)-x3(k))] ));
  if epsilon(k+1)<EPSILON, break; end
end

filename = "Saida_JACOBI.csv";
fid = fopen (filename, "w");

for l=1 :k+1

  fprintf(fid,"%.0f,%f,%f,%f,%f\n",l,x1(l),x2(l),x3(l),epsilon(l));

end

fclose (fid);

disp(' MÉTODO DE JACOBI');
disp('      k         x1(k)         x2(k)     x3(k)    epsilon');
disp([(1:k+1)' x1' x2' x3' epsilon']);

clear all
K=20; EPSILON=1E-3;
x1(1)=0; x2(1)=0; x3(1)=0; epsilon(1)=0;
for k=1:K
  x1(k+1)= (11.33 + x2(k) + x3(k))/6;
  x2(k+1)= (32 + x1(k+1) + x3(k))/6;
  x3(k+1)= (-42 -x1(k+1) - x2(k+1))/6;
  epsilon(k+1)=max(abs( [(x1(k+1)-x1(k)) (x2(k+1)-x2(k)) (x3(k+1)-x3(k))] ) );
  if epsilon(k+1)<EPSILON, break; end
end

filename = "Saida_SEIDEL.csv";
fid = fopen (filename, "w");
for l=1 :k+1

  fprintf(fid,"%.0f,%f,%f,%f,%f\n",l,x1(l),x2(l),x3(l),epsilon(l));

end
fclose (fid);

disp(' MÉTODO DE GAUSS-SEIDEL');
disp('      k         x1(k)         x2(k)     x3(k)    epsilon');
disp([(1:k+1)' x1' x2' x3' epsilon']);
