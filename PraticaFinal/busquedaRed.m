%% 1. Cargar datos

datos = [];
numSimulaciones = 68;

for i = 1:numSimulaciones
    % Construir el nombre del archivo
    filename = sprintf('./prueba/datos%d', i);
    
    % Cargar la estructura
    loaded_data = load(filename);
    
    % Cada 'training_data' sea una matriz con 
    % columnas >= 19, y filas = instantes de simulación.
    datos = [datos; loaded_data.training_data];
end

disp('Datos cargados correctamente.');


%% 2. Separar en Inputs y Outputs
% Suponiendo:
% - Las columnas 1..12 = sensores
% - Las columnas 18..19 = [velocidad, giro]
% Ajusta según tu estructura real.

inputs  = datos(:, 1:12)';
outputs = datos(:, 18:19)';

% Sustituir Inf por 5.0 en inputs (según tu ejemplo)
inputs(isinf(inputs)) = 5.0;

% Convertir a double (por si vienen en single)
inputs  = double(inputs);
outputs = double(outputs);

[numFeatures, numSamples] = size(inputs);
fprintf('Total de muestras: %d\n', numSamples);


%% 3. Particionar (train/val/test)
% Por ejemplo, 70% train, 15% val, 15% test
trainRatio = 0.70;
valRatio   = 0.15;
testRatio  = 0.15;

% Barajamos índices
indices = randperm(numSamples);

trainSize = round(trainRatio * numSamples);
valSize   = round(valRatio   * numSamples);
testSize  = numSamples - trainSize - valSize;%sobran para test

idxTrain = indices(1:trainSize);
idxVal   = indices(trainSize+1 : trainSize+valSize);
idxTest  = indices(trainSize+valSize+1 : end);

Xtrain = inputs(:,  idxTrain);
Ytrain = outputs(:, idxTrain);

Xval   = inputs(:,  idxVal);
Yval   = outputs(:, idxVal);

Xtest  = inputs(:,  idxTest);
Ytest  = outputs(:, idxTest);

fprintf('Entrenamiento: %d muestras\n', size(Xtrain,2));
fprintf('Validación:    %d muestras\n', size(Xval,2));
fprintf('Test:          %d muestras\n', size(Xtest,2));


%% 4. Grid search en [8:20] (capa1) y [5:10] (capa2)

rangoCapa1 = 8:20;  % 13 valores
rangoCapa2 = 5:10;  % 6  valores

% Preparamos una tabla para almacenar resultados
% Guardaremos:
% - MSE en validación  (PerformanceVal)
% - Red               (Net)
% - Arquitectura      (Architecture)
% - MSE en entrenamiento (PerformanceTrain) - opcional para comparar
results = table('Size',[0 4], ...
    'VariableTypes', {'double','cell','cell','double'}, ...
    'VariableNames', {'PerformanceVal','Net','Architecture', ...
    'PerformanceTrain'});

contador = 0;

for n1 = rangoCapa1
    for n2 = rangoCapa2
        
        contador = contador + 1;
        fprintf('Entrenando red %d - Arquitectura: [%d, %d]\n', ...
            contador, n1, n2);
        
        % Crear la red con 2 capas ocultas
        net = feedforwardnet([n1 n2]);
        
        % Configuración de la división
        net.divideFcn = 'divideind';
        net.divideParam.trainInd = idxTrain;
        net.divideParam.valInd   = idxVal;
        net.divideParam.testInd  = idxTest;
        
        % ENTRENAMIENTO (trainlm)
        [net, tr] = train(net, inputs, outputs); %#ok<NASGU>
        
        % Predecir y calcular errores
        % MSE de entrenamiento
        Ytrain_pred = net(Xtrain);
        mseTrain    = perform(net, Ytrain, Ytrain_pred);
        
        % MSE de validación
        Yval_pred   = net(Xval);
        mseVal      = perform(net, Yval, Yval_pred);
        
        % Guardar en la tabla
        newRow = {mseVal, {net}, [n1, n2], mseTrain};
        results = [results; newRow]; %#ok<AGROW>
    end
end

% Ordenar por error de validación asc (menor => mejor)
results = sortrows(results, 'PerformanceVal', 'ascend');

% Quedarse con las 5 mejores
mejores5 = results(1:5, :);

disp('===== Las 5 mejores redes según error en validación (MSE) =====');
disp(mejores5);


%% 5. Evaluar la mejor red (la primera de la tabla) sobre test
bestNet   = mejores5.Net{1};
Ytest_pred = bestNet(Xtest);
mseTest   = perform(bestNet, Ytest, Ytest_pred);

fprintf('La mejor red: [%d, %d] neuronas, MSE en test = %.4f\n', ...
    mejores5.Architecture{1}(1), ...
    mejores5.Architecture{1}(2), ...
    mseTest);
