function exerc2(A,b,w)
  % A += (A' - diag(diag(A))); % Quando for necessário tornar a matriz simétrica
  tol = 1e-5; niter = 1e4; %h = 5e-2;
  [MJ,MS,MSOR,cJ,cS,cSOR]=fatora(A,b,w);
  
  %LETRA A
  [x_jac,iter_jac,ER_jac] = iterMethod(MJ,cJ,tol,niter,"Jacobi");   %Calcula a solu��o pelo m�todo Jacobi
  [x_sei,iter_sei,ER_sei] = iterMethod(MS,cS,tol,niter,"Seidel");   %Calcula a solu��o pelo m�todo Seidel
  [x_sor,iter_sor,ER_sor] = iterMethod(MSOR,cSOR,tol,niter,"SOR");  %Calcula a solu��o pelo m�todo SOR

  %LETRA B
  figure("numbertitle","off","name",
         "Erro relativo dos m�todos com rela��o as itera��es");
  plot(1:iter_jac,log(ER_jac)); hold on;
  plot(1:iter_sei,log(ER_sei));
  plot(1:iter_sor,log(ER_sor)); hold off;
  h = legend("Jacobi","Seidel",sprintf("SOR (w = %g)",w));
  set(h, "fontsize",14);
  
  %LETRA C
  convAnalyse(MJ,"Jacobi");
  convAnalyse(MS,"Seidel");
  convAnalyse(MSOR,"SOR");
endfunction