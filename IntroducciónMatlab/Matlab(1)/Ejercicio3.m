fprintf("Puesto 10 Laboratorio\n")
fprintf("EJERCICIO 3 Matrices y Vectores\n")

fprintf("1\n")
dimensiones = input("Indique las dimensiones de la matriz como una lista\n");

if length(dimensiones) == 1
    filas = dimensiones
    cols = dimensiones
else
    filas = dimensiones(1)
    cols = dimensiones(2)
end

fprintf("2 y 3\n")
A = rellenarMatriz([filas cols]);
B = rellenarMatriz([filas cols]);

fprintf("4\n")
A
B

A_transpuesta = B'
B_transpuesta = B'

A_inversa = inv(A);
B_inversa = inv(B);

det_A = det(A);
det_B = det(B);

rango_A = rank(A)
rango_B = rank(B)

producto_matricial = A * B

producto_elemento_a_elemento = A .* B

vector_fila = [A(1, :) B(1, :)];

vector_columna = [A(:, 1); B(:, 1)];



