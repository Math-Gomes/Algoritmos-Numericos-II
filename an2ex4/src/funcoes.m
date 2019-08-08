function [p,q,r] = funcoes(a,b,n)
  %Exemplo
  p = repmat(-.5,n,1);
  q = repmat(1,n,1);
  r = linspace(a,b,n)'.^2 + .5;
endfunction