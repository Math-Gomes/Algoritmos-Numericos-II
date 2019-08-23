## Observação:

Foi feita uma modificação no arquivo Func.m. Por análise da fórmula dada no PDF de especificação, foi verificada um possível erro nos sinais da função G(x).

    -u'' - lambda*exp^u = g(x)

    u'' + lambda*exp^u + g(x) = 0

    .: u(i-1) - 2*u(i) + u(i+1) + (h^2)*(lambda * exp(u(i)) + pi^2 * sin(pi*x(i)) - lambda*exp(sin(pi*x(i))))

No arquivo fornecido:

    u(i-1) - 2*u(i) + u(i+1) + (h^2)*(lambda * exp(u(i)) - pi^2 * sin(pi*x(i)) + lambda*exp(sin(pi*x(i))))

Modificações feitas:

    u(i-1) - 2*u(i) + u(i+1) + (h^2)*(lambda * exp(u(i)) + pi^2 * sin(pi*x(i)) - lambda*exp(sin(pi*x(i))));

Não foi entregue por parte da professora o arquivo com a correção deste trabalho, mas conseguimos nota 10.