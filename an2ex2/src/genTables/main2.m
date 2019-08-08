function main2(path,ext)    
    mtx_names = readdir(path)(3:end); % Guarda o nome da todos os arquivos do diret�rio.
    enter = @(n) printf(repmat("\n",[1,n]));
    k_max = [47 276 242];
    
    %C�lula com as informa��es de cada linhda da tabela
    gmres_prop = {{"$Dim(K)$",[]},
                  {"Converg�ncia",{}},
                  {"N�mero de Itera��es",{}},
                  {"Res�duo Rel. ",[]},
                  {"$||x||_\\infty$",[]},
                  {"$\\Delta T_{seg}$",[]}};
    feval("delete","GMRESTables.txt");

    for i = 1:size(mtx_names)
        if !isempty(strfind(mtx_names{i}, ext)) % Verifica se arquivo possui a extens�o .mat.
            %Cria matriz A
            file = mtx_names{i}
            feval("load", strcat(path,file))
            A = Problem.A;

            %Resolve o sistema pelo M�todo dos GMRES com restart
            disp("Running Exercise 2...");
            A_prop = exerc2(A,k_max(i),file);
            
            for i = 1:length(A_prop)
              gmres_prop{i}{2} = A_prop{i};
            endfor
            
            genGMRESTableFile("M�todo GMRES com Restart",file,gmres_prop,[2 3]);
            
            disp("Finish!");
        endif
    endfor
endfunction