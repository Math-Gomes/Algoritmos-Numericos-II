function J = Jacob2(u,h,lambda,n)
%
% Calcula a Jacobiana Aproximada de F na solução corrente para o problema:
%
% -u'' -lambda exp(u) = g(x) p/ 0<x<1
%  g(x) = pi^2 sen(pi*x) - lambda exp(pi*x)
%  u(0) = u(1) = 0;

  J = zeros(n,n);
	J(1,1) = J(n,n) = 1;

	for i=2:n-1
		J(i,i-1) = 1;
		J(i,i+1) = 1;
		J(i,i) = -2 + h * lambda * exp(u(i))*(exp(h)-1);
	end
endfunction
