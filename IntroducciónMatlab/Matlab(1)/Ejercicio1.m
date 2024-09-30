fprintf("Puesto 10 Laboratorio\n")
fprintf("EJERCICIO 1 Matrices y Vectores\n")

fprintf("1\n")
A = [1 2; 3 4; 5 6; 7 8]    % declaración matriz
v = [14; 16; 18; 20]    % declaración vector

fprintf("2\n")
B = [A v]   % concatenación

fprintf("3\n")
c = B(1,:)  % primera fila

fprintf("4\n")
d = B(:, 1) % primera columna