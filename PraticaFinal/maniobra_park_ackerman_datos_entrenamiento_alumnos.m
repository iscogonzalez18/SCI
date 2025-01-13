%% conectar
%***********************

rosshutdown
clear all
close all

rosinit('192.168.3.250')


global steering_wheel_angle;
global vel_lineal_ackerman_kmh;

%% ini_simulador_ACKERMAN
%***********************

%DECLARACIÓN DE SUBSCRIBERS
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Odometria
sub_odom=rossubscriber('/robot0/odom');
%Laser
%sub_laser = rossubscriber('/robot0/laser_1', rostype.sensor_msgs_LaserScan);
%Sonars

sonar_0 = rossubscriber('/robot0/sonar_0', rostype.sensor_msgs_Range);
sonar_1 = rossubscriber('/robot0/sonar_1', rostype.sensor_msgs_Range);
sonar_2 = rossubscriber('/robot0/sonar_2', rostype.sensor_msgs_Range);
sonar_3 = rossubscriber('/robot0/sonar_3', rostype.sensor_msgs_Range);
sonar_4 = rossubscriber('/robot0/sonar_4', rostype.sensor_msgs_Range);
sonar_5 = rossubscriber('/robot0/sonar_5', rostype.sensor_msgs_Range);
sonar_6 = rossubscriber('/robot0/sonar_6', rostype.sensor_msgs_Range);
sonar_7 = rossubscriber('/robot0/sonar_7', rostype.sensor_msgs_Range);
sonar_8 = rossubscriber('/robot0/sonar_8', rostype.sensor_msgs_Range);
sonar_9 = rossubscriber('/robot0/sonar_9', rostype.sensor_msgs_Range);
sonar_10 = rossubscriber('/robot0/sonar_10', rostype.sensor_msgs_Range);
sonar_11 = rossubscriber('/robot0/sonar_11', rostype.sensor_msgs_Range);


%DECLARACIÓN DE PUBLISHERS
%%%%%%%%%%%%%%%%%%%%%%%%%%
%Velocidad
pub_vel=rospublisher('/robot0/cmd_vel','geometry_msgs/Twist');

%GENERACION DE MENSAJES
%%%%%%%%%%%%%%%%%%%%%%%
msg_vel=rosmessage(pub_vel);


%Definimos la periodicidad del bucle
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r=robotics.Rate(10);

%Nos aseguramos de recibir un mensaje relacionado con el robot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
while (strcmp(sub_odom.LatestMessage.ChildFrameId,'robot0')~=1)
     sub_odom.LatestMessage
end

disp('Inicialización ACKERMAN finalizada correctamente');

%% ***********************


training_data=[];

% Recorrido de aparcamiento para obtener datos de entrenamiento.

%AVANCE 1

distancia=3.33

vel_lineal_ackerman_kmh = -3     %(km/h)
steering_wheel_angle =  21.7       % desde -90 a 90 grados.

avanzar_ackerman

% AVANCE 2

distancia=3.44

vel_lineal_ackerman_kmh = -1.8     %(km/h)
steering_wheel_angle =  -21.7       % desde -90 a 90 grados.

avanzar_ackerman

% AVANCE PRIMERO DESPUES DE VERTICE

distancia=1.5

vel_lineal_ackerman_kmh = -2     %(km/h)
steering_wheel_angle =  90       % desde -90 a 90 grados.

avanzar_ackerman

% AVANCE 3

distancia= 0.45

vel_lineal_ackerman_kmh = -0.5     %(km/h)
steering_wheel_angle =  0       % desde -90 a 90 grados.

avanzar_ackerman

% AVANCE 3

distancia=1.55

vel_lineal_ackerman_kmh = -2     %(km/h)
steering_wheel_angle =  90       % desde -90 a 90 grados.

avanzar_ackerman

% AVANCE 3

distancia= 4

vel_lineal_ackerman_kmh = -3     %(km/h)
steering_wheel_angle =  0     % desde -90 a 90 grados.

avanzar_ackerman


save ./datos2/datos8 training_data
