function [p,q,r] = funcoes3(a,b,n,c_ref)
  %Aplicação 2
  u_ref = 70;
  K = 1e-3;
  T = .1;
  W = 10;
  
  C = c_ref*(2*W + 2*T)/(W*T);
  f = C*u_ref;
  
  p = repmat(0,n,1);
  q = repmat(-C/K,n,1);
  r = repmat(-f/K,n,1);
endfunction