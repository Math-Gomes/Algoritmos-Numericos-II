function genPCGTableFile(tableName,propList)
  %Cria o arquivo e define as macros
  file = fopen("PCGTable.txt","w");
  dispFile = @(str) fprintf(file,"%s\n",str);
  toString = @(numList) strjoin(strsplit(num2str(numList))," & ");
  tableLine = @()   dispFile("          \\hline");

  %Monta o cabeçalho da tabela
  mtxNames = propList{1}{2};
  dispFile("   \\begin{table}[h]");
  dispFile("	    \\centering");
  dispFile(sprintf("	    \\begin{tabular}{|%s}",repmat(" c |",1,length(mtxNames)+1)));
  tableLine();
  dispFile(sprintf("	        Matriz & %s\\\\",strjoin(mtxNames," & ")));
  tableLine();
  
  %Preenche as linhas da tabela
  for i = 2:length(propList)
    dispFile(sprintf("          %s & %s\\\\",propList{i}{1}, toString(propList{i}{2})));
    tableLine();
  endfor

  %Termina a tabela
  dispFile("	    \\end{tabular}");
  dispFile(sprintf("	    \\textbf{\\caption{%s}}",tableName));
  dispFile("	\\end{table}");
  
  fclose(file);
endfunction
