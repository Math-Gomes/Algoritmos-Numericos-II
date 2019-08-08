function plotMat()
    path = "matrizes/mat_linxcol/exerc1/";
    ext = ".mat";
    
    mtx_names = readdir(path)(3:end) % Guarda o nome da todos os arquivos do diret�rio.
    enter = @(n) printf(repmat("\n",[1,n]));

    for i = 1:size(mtx_names)
        if !isempty(strfind(mtx_names{i}, ext)) % Verifica se arquivo possui a extens�o .mat.
            %Cria matriz A
            file = mtx_names{i}
            feval("load", strcat(path,file))
            A = Problem.A;
            spy(A);
        endif
    endfor

endfunction