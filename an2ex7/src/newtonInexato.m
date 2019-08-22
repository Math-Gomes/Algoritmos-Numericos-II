function [x,u,iter,Fu] = newtonInexato(n, lambda, tol,itmax,k);
%
% Aplicação do método de newton para um 
% problema unidimensional
%
  %inicializando ...
  warning('off','all');
	h = 1/(n-1);
  x =linspace(0,(n-1)*h,n)';

  %discretizando ...
	
  %inicializando variáveis ...	
	u = zeros(n,1);
	Fu = Func(u,x,h,lambda,n);
  r = r0 = norm(Fu,inf);
  delta = r*tol;

  %Processo iterativo ...
	iter = 0;
  n_0 = tol;

	while ((r > delta)&&(iter < itmax))
		J = Jacob(u,h,lambda,n);
    opts.type = "nofill";
    [L,U] = ilu(sparse(J),opts);
    n_k = min(n_0,r/r0);
    r0 = r;
    [s,~,~,~,~] = gmres(J,-Fu,k,n_k,itmax,L,U);

		u = u + s;
		Fu = Func(u,x,h,lambda,n);
    r = norm(Fu,inf);
		iter++;
	endwhile
%  printf("lambda = %d\n",lambda);
%	printf("Convergencia obtida apos %d iteracoes\n",iter);
%  printf("Resíduo =  %g\n\n",r);
%  plot(x,u,'linewidth',2);

endfunction