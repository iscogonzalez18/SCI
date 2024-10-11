fprintf("Puesto 10 Laboratorio\n")
fprintf("EJERCICIO 4. Representación gráfica en 3D. \n")

% Área de trabajo 
x = linspace(-5, 5, 100); % 100 valores entre -5 y 5 para x
y = linspace(-5, 5, 100);
[X, Y] = meshgrid(x, y); %se crean matrices X e Y a partir de los valores anteriores

% Función Z
% cada vez que se multiplican matrices se hace la operación de punto por
% punto
Z = Y .* sin(pi * X / 10) + 5 * cos((X.^2 + Y.^2) / 8) + cos(X + Y) .* cos(3*X - Y);

% Se crea la figura
figure('Position', [150, 50, 800, 600]);  % Figura de 1200x800 píxeles

% Primera subgráfica: Gráfico de la superficie (parte superior centrada)
subplot(2, 2, [1, 2]); %subplot de 2 filas x 2 columnas. ocupa la posición 1 y 2, o sea las dos de arriba
surf(X, Y, Z); %Representación de la superficie 3D con los puntos de X e Y y los calculados de Z
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Superficie');
shading interp; % Suaviza la superficie
colorbar; % Añade barra de color
view(3);  % Vista 3D estándar

% Segunda subgráfica: Superficie en forma de malla (parte inferior izquierda)
subplot(2, 2, 3); %subplot de 2 filas x 2 columnas. ocupa la posición 3, o sea la inferior izquierda
mesh(X, Y, Z); %Representación en forma de malla.
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Superficie en forma de malla');
view(3);  % Vista 3D estándar 

% Tercera subgráfica: Gráfico del contorno (parte inferior derecha)
subplot(2, 2, 4); %subplot de 2 filas x 2 columnas. ocupa la posición 4, o sea la inferior derecha
contourf(X, Y, Z, 20);  % Dibuja el contorno relleno con 20 niveles
xlabel('X');
ylabel('Y');
title('Gráfica del contorno');
colorbar;  % Añadir barra de color
