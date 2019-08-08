function main1(path,ext)    
    mtx_names = readdir(path)(3:end); % Guarda o nome da todos os arquivos do diretório.
    enter = @(n) printf(repmat("\n",[1,n]));
    
    %Célula com as informações de cada linhda da tabela
    pcg_prop = {{"Matriz",{}},
                {"Ordem",[]},
                {"Flag",[]},
                {"$N_{iter}$",[]},
                {"Resíduo Rel. ",[]},
                {"$||x||_\\infty$",[]},
                {"Condicionamento",[]},
                {"$Tempo_{seg}$",[]}};

    for i = 1:size(mtx_names)
        if !isempty(strfind(mtx_names{i}, ext)) % Verifica se arquivo possui a extensão .mat.
            %Cria matriz A
            file = mtx_names{i}(1:end-length(ext))
            feval("load", strcat(path,file))
            A = Problem.A;
            
            %Resolve o sistema pelo Método dos Gradientes Conjugados
            disp("Running Exercise 1...");
            A_prop = exerc1(A,file);
            
            %Atualiza a tabela com as novas informações
            pcg_prop{1}{2}{end+1} = A_prop{1};
            for i = 2:length(A_prop)
              pcg_prop{i}{2}(end+1) = A_prop{i};
            endfor

            disp("Finish!");
            enter(1);
        endif
    endfor
    
    genPCGTableFile("Método dos Gradientes Conjugados",pcg_prop);
endfunction