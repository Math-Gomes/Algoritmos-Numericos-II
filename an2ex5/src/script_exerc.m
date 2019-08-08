function script_exerc(ua,ub,sigma_b,f_x_t,exerc)
  Kappa = 0.835;
  L = 10;

  h = [1 .1 .01];
  lambda = [.45 .65];
  %lambda = Kappa*dt/(h*h);
  npassos = 100;

  for dx = 1:length(h)
    for lbd = 1:length(lambda)
      _h = h(dx);
      _lambda = lambda(lbd);
      n = L/_h + 1;
      dt = (_lambda*_h*_h)/Kappa;
      npassos = n*100;
      if(n > 1000)
        npassos = 15000;
      endif
      figure;
      explicito(n,dt,npassos,ua,ub,sigma_b,f_x_t,_lambda,L,lbd,exerc);
    endfor
  endfor

  for dx = 1:length(h)
    for lbd = 1:length(lambda)
      _h = h(dx);
      _lambda = lambda(lbd);
      n = L/_h + 1;
      dt = (_lambda*_h*_h)/Kappa;
      npassos = n*100;
      if(n > 1000)
        npassos = 15000;
      endif
      figure;
      implicito(n,dt,npassos,ua,ub,sigma_b,f_x_t,_lambda,L,lbd,exerc);
    endfor
  endfor
  
  for dx = 1:length(h)
    for lbd = 1:length(lambda)
      _h = h(dx);
      _lambda = lambda(lbd);
      n = L/_h + 1;
      dt = (_lambda*_h*_h)/Kappa;
      npassos = n*100;
      if(n > 1000)
        npassos = 15000;
      endif
      figure;
      cranknicolson(n,dt,npassos,ua,ub,sigma_b,f_x_t,_lambda,L,lbd,exerc);
    endfor
  endfor
endfunction
