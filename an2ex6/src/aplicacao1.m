function [a_,b_,c_,d_,e_,f] = aplicacao1(a,b,c,d,n,m)
  %Variáveis do problema
  k = C = 1;
  T = 2;
  u_ref = 70;
  
  beta_x = beta_y = repmat(0,n*m,1);
  gama = repmat(2*C/T,n*m,1);
  f = repmat(2*C/T*u_ref,n*m,1);
  
  hx = (b-a)/(n-1);
  hy = (d-c)/(m-1);
  [a_,b_,c_,d_,e_] = coefs(hx,hy,k,beta_x,beta_y,gama);
  
  %Aplica as condições de contorno
  dx_pos = n:n:m*n;
  dx_neg = 1:n:(m-1)*n+1;
  dy_pos = (m-1)*n+1:n*m;
  dy_neg = 1:n;
  
  %u(x, 0) = 70
  I = dy_neg;
  a_(I) = 1;
  b_(I) = c_(I) = d_(I) = e_(I) = 0;
  f(I) = 70;
  
  %u(x,W) = 70
  I = dy_pos;
  a_(I) = 1;
  b_(I) = c_(I) = d_(I) = e_(I) = 0;
  f(I) = 70;
  
  %u(0, y) = 200
  I = dx_neg;
  a_(I) = 1;
  b_(I) = c_(I) = d_(I) = e_(I) = 0;
  f(I) = 200;
  
  %Condição mista
  I = dx_pos;
  a_(I) += c_(I)*(1-hx);
  f(I) -= c_(I)*u_ref*hx;
  c_(I) = 0;

  %Valor prescrito
%  I = dx_pos;
%  a_(I) = 1;
%  b_(I) = c_(I) = d_(I) = e_(I) = 0;
%  f(I) = 70;
endfunction
