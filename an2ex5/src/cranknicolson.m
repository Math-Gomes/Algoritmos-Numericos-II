function [x,u] = cranknicolson(n,dt,npassos,ua,ub,sigma_b,f_x_t,lambda,L,dti,exerc)
  u = zeros (n,npassos);
  u(1,1) = ua;
  u(n,1) = ub;
  x = linspace(0,L,n);
  
  A = gallery('tridiag',n,-lambda,(1 + 2*lambda),-lambda);
  B = gallery('tridiag',n,lambda,(1 - 2*lambda),lambda);
  A(1,1) = 1; A(1,2) = 0;
  B(1,1) = 1; B(1,2) = 0;
  
  t = npassos*dt;
  tol = 1e-3;
  atingiuTol = sprintf("Nao atingiu tol. (npassosMax = %g)",npassos);

  if length(sigma_b)
    A(n,n) += -lambda;
    B(n,n) += lambda;
  else
    A(n,n) = 1; A(n,n-1) = 0;
    B(n,n) = 1; B(n,n-1) = 0;
  endif
  
  for k = 1:npassos-1
    b = B*u(:,k) + f_x_t*dt;
    u(:,k+1) = A\b;
    if(norm(u(:,k+1) - u(:,k),Inf) <= tol)
      t = (k+1)*dt;
      atingiuTol = sprintf("Atingiu tol. com %g passos (npassosMax = %g)\nt = %g",k+1,npassos,t);
      break;
    endif
  end
  
  fprintf("Crank-Nicolson, n = %g Dt = %g k = %g\n",n,dt,k+1);
  atingiuTol

  f = @(x) (ceil(x*(k+1)));
  lg = @(x) sprintf("t=%.2f", dt*x);
  
  plot(x,u(:,f(0.01)),x,u(:,f(0.1)),x,u(:,f(0.2)),x,u(:,f(0.3)),x,u(:,f(0.4)),x,u(:,f(0.5)),x,u(:,f(0.6)),x,u(:,k+1))
  l = legend(lg(f(0.01)),
             lg(f(0.1)),
             lg(f(0.2)),
             lg(f(0.3)),
             lg(f(0.4)),
             lg(f(0.5)),
             lg(f(0.6)),
             lg(f(1)));
  
  set(l,'fontsize',12);

  titleplot = strcat(sprintf("Crank-Nicolson:  n = %g  Dt = %g\n",n,dt), atingiuTol);
  title(titleplot);

  % filename = sprintf("figs/%s/CN_N%gDt%g.eps",exerc,n,dti);
  % print(filename,"-depsc")
endfunction
