function [x,u] = pvc(a,b,n,tipo_a,ua,sigma_a,alfa_a,beta_a,gamma_a,tipo_b,ub,sigma_b,alfa_b,beta_b,gamma_b,problema)
  % define variaveis principais
  h = (b-a)/(n-1);
  x = linspace(a,b,n)';

  % considera valores especificos para as funcoes p, q e r
  if strcmp(problema,"exemplo")
    [p,q,r] = funcoes(a,b,n);
  elseif strcmp(problema,"aplicacao1")
    [p,q,r] = funcoes2(a,b,n);
  elseif strcmp(problema,"aplicacao2")
    [p,q,r] = funcoes3(a,b,n,beta_b);
  endif

  % monta sistema Au=f
  a_ = q(1) - (2/(h*h));
  b_ = (1/(h*h))-(p(1)/(2*h));
  c_ = b_ + p(1)/h;

  A = gallery('tridiag',n,b_,a_,c_);
  f = r;

  % aplica condicoes de contorno em x=a;
  switch tipo_a
    case 1 
      A(1,1) = 1;
      A(1,2) = 0;
      f(1) = ua;
    case 2
      A(1,1) += b_;
      f(1)   += b_*h*sigma_a;
    case 3
      A(1,1) += b_*(1+h*beta_a/alfa_a);
      f(1)   += b_*h*gamma_a/alfa_a;
    otherwise
      disp("Erro na Condicao de contorno"); 
  end

  % aplica condicoes de contorno em x=b;
  switch tipo_b
    case 1
      A(n,n) = 1;
      A(n,n-1) = 0;
      f(n) = ub;
    case 2 
      A(n,n) += c_;
      f(n) -= c_*h*sigma_b;
    case 3
      A(n,n) += c_*(1-h*beta_b/alfa_b);
      f(n)   -= c_*h*gamma_b/alfa_b;
    otherwise
      disp("Erro na Condicao de contorno"); 
  end 
  
  % Resolve sistema linear
  u = A\f;    
endfunction