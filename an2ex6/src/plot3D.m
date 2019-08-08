function plot3D(x,y,u,n,m)
  [X,Y] = meshgrid(x',y');
  U = reshape(u,m,n);
  mesh(X,Y,U);
endfunction
