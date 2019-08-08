function [a_,b_,c_,d_,e_,f] = validacao2(a,b,c,d,n,m)
  x = linspace(a,b,n);
  y = linspace(c,d,m);
  
  %Variáveis do problema  
  k = 1;
  beta_x = gama = repmat(1,n*m,1);
  beta_y = reshape(repmat(20*y',[1 n]),n*m,1);
  
  hx = (b-a)/(n-1);
  hy = (d-c)/(m-1);
  [a_,b_,c_,d_,e_] = coefs(hx,hy,k,beta_x,beta_y,gama);
  
  %Função obtida pela 'calculaF.m'
  func = @(x, y) (200 * x .* y .^ 2 .* (x - 1) .* (y - 1) + 10 * x .* (x - 1) .* (2 * y - 1) - 20 * x .* ...
                 (x - 1) + 5 * y .* (y - 1) .* (x .^ (9 / 2) .* (9 * x - 9) + 4 * x - 2) - 5 * y .* (y - 1) .* ...
                 (18 * x .^ (9 / 2) + x .^ (7 / 2) .* (81 * x - 81) + x .^ (7 / 2) .* (x .^ (9 / 2) .* (81 * x - 81) + 36 * x - 18) + 8) / 2) .* exp (x .^ (9 / 2));


  [X,Y] = meshgrid(x,y);
  f = reshape(func(X,Y)',n*m,1);

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
    f(I) = 0;
  endfor
endfunction