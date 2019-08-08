function [x,iter,ER] = iterMethod(M,c,tol,nmaxiter,metodo)
	   %tic;
     x = x0 = zeros(rows(M),1);
     iter = er = 1;
     ER = [er];
     
     while (er > tol) && (iter < nmaxiter)
       x = c + M*x0;
       er = norm(x-x0,inf)/norm(x,inf);
       ER(iter+1) = er;
       x0 = x;	iter++;   
     endwhile
     
     printf("%s - Convergencia obtida apos %d iteracoes\n",metodo,iter);
     printf("Norma do erro relativo = %g\n",er);
     %toc; 
     disp("");
endfunction;
