% Analisa a convergência da matriz pelo Teorema do raio espectral
function convAnalyse(M,method)
  r_spec = @(A) max(abs(eig(A)));
  r = r_spec(M);
  
  fprintf("Raio espectral = %.7g - ",r);
  if r < 1
    fprintf("Converge no metodo de %s\n",method);
  else
    fprintf("Nao converge no metodo de %s\n",method);
  endif
endfunction
