fprintf("Puesto 10 Laboratorio\n")
fprintf("EJERCICIO 1 Matrices y Vectores\n")

fprintf("1\n")
A = [1 2; 3 4; 5 6; 7 8]    % declaración matriz
v = [14; 16; 18; 20]    % declaración vector

fprintf("2\n")
B = [A v]   % concatenación

fprintf("3\n")
vector_fila = B' % transpuesta de B
vector_fila = vector_fila(:)'  % '(:)' transforma columnas de matriz a vector columna, y transpone (se convierte en fila)

fprintf("4\n")
vector_columna = B(:) % transforma columnas de matriz a vector columna