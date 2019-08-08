function [A,f] = createMatrix(a,b,c,d,n,m,exerc)
  dim = n*m;

  [a_,b_,c_,d_,e_,f] = exerc(a,b,c,d,n,m);
  b_ = b_(2:dim);
  c_ = c_(1:dim-1);
  d_ = d_(n+1:dim);
  e_ = e_(1:dim-n);
  
  A = gallery('tridiag',dim,b_,a_,c_);
  A(n+1:dim,1:dim-n) += sparse(diag(d_));
  A(1:dim-n,n+1:dim) += sparse(diag(e_));
endfunction