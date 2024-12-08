%Tiempo de muestreo
Ts=100e-3 
% Referencia x-y de posicion
refx=5; 
refy=5;
% x_0=0.02;
% y_0=0.02;
% th_0=0;
obsx=2; 
obsy=0.5;
% Ejecutar Simulacion
sim('EvitarObstaculo.slx')
% Mostrar
x=salida_x.signals.values;
y=salida_y.signals.values;
figure;
plot(x,y);
hold on;
plot(obsx, obsy, 'ro', 'MarkerSize', 15, 'LineWidth', 2);
plot(refx, refy, 'go', 'MarkerSize', 15, 'LineWidth', 2);
title('Trayectoria del Robot con Obstáculo');
grid on;
hold off; 