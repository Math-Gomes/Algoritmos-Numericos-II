function genGMRESTableFile(tableName,mtxName,propList,str_pos)
  %Cria o arquivo e define as macros
  file = fopen("GMRESTables.txt","a");
  dispFile = @(str) fprintf(file,"%s\n",str);
  toString = @(numList) strjoin(strsplit(num2str(numList))," & ");
  tableLine = @()   dispFile("          \\hline");

  %Monta o cabeçalho da tabela
  dispFile(sprintf("\n   %%Matriz %s",mtxName));
  dispFile("   \\begin{table}[h]");
  dispFile("	    \\centering");
  dispFile(sprintf("	    \\begin{tabular}{|%s}",repmat(" c |",1,length(propList))));
  tableLine();

  %Cria as colunas da tabela
  str = "	        ";
  for col = 1:length(propList)
     str = sprintf("%s%s & ",str,propList{col}{1});
  endfor
  fprintf(file,str(1:end-2)); 
  fprintf(file,"\\\\\n");
  tableLine();
  
  %Preenche as linhas da tabela
  for i = 1:length(propList{1}{2})
    str = "          ";
    for j = 1:length(propList)%-1
      if length(intersect(j,str_pos))
        str = sprintf("%s%s & ",str,propList{j}{2}{i});
      else
        str = sprintf("%s%.4g & ",str,propList{j}{2}(i));
      endif
    endfor
    fprintf(file,str(1:end-2)); 
    fprintf(file,"\\\\\n");
    tableLine();
  endfor

  %Termina a tabela
  dispFile("	    \\end{tabular}");
  dispFile(sprintf("	    \\textbf{\\caption{%s}}",tableName));
  dispFile("	\\end{table}");
  
  fclose(file);
endfunction
