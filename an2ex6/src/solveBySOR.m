function [x,y,u] = solveBySOR(a,b,c,d,n,m,w,rtol,maxit,exerc,f_erro)
  [a_,b_,c_,d_,e_,f] = exerc(a,b,c,d,n,m);
  x = linspace(a,b,n);
  y = linspace(c,d,m);
  u  = u0 = zeros(n*m,1);

  for iter = 1:maxit
    I = 1;
    u(I) = (w/a_(I)) * (f(I) - c_(I)*u0(I+1) - e_(I)*u0(I+n)) + (1-w)*u0(I);
    
    I = 2:n;
    u(I) = (w*(f(I) - b_(I).*u(I-1) - c_(I).*u0(I+1) - e_(I).*u0(I+n)))./a_(I) + (1-w)*u0(I);
    
    I = n+1:n*(m-1);
    u(I) = (w*(f(I) - d_(I).*u(I-n) - b_(I).*u(I-1) - c_(I).*u0(I+1) - e_(I).*u0(I+n)))./a_(I) + (1-w)*u0(I);
    
    I = n*(m-1)+1:n*m-1;
    u(I) = (w*(f(I) - d_(I).*u(I-n) - b_(I).*u(I-1) - c_(I).*u0(I+1)))./a_(I) + (1-w)*u0(I);
    
    I = m*n;
    u(I) = (w*(f(I) - d_(I)*u(I-n) - b_(I)*u(I-1)))/a_(I) + (1-w)*u0(I);

    if f_erro(u,u0) < rtol  break; endif
    u0 = u;
  endfor
endfunction
