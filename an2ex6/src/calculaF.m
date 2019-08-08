function f = calculaF(u, k, beta_x, beta_y, gama)
    syms x y;

    us = u(x, y);
    ux = simplify(diff(us, x));
    uy = simplify(diff(us, y));
    ux2 = simplify(diff(ux, x));
    uy2 = simplify(diff(uy, y));

    fs = -k * (ux2 + uy2) + beta_x(x, y) * ux + beta_y(x, y) * uy + gama(x, y) * us;
    f = matlabFunction(simplify(fs));  
endfunction