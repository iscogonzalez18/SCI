%Tiempo de muestreo
Ts=100e-3 
% Referencia x-y de posicion
refx=5; 
refy=5;
obsx=2.5; 
obsy=2;
% Ejecutar Simulacion
sim('PositionControlObstacle.slx')
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