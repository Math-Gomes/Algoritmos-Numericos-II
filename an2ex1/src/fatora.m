function [MJ,MS,MSOR,cJ,cS,cSOR]=fatora(A,b,w)
     D = diag(diag(A));
     E = tril(A) - D;
     F = triu(A) - D;

     MJ   = - inv(D)*(E+F);
     MS   = - inv(E+D)*F ;
     MSOR =  inv(D+w*E)*((1-w)*D-w*F);
     
     cJ = inv(D) * b;
     cS = inv(D+E) * b;
     cSOR = w * inv(D+w*E) * b;
endfunction;