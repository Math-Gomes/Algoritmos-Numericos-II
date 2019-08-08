function [x,y,u] = solveByGMRES(a,b,c,d,n,m,k,rtol,maxit,exerc)
  [A,f] = createMatrix(a,b,c,d,n,m,exerc);
  x = linspace(a,b,n);
  y = linspace(c,d,m);

  %Reordenamento do sistema
  % perm = symrcm(A);
  % P = speye(n*m,n*m)(perm,:);
  % R = A(perm,perm);

  %Fatoração ILU(n)
  opts.type = "crout";
  opts.droptol = 1e-4;
  [L,U] = ilu(A,opts);
  
  %Chamar função gmres
  [u,flag,relres,iter,resvec] = gmres(A,f,k,rtol,maxit,L,U);
endfunction