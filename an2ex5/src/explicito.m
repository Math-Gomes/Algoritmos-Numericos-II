function [x,u] = explicito(n,dt,npassos,ua,ub,sigma_b,f_x_t,lambda,L,dti,exerc)
  u = zeros (n,npassos);
  u(1,:) = ua;
  x = linspace(0,L,n);
  
  B = gallery('tridiag',n,lambda,(1 - 2*lambda),lambda);
  B(1,1) = 1; B(1,2) = 0;
  
  lst_row = n-1;
  if length(sigma_b) 
    lst_row += 1;
  else
    u(n,:) = ub;
  endif
  
  t = npassos*dt;
  tol = 1e-3;
  atingiuTol = sprintf("Nao atingiu tol. (npassosMax = %g)",npassos);

  for k = 1:npassos-1
    u(2:lst_row,k+1) = B(2:lst_row,:)*u(:,k);
    u(2:lst_row,k+1) = B(2:lst_row,:)*u(:,k);
    if(norm(u(:,k+1) - u(:,k),Inf) <= tol)
      t = (k+1)*dt;
      atingiuTol = sprintf("Atingiu tol. com %g passos (npassosMax = %g)\nt = %g",k+1,npassos,t);
      break;
    endif
  endfor

  fprintf("Explicito, n = %g Dt = %g k = %g\n",n,dt,k+1);
  atingiuTol
  
  f = @(x) (ceil(x*(k+1)));
  lg = @(x) sprintf("t=%.2f",dt*x);

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

  % titleplot = strcat(sprintf("Explicito:    n = %g    Dt = %g\n",n,dt), atingiuTol);
  % title(titleplot);

  % filename = sprintf("figs/%s/Exp_N%gDt%g.eps",exerc,n,dti);
  % print(filename,"-depsc")
endfunction
