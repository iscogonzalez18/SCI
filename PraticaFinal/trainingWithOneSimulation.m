%sim('ackerman_modelo_parte1.slx');



%Se separan las entradas y las salidas
inputs = training_data(:, 1:12)';
outputs = training_data(:, 18:19)';
inputs(isinf(inputs)) = 5.0;
inputs = double(inputs);
outputs = double(outputs);

capa1 = 12;
capa2 = 12;

net = feedforwardnet([capa1, capa2]);

net = configure(net, inputs, outputs);
net = train(net, inputs, outputs);

Ts = 0.1;
gensim(net, Ts);