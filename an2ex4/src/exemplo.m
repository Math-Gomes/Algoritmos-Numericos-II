function exemplo()
  ex = "exemplo";
  %Variáveis do problema
  a = 0; b = 1;
  N = [10 25 50 100];
  figure;

  %Caso 1
  plot_erro('x','b',a,b,N,1,-1,[],[],[],[],1,1,[],[],[],[],ex);

  %Caso 2
  plot_erro('o','g',a,b,N,2,[],1,[],[],[],1,1,[],[],[],[],ex);

  %Caso 3
  plot_erro('s','r',a,b,N,1,-1,[],[],[],[],3,[],[],-1,2,-1,ex);

endfunction
