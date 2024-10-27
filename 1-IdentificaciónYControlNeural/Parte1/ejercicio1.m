% Datos de entrada (inputs)
X = [0.1 0.7 0.8 0.8 1.0 0.3 0.0 -0.3 -0.5 -1.5;
    1.2 1.8 1.6 0.6 0.8 0.5 0.2 0.8 -1.5 -1.3];
% Clases a las que pertenecen los datos
% en binario para representar: 
% 0, 0 = 0; 0, 1 = 1; 1, 0 = 2; 1, 1 = 3
Y = [1 1 1 0 0 1 1 1 0 0;
     0 0 0 0 0 1 1 1 1 1];

figure;
subplot(2, 2, 1); %subplot de 2 filas x 2 columnas. ocupa la posición 1
plotpv(X, Y);

% Crear una red neuronal
net = perceptron;
% Entrenar la red neuronal
net = train(net, X, Y);

subplot(2, 2, 2); %subplot de 2 filas x 2 columnas. ocupa la posición 1
plotpv(X, Y);
plotpc(net.iw{1, 1}, net.b{1});

% Agregar el nuevo dato [0.0 -1.5]
nuevo_dato = [0.0; -1.5];
X = [X nuevo_dato];
Y = [Y [1; 1]];

% Visualizar los datos actualizados
subplot(2, 2, 3);
plotpv(X, Y);

% Se vuelve a entrenar la red neuronal
net = train(net, X, Y);

% Visualizar la superficie de separación
subplot(2, 2, 4);
plotpv(X, Y);
plotpc(net.iw{1, 1}, net.b{1});