fprintf("Puesto 10 Laboratorio\n")
fprintf("EJERCICIO 2 Matrices y Vectores\n")

fprintf("1)\n")
dimension = input("Indique el tamaño de la matriz ");
% matriz dimensionXdimension rellenada con valores aleatorios del 1 al 10
A = randi([1, 10], dimension, dimension);

fprintf("\n2)\n")
fprintf("Apartado a\n")
disp(A);

fprintf("Apartado b\n")
% se cogen todas las filas 
% de las columnas se empieza por la primera y se itera de dos en dos hasta el final
B = A(:,1:2:end)

fprintf("Apartado c\n")
C = diag(A)

fprintf("Apartado d\n")
maximos = max(A')
minimos = min(A')
media = mean(A')
varianza = var(A')

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