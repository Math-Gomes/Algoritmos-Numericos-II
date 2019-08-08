function [M1,M2] = pre_seidel(A)
  M1 = tril(A)*inv(diag(diag(A)));
  M2 = triu(A);
endfunction