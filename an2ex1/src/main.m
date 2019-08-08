function main()
    warning("off","all");
    path = "matrizes/"; % Diretório em que se encontram os arquivos com matrizes.
                        % OBS: Também poderia ser o path para este diretório.
    mtx_names = readdir(path)(3:end) % Guarda o nome da todos os arquivos do diretório.
    w = [1.07 1.25 1.99 1.95 1 1.04];
    
    for i = 1:size(mtx_names)
        if !isempty(strfind(mtx_names{i}, ".mtx")) % Verifica se arquivo possui a extensão .mtx.
            tic;
            file = mtx_names{i}
            
            generateMatrixFile(path,file);
            [A,n] = feval(file(1:end-length(".mtx")));  % Tira a extens�o
            b = A*ones(n,1);
            
            disp("Running Exercise 1...");
            exerc1(A,b,file); % Caso possua, resolvemos o exercício 1 com esta matriz.
            disp("");
            
            disp("Running Exercise 2...");
            exerc2(A,b,w(i));
            disp("");
            
            disp("Finish!");
            toc; disp("\n");
        endif
    endfor
endfunction