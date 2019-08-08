function exerc2(file, k)

  % Verificação do parâmetro file.
	if !ischar(file) || isempty(strfind(file,".mat"))
		fprintf("Invalid parameter!\n\
    Filename must be a string with \"\.mat\"\ extension.\n\
    Correct usage: exerc2(\"filename.mat\"\,k)\n");
		return;
	elseif le(k,0) || ne(mod(k,1),0)
    fprintf("Invalid parameter!\n\
    k must be an positive integer representing the restart parameter.\n\
    Correct usage: exerc2(\"filename.mat\"\,k)\n");
    return;
  endif

  feval("load", file)
  A = Problem.A;

  %Define as constantes do problema
  n = rows(A);
  b = A*ones(n,1);
  rtol = 1e-5; maxit = 1e4; 
  
  %Cria as variáveis de controle e a figure
  figure("numbertitle","off","name",sprintf("Matriz %s",file));
  legenda = {}; hold on;
  
  %GMRES normal
%  my_gmres(A,b,k,rtol,maxit);
%  legenda{end+1} = "Normal";

  [L1,U1,L2,U2] = precondicionadoresILU(A);
    
  %Fatoração ILU(0)
  fprintf("ILU(0)\n");
  my_gmres(A,b,k,rtol,maxit,L1,U1);
  legenda{end+1} = "ILU(0)";
  
  %Fatoração ILU(n)
  fprintf("ILU inc.\n");
  my_gmres(A,b,k,rtol,maxit,L2,U2);
  legenda{end+1} = "ILU inc.";
  
  %Reordenamento do sistema
  perm = symrcm(A);
  P = speye(n,n)(perm,:);
  R = A(perm,perm);
  
  [L1,U1,L2,U2] = precondicionadoresILU(R);
  
  fprintf("ILU(0) com reord.\n");
  my_gmres(R,P*b,k,rtol,maxit,L1,U1);
  legenda{end+1} = "ILU(0) com reord.";
  
  fprintf("ILU com reord.\n");
  my_gmres(R,P*b,k,rtol,maxit,L2,U2);
  legenda{end+1} = "ILU com reord.";
  
  %Precondicionamento Gauss-Seidel
  [M1,M2] = pre_seidel(A);
  fprintf("Prec. Seidel\n");
  my_gmres(A,b,k,rtol,maxit,M1,M2);
  legenda{end+1} = "Prec. Seidel";
  
  hold off;
  l = legend(legenda);
  set(l,'fontsize',20);
  set(gca,'linewidth', 2, 'fontsize',12);
endfunction

function my_gmres(A,b,k,rtol,maxit,M1 = [],M2 = [])
  tic;
  if M1 == [] || M2 == []
    if M1 == [] && M2 == []
      [x,flag,relres,iter,resvec] = gmres(A,b,k,rtol,maxit);
    else
      [x,flag,relres,iter,resvec] = gmres(A,b,k,rtol,maxit,M1);
    endif
  else
    [x,flag,relres,iter,resvec] = gmres(A,b,k,rtol,maxit,M1,M2);
  endif
  toc; flag, length(resvec), iter, norm(x,inf)
  fprintf("\n");
  plot(0:length(resvec)-1,log(resvec),'linewidth', 2);
endfunction

function [L1,U1,L2,U2] = precondicionadoresILU(A)
  %Fatoração ILU(0)
  opts.type = "nofill";
  [L1,U1] = ilu(A,opts);
  
  %Fatoração ILU(n)
  opts.type = "crout";
  opts.droptol = 1e-4;
  [L2,U2] = ilu(A,opts);
endfunction
