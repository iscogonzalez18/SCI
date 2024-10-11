fprintf("Puesto 10 Laboratorio\n")
fprintf("EJERCICIO 5. Transformadas de señales. \n")

fprintf("\nApartado 1\n")

syms k z %se definen lss variables simbólicas k y z

% definición de la función f(k)
f_k = 2 + 5*k + k^2;

% transformada Z de f(k)
F_z = ztrans(f_k, k, z);

% resultado de la transformada
disp('Transformada Z de f(k):');
disp(F_z);

%representación gráfica
% valores numericos para k y resultado de la función de esos valores k
k_vals = 0:10;
f_vals = 2 + 5*k_vals + k_vals.^2;

%grafica de la señal original
figure;
subplot(1, 2, 1);
stem(k_vals, f_vals, 'filled');
title('Señal original: f(k)');
xlabel('k');
ylabel('f(k)');
grid on;

%grafica de la transformada Z (solo como magnitud para valores discretos)
z_vals = linspace(0.1, 2, 100);
F_vals = double(subs(F_z, z, z_vals));  % Evaluar la transformada Z para valores de z

subplot(1, 2, 2);
plot(z_vals, abs(F_vals));
title('Transformada Z de f(k)');
xlabel('z');
ylabel('|F(z)|');
grid on;

fprintf("\nApartado 2\n")

syms a %se define solo a porque k ya la definimos antes

% función f(k)
f_k = sin(k) * exp(-a*k);

%transformada Z de f(k)
F_z = ztrans(f_k, k, z);

%resultado de la transformada
disp('Transformada Z de f(k):\n');
disp(F_z);

%se define un valor constante de a y los valores para k y se calcula el
%resultado de la funcion
a_val = 0.5;
k_vals = 0:10;
f_vals = sin(k_vals) .* exp(-a_val * k_vals);

% grafica de la señal original
figure;
subplot(1, 2, 1);
stem(k_vals, f_vals, 'filled');
title('Señal original: f(k)');
xlabel('k');
ylabel('f(k)');
grid on;

% 100 valores equidistantes de z se usarán para graficar la transformada Z 
z_vals = linspace(0.1, 2, 100);
% sustituye el valor de a por a_val y z por los de z_vals en la
% transformada Z y double convierte la expresión en valores numéricos para
% graficarla.
F_vals = double(subs(F_z, {a, z}, {a_val, z_vals}));

% grafica de la transformada Z
subplot(1, 2, 2);
plot(z_vals, abs(F_vals));
title('Transformada Z de f(k)');
xlabel('z');
ylabel('|F(z)|');
grid on;

fprintf("\nApartado 3\n")

%función de transferencia discreta
num = [0.4 0 0];  % Numerador: 0.4*z^2
den = [1 -1 0.1 0.02];  % Denominador: z^3 - z^2 + 0.1*z + 0.02
sys = tf(num, den, -1);  % Resultado de función

% representación de respuesta al impulso
figure;
subplot(1,2,1)
impulse(sys);
title('Respuesta al impulso del sistema');
grid on;

%representación de respuesta al escalón
subplot(1,2,2)
step(sys);
title('Respuesta al escalón del sistema');
grid on;