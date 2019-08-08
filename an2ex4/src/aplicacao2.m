function aplicacao2()
  %Variáveis do problema
  a = 0; b = 1;
  N = [10 50 100];
  C_ref = [1e-1 1e-2 1e-3 1e-4];
  K = 1e-3; u_ref = 70;
  
  for i = 1:length(N)
    figure; hold on; legenda = {};
    for j = 1:length(C_ref)
      n = N(i); c_ref = C_ref(j);
      [x,u] = pvc(a,b,n,1,160,[],[],[],[],3,[],[],K,c_ref,c_ref*u_ref,"aplicacao2");
      plot(x,u);
      legenda{end+1} = sprintf("c_{ref} = %d",c_ref);
    endfor
    hold off; l = legend(legenda);
    set(l,'location','northeast');
    title(sprintf("n = %d", n));
  endfor
endfunction