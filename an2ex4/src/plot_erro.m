function plot_erro(sym,cor,a,b,N,tipo_a,ua,sigma_a,alfa_a,beta_a,gamma_a,tipo_b,ub,sigma_b,alfa_b,beta_b,gamma_b,problema)
  %Solução exata
  u_x = @(x) x.*x + x - b;
  f_x   = @(f,x) polyfit(x,f,1);
  
  H = log((b-a)./(N-1));
  erro = [];
  
  %Calcula o PVC para diferentes intervalos
  for i = 1:length(N)
    n = N(i);
    [x,u] = pvc(a,b,n,tipo_a,ua,sigma_a,alfa_a,beta_a,gamma_a,tipo_b,ub,sigma_b,alfa_b,beta_b,gamma_b,problema);
    erro(end+1) = log10(norm(u - u_x(x),inf));
  endfor
  a = f_x(-erro,-H)(1,1)
  E_x = @(x) polyval(f_x(erro,-H),x);

  hold on;
  plot(-H,-erro,   strcat(sym,cor));
  plot(-H,-E_x(-H),strcat('-',cor));
  hold off;
endfunction
