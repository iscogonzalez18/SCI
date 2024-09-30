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

Matriz = rellenarMatriz([filas cols])
