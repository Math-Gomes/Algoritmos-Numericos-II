function generateMatrixFile(path,file)
  M = load (strcat(path,file));
  file   = file(1:end-length(".mtx"));   % Remove the extension
  myfile = fopen(strcat(file,".m"),"w"); % Open the file 

  n = M(1,1);
  nnz = M(1,3);
  
  fprintf(myfile,"function [A,n] = %s()\n",file);
  fprintf(myfile,"\tn = %d; A = eye(n);\n",n); % Create the matrix
  for iz = 2:nnz+1
    if M(iz,3) != 0
      fprintf(myfile,"\tA(%d,%d) = %g;\n",M(iz,1),M(iz,2),M(iz,3)) % Write a number
    endif
  endfor
  fprintf(myfile,"endfunction");
  
  fclose(myfile); % Close the file (very important)
endfunction