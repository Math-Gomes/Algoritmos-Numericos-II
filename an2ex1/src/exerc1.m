function exerc1(A,b,file)
  %LETRA B
  ALU = {A};
  [ALU{2},ALU{3},~]=lu(A);
  
  %Listas auxiliares para o loop - LETRA C
  title_list = ["A" "L" "U"];
  figure("numbertitle","off","name",
         sprintf("%s - Configura��o de esparsidade das matrizes A, L e U",file));

  for i = 1:length(ALU)
    subplot (1,3,i);                           %Seleciona o �ndice do gr�fico na linha de plot
    spy(ALU{i});                               %Plota os coeficientes n�o nulos da matriz
    title(sprintf("Matriz %s",title_list(i))); %Escreve qual matriz est� representada
  endfor
  
  %LETRA D
  x = A\b;                 % Resolve o sistema da matriz A
  r = norm(b - A * x, inf) % Calcula a norma do res�duo de x
  
  %Calcula o condicionamento de A - LETRA E
  c = cond(A) %74 seg no maior caso
endfunction
