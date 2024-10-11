fprintf("Puesto 10 Laboratorio\n")
fprintf("EJERCICIO 3 Matrices y Vectores\n")

fprintf("\n1\n")
dimensiones = input("Indique las dimensiones de la matriz como una lista\n");

if length(dimensiones) == 1
    filas = dimensiones
    cols = dimensiones
else
    filas = dimensiones(1)
    cols = dimensiones(2)
end

fprintf("\n2 y 3\n")
fprintf("Primera matriz\n")
A = rellenarMatriz([filas cols]);
fprintf("Segunda matriz\n")
B = rellenarMatriz([filas cols]);

fprintf("\n4\n")
A
B

A_transpuesta = B'
B_transpuesta = B'

if filas == cols
    A_inversa = inv(A)
    B_inversa = inv(B)
else
    fprintf("No se puede hacer la inversa si la matriz no es cuadrada.\n");
end

if filas == cols
    det_A = det(A)
    det_B = det(B)
else
    fprintf("No se puede hacer el determinante si la matriz no es cuadrada.\n");
end

rango_A = rank(A)
rango_B = rank(B)

if filas == cols
    producto_matricial = A * B
else
    fprintf("No se puede hacer la multiplicación matricial si no coinciden las columnas de la primera matriz y las filas de la segunda.\n");
end

producto_elemento_a_elemento = A .* B

vector_fila_A = A';
vector_fila_A = vector_fila_A(:)'

vector_fila_B = B';
vector_fila_B = vector_fila_B(:)'

vector_columna_A = A(:)
vector_columna_B = B(:)



