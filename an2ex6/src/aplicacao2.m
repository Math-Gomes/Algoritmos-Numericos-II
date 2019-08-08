function [a_,b_,c_,d_,e_,f] = aplicacao2(a,b,c,d,n,m)
  %Variáveis do problema
  Rw = -250;
  p_ref = 100;

  k = 1;
  beta_x = repmat(0,m*n,1);
  beta_y = repmat(0,m*n,1);
  gama = repmat(0,m*n,1);
  f = repmat(0,m*n,1);

  x = linspace(a,b,n);
  y = linspace(c,d,m);
  razaox = x(2)-x(1);
  razaoy = y(2)-y(1);

  %Insere os poços
  poco1 = [1500,600];
  I = round((poco1(1)/razaox)+1);
  j = round((poco1(2)/razaoy)+1);
  I = (j-1)*(n-1)+I;
  f(I) = Rw;

  poco2 = [3200,250];
  I = round((poco2(1)/razaox)+1);
  j = round((poco2(2)/razaoy)+1);
  I = (j-1)*(n-1)+I;
  f(I) = Rw;
  
  hx = (b-a)/(n-1);
  hy = (d-c)/(m-1);
  [a_,b_,c_,d_,e_] = coefs(hx,hy,k,beta_x,beta_y,gama);

  %-------Aplica as condições de contorno-------%
  dx_pos = n:n:m*n;
  dx_neg = 1:n:(m-1)*n+1;
  dy_pos = (m-1)*n+1:n*m;
  dy_neg = 1:n;
  
  %Valor prescrito
  I = dx_neg;
  a_(I) = 1;
  b_(I) = c_(I) = d_(I) = e_(I) = 0;
  f(I) = p_ref;
  
  I = dx_pos;
  a_(I) = 1;
  b_(I) = c_(I) = d_(I) = e_(I) = 0;
  f(I) = p_ref;
    
  %Fluxo Prescrito borda inferior
  I = 1:n;
  a_(I) += d_(I);
  f(I) += d_(I) * ((hy/k)*0); %hI = 0
  d_(I) = 0;
  %Fluxo Prescrito borda superior
  I = n*(m-1)+1:n*m;
  a_(I) += e_(I);
  f(I) += e_(I) * ((hy/k)*0); %hI = 0
  e_(I) = 0;
endfunction
