
datos = [];

for i = 1:68
    % Construcción del nombre del archivo
    filename = sprintf('./prueba/datos%d', i);
    
    % Carga de datos
    loaded_data = load(filename);
    
    % Concatenación vertical
    datos = [datos; loaded_data.training_data];
end

% Transposición de los datos
inputs = datos(:, 1:12)';
outputs = datos(:, 18:19)';

% Sustitución de infinitos por 5.0
inputs(isinf(inputs)) = 5.0;

% Conversión a doble precisión
inputs = double(inputs);
outputs = double(outputs);

% Creación de la red neuronal feedforward
neuronas_capa1 = 15;
neuronas_capa2 = 7;

net = feedforwardnet([neuronas_capa1, neuronas_capa2]);

% Configuración y entrenamiento de la red
net = configure(net, inputs, outputs);
net = train(net, inputs, outputs);

% Generación de un bloque Simulink
Ts = 0.1;
gensim(net, Ts);



