function exerc1(A,file)
  n = rows(A);
  b = A*ones(n,1);
  % spy(A);
  file, n
  
  tol = 1e-5;
  maxit = 1e4; tic;
  [x,flag,relres,iter,resvec] = pcg(A,b,tol,maxit); toc;
  
  iter, nx_inf = norm(x,inf) %, cond_A = cond(A), 
  flag, relres
  figure("numbertitle","off","name",sprintf("Matriz %s",file));
  % plot(0:iter,log(resvec));
  plot(0:length(resvec)-1,log(resvec));

endfunction
