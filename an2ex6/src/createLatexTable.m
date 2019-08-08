function createLatexTable(filename,tablename,cols,lins,linName)
  %Cria o arquivo e define as macros
  file = fopen(filename,"a");
  dispFile = @(str) fprintf(file,"%s\n",str);
  toString = @(contentLine) strjoin(contentLine," & ");
  tableLine = @()   dispFile("    \\hline");
  
  %Monta o cabeçalho da tabela
  dispFile("\\begin{table}[h]");
  dispFile("  \\centering");
  dispFile(sprintf("  \\begin{tabular}{|%s}",repmat(" c |",1,length(cols))));
  tableLine();
  dispFile(sprintf("    \\rowcolor[HTML]{C0C0C0}%s\\\\",toString(cols)));
  tableLine();
  
  %Preenche as linhas da tabela
  for i = 1:length(lins)
    if linName
      dispFile(sprintf("    \\cellcolor[HTML]{C0C0C0}%s & %s\\\\",lins{i}{1}, toString(lins{i}{2})));
    else
      dispFile(sprintf("    %s\\\\",toString(lins{i})));
    endif
    tableLine();
  endfor
  
  %Termina a tabela
  dispFile("  \\end{tabular}");
  dispFile(sprintf("  \\textbf{\\caption{%s}}",tablename));
  dispFile("\\end{table}");
  dispFile("");
  
  fclose(file);
endfunction
