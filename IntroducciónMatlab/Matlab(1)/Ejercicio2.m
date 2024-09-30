fprintf("Puesto 10 Laboratorio\n")
fprintf("EJERCICIO 2 Matrices y Vectores\n")

fprintf("1\n")
dimension = input("Indique el tamaño de la matriz\n");

fprintf("2\n")
fprintf("a\n")
% matriz dimensionXdimension rellenada con valores aleatorios del 1 al 10
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

figure;
hold on
plot(maximos, 'DisplayName', 'Máximos');
plot(minimos, 'DisplayName', 'Mínimos');
plot(media, 'DisplayName', 'Media');
plot(varianza, 'DisplayName', 'Varianza');
xticks(1:dimension)

xlabel('Fila');
ylabel('Valor')
title('Análisis de datos')
legend('show')
grid on;

hold off;