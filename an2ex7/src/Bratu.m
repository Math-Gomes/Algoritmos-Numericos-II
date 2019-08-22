function [x,u,iter,r] = Bratu(n, lambda, tol,itmax);
  h = 1/(n-1);
  x =linspace(0,(n-1)*h,n)';
  
  u = zeros(n,1);
  A = gallery('tridiag',n,-1,2,-1);
  A(1,1:2) = [1.0 0.0];
  A(n,n-1:n) = [0.0 1.0];
  
  const = pi^2 * sin(pi*x) - lambda*exp(sin(pi*x));
  Fu0 = (h^2)*(lambda * exp(u) + const);
  r = 1;
  delta = r*tol;
  
  for iter = 1:itmax
    if (r <= delta) break endif
    %Au = Fu
    u = A\Fu0;
    
    Fu = (h^2)*(lambda * exp(u) + const);
    r = norm(Fu-Fu0,inf)/norm(Fu,inf);
    Fu0 = Fu;
  endfor
%  printf("lambda = %d\n",lambda);
%	printf("Convergencia obtida apos %d iteracoes\n",iter);
%  printf("Resíduo =  %f\n\n",r);
%  plot(x,u,'linewidth',2);
endfunction