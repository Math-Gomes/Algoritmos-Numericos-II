function exerc2(A,k_max,file)
  n = rows(A)
  b = A*ones(n,1);
  
  % figure("numbertitle","off","name",sprintf("Matriz %s",file));
  % hold on; legenda = {};
  
  file
  % for p = 0.2:0.2:1
    p = 1;
    k = round(p*k_max);
    rtol = 1e-5;
    maxit = 1e4; tic;
    [x,flag,relres,iter,resvec] = gmres(A,b,k,rtol,maxit);
    toc;
    
    k, flag, iter, n_resvec = norm(resvec,inf), nx_inf = norm(x,inf)
    fprintf("n iter = %d\n\n", length(resvec));

    % plot(0:length(resvec)-1,log(resvec));
    % legenda{end+1} = sprintf("k = %d",k);
    
  %   if iter(1) == 1
  %     break
  %   endif
  % endfor
  
  % l = legend(legenda);
  % set(l,'fontsize',12);
  % hold off;
endfunction
