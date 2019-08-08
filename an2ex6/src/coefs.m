function [a_,b_,c_,d_,e_] = coefs(hx,hy,k,beta_x,beta_y,gama)
  a_ = gama + 2*k * (hx^(-2) + hy^(-2));
  b_ = (-k*hx^(-2)) - (beta_x/(2*hx));
  c_ = (-k*hx^(-2)) + (beta_x/(2*hx));
  d_ = (-k*hy^(-2)) - (beta_y/(2*hy));
  e_ = (-k*hy^(-2)) + (beta_y/(2*hy));
endfunction
