function exerc1(file)

	% Verificação do parâmetro file.
	if !ischar(file) || isempty(strfind(file,".mat"))
		fprintf("Invalid parameter!\nFilename must be a string with \"\.mat\"\ extension.\nCorrect usage: exerc1(\"filename.mat\"\)\n");
		return;
	endif

  feval("load", file)
  A = Problem.A;

  % Define as constantes do problema
  n = rows(A);
  b = A*ones(n,1);
  tol = 1e-5; maxit = 1e4; 
  % spy(A);

	% Opções utilizadas para calcular a fatoração ICC(0)
	opts.type = "nofill"; 
	L1 = ichol(A,opts);

	% Opções utilizadas para calcular a fatoração ICC com algum preenchimento
	opts.type = "ict"; 
	opts.droptol = 1e-4;
	L2 = ichol(A,opts);

	M = {L1,L2};
	preCond_names = {"ICC(0)","ICC"};

  figure("numbertitle","off","name",sprintf("Matriz %s",file));
	title("Iteracoes x log(Residuo Relativo)", "fontsize",14);

	hold on; legenda = {};
	for i = 1:length(M)
  	%Executa o método e printa os resultados
  	tic;
		fprintf("\nMatriz pre-condicionadora: %s\n", preCond_names{i});
  	[x,flag,relres,iter,resvec] = pcg(A,b,tol,maxit,M{i},M{i}');
		flag, relres, nx_inf = norm(x,inf), n_iter = length(resvec)
  	toc;
  
  	% Plota o gráfico do PCG
  	plot(0:length(resvec)-1,log(resvec));
		legenda{end+1} = preCond_names{i};
	endfor
  l = legend(legenda);
  set(l,'fontsize',12);
  hold off;
endfunction