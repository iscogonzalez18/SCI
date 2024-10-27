%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% APROXIMACIÓN DE FUNCIONES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; close all;
% DEFINICIÓN DE LOS VECTORES DE ENTRADA-SALIDA
% ============================================
t = -3:.1:3; % eje de tiempo
F=sinc(t)+.001*randn(size(t)); % función que se desea aproximar
plot(t,F,'+');
title('Vectores de entrenamiento');
xlabel('Vector de entrada P');
ylabel('Vector Target T');
% DISEÑO DE LA RED
% ==================
hiddenLayerSize = 4;
net = fitnet(hiddenLayerSize,'trainrp');
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;
net = train(net,t,F);
Y=net(t);
plot(t,F,'+'); hold on;
plot(t,Y,'-r'); hold off;
title('Vectores de entrenamiento');
xlabel('Vector de entrada P');
ylabel('Vector Target T');

%%%%%%%%%%%%%%%%%%%%%%%%%%
% Método de entrenamiento 
%%%%%%%%%%%%%%%%%%%%%%%%%%
close all;

metodos = {'trainlm', 'trainbr', 'trainscg', 'traingd'};

for i = 1:length(metodos)
    close all;
    net = fitnet(hiddenLayerSize, metodos{i});
    net.divideParam.trainRatio = 70/100;
    net.divideParam.valRatio = 15/100;
    net.divideParam.testRatio = 15/100;

    % Entrenar y evaluar
    net = train(net, t, F);
    Y = net(t);

    % Gráfica de comparación
    figure;
    plot(t, F, '+'); hold on;
    plot(t, Y, '-r'); hold off;
    title(['Método: ', metodos{i}, ', Neuronas: 4']);
    xlabel('Vector de entrada P');
    ylabel('Vector Target T');
    legend('Datos originales', 'Aproximación de la red');
    disp('Presiona cualquier tecla para continuar...');
    pause;  % Esto pausará la ejecución hasta que se pulse una tecla
end

%se ve que la mejor es trainbr
%ahora se probarán las neuronas

%%%%%%%%%%%%%%%%%%%%
% Número de neuronas 
%%%%%%%%%%%%%%%%%%%%
close all;

neuronas_title = {'1', '4', '10', '15', '20'}; % Diferentes números de neuronas a probar
neuronas = [1, 4, 10, 15, 20];

for i = 1:length(neuronas)
    close all;
    net = fitnet(neuronas(i), 'trainlm');
    net.divideParam.trainRatio = 70/100;
    net.divideParam.valRatio = 15/100;
    net.divideParam.testRatio = 15/100;
    
    % Entrenar y evaluar
    net = train(net, t, F);
    Y = net(t);
    
    % Gráfica de comparación
    figure;
    plot(t, F, '+'); hold on;
    plot(t, Y, '-r'); hold off;
    title(['Método: trainlm, Neuronas: ', neuronas_title(i)]);
    xlabel('Vector de entrada P');
    ylabel('Vector Target T');
    legend('Datos originales', 'Aproximación de la red');
    disp('Presiona cualquier tecla para continuar...');
    pause;  % Esto pausará la ejecución hasta que se pulse una tecla
end


