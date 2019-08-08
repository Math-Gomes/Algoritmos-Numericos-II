function A_prop = exerc2(A,k_max,file)
  %Define as constantes do problema
  n = rows(A);
  b = A*ones(n,1);
  rtol = 1e-5; maxit = 1e4; 
  
  %Cria as vari�veis de controle e a figure
  figure("numbertitle","off","name",sprintf("Matriz %s",file));
  hold on; legenda = {};
  vet_k = vet_res = vet_norm = vet_time = [];
  vet_conv = vet_iter = {};
  
  %Executa o m�todo para 5 k's diferentes
  for p = 0.2:0.2:1
    vet_k(end+1) = k = round(p*k_max);
    
    %Executa o m�todo e plota o resultado
    tic; t0 = time;
    [x,flag,vet_res(end+1),iter,resvec] = gmres(A,b,k,rtol,maxit);
    t1 = time; toc;
    plot(0:length(resvec)-1,log(resvec),'linewidth', 2);
    legenda{end+1} = sprintf("k = %d",k);
    
    %Atualiza as vari�veis de controle
    if flag
      vet_conv{end+1} = sprintf("N�o (flag %d)",flag);
    else
      vet_conv{end+1} = sprintf("Sim (flag %d)",flag);
    endif
    vet_norm(end+1) = norm(x,inf);
    vet_time(end+1) = t1-t0;
    
    % niter = iter(1)*k + iter(2);
    niter = length(resvec);
    vet_iter{end+1} = sprintf("%d (%d ciclos + %d iter.)",niter,iter(1),iter(2));
    
    %Verifica se o k � o m�nimo necess�rio para a converg�ncia
    if iter(1) == 1
      break
    endif
  endfor
  
  l = legend(legenda);
  set(l,'fontsize',20);
  set(gca,'linewidth', 2, 'fontsize',12);
  hold off;
  
  A_prop = {vet_k,vet_conv,vet_iter,vet_res,vet_norm,vet_time};
endfunction
