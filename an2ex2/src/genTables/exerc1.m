function A_prop = exerc1(A,file)
  %Define as constantes do problema
  n = rows(A);
  b = A*ones(n,1);
  tol = 1e-5; maxit = 1e4; 

  %Executa o m�todo e marca o tempo
  tic; t0 = time;
  [x,flag,relres,iter,resvec] = pcg(A,b,tol,maxit); 
  t1 = time; toc;
  
  %Plota a matriz e o resultado do PCG
  % spy(A);
  % figure("numbertitle","off","name",sprintf("Matriz %s",file));
  % plot(0:length(resvec)-1,log(resvec));
  
  A_prop = {file,n,flag,iter,relres,norm(x,inf),0,t1-t0}; % onde tá 0 é o cond(A)
endfunction
