function main()
    path = "matrizes/exerc2/";
    ext = ".mat";
    
    mtx_names = readdir(path)(3:end) % Guarda o nome da todos os arquivos do diret�rio.
    enter = @(n) printf(repmat("\n",[1,n]));
    % k_max = [276]; % dw1024
    % k_max = [242]; % trans4
    % k_max = [88]; % plat362
    % k_max = [18]; % GD02_a
    % k_max = [99]; % rajat19
    % k_max = [47]; % curtis54
    % k_max = [3]; % watt_1 k=1, coloquei 3 ali pq tava dando erro
    k_max = [40];

    for i = 1:size(mtx_names)
        if !isempty(strfind(mtx_names{i}, ext)) % Verifica se arquivo possui a extens�o .mat.
            %Cria matriz A
            file = mtx_names{i};
            feval("load", strcat(path,file))
            A = Problem.A;
            
            %Resolve o sistema pelo M�todo dos Gradientes Conjugados
            % disp("Running Exercise 1...");
            % exerc1(A,file);
            % enter(1);
            
            %Resolve o sistema pelo M�todo dos GMRES com restart
            disp("Running Exercise 2...");
            k_max(i)
            exerc2(A,k_max(i),file);
            enter(1);
            
            % disp("Finish!");
            % enter(2);
        endif
    endfor
endfunction