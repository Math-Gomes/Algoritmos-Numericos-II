function [x,u,iter,Fu] = newtonAproximado(n, lambda, tol,itmax);
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
  r = norm(Fu,inf);
  delta = r*tol;

  %Processo iterativo ...
	iter = 0;

	while ((r > delta)&&(iter < itmax))
		J = Jacob2(u,h,lambda,n);
		s = J\-Fu;
		u = u + s;
		Fu = Func(u,x,h,lambda,n);
    r = norm(Fu,inf);
		iter++;
	endwhile
%  printf("lambda = %d\n",lambda);
%	 printf("Convergencia obtida apos %d iteracoes\n",iter);
%  printf("Resíduo =  %f\n\n",r);
%  plot(x,u,'linewidth',2);

endfunction