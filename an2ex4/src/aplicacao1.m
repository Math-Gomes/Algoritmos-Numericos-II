function aplicacao1()
  %Variáveis do problema
  a = 0; b = 10;
  N = [10 50 100];
  
  figure; hold on; legenda = {};
  for i = 1:length(N)
    n = N(i);
    [x,u] = pvc(a,b,n,1,40,[],[],[],[],1,200,[],[],[],[],"aplicacao1");
    plot(x,u);
    legenda{end+1} = sprintf("n = %d",n);
  endfor
  legend(legenda); hold off;
endfunction