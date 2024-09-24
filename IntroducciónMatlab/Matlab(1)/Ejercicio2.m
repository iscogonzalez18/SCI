fprintf("Puesto 10 Laboratorio\n")
fprintf("EJERCICIO 2 Matrices y Vectores\n")

fprintf("1\n")
dimension = input("Inserte la dimensión de la matriz cuadrada\n");

fprintf("2\n")
fprintf("a\n")
A = randi([1, 10], dimension, dimension)

fprintf("b\n")
% se coje todas las filas y de las columnas se empieza por la primera y se
% itera de dos en dos hasta el final
B = A(:,1:2:end)

fprintf("c\n")
C = diag(A)

fprintf("d\n")
maximos = max(transpose(A))
minimos = min(transpose(A))
media = mean(transpose(A))
varianza = var(transpose(A))

hold on
plot(1:dimension, maximos)
plot(minimos)
plot(media)
plot(varianza)