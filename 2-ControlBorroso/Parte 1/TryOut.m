%Tiempo de muestreo
Ts=100e-3 
% Referencia x-y de posicion
refx=10*rand-5;
refy=10*rand-5;
% Ejecutar Simulacion
sim('PositionControl_c.slx')
% Mostrar
x=salida_x.signals.values;
y=salida_y.signals.values;
figure;
plot(x,y);
hold on;
plot(refx,refy,'ro');
grid on;
hold on; 