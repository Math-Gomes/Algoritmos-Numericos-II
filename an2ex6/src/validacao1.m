function [a_,b_,c_,d_,e_,f] = validacao1(a,b,c,d,n,m)
  %Variáveis do problema
  T0 = 25;
  k = 1;
  beta_x = beta_y = gama = f = repmat(0,m*n,1);
  
  hx = (b-a)/(n-1);
  hy = (d-c)/(m-1);
  [a_,b_,c_,d_,e_] = coefs(hx,hy,k,beta_x,beta_y,gama);
  
  %Aplica as condições de contorno
  dx_pos = n:n:m*n;
  dx_neg = 1:n:(m-1)*n+1;
  dy_pos = (m-1)*n+1:n*m;
  dy_neg = 1:n;
  direcoes = [dy_neg dx_neg dx_pos dy_pos];
  for i = 1:length(direcoes)
    I = direcoes(i);
    a_(I) = 1;
    b_(I) = c_(I) = d_(I) = e_(I) = 0;
    f(I) = T0;
  endfor
endfunction
