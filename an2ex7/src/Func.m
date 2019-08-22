%
% Avalia a função não linear na solução corrente para o problema:
%
% -u'' -lambda exp(u) = g(x) p/ 0<x<1
%  g(x) = pi^2 sen(pi*x) - lambda exp(pi*x)
%  u(0) = u(1) = 0;
%
function Fu = Func(u,x,h,lambda,n)
  Fu = zeros(n,1);
  % Fu(1) = 0.0  (condição de contorno)
  i=2:n-1;
  Fu(i) = u(i-1) - 2*u(i) + u(i+1) + (h^2)*(lambda * exp(u(i)) + pi^2 * sin(pi*x(i)) - lambda*exp(sin(pi*x(i))));
  % Fu(n) = 0.0 (condição de contorno)
endfunction
