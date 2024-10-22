Ts = 100e-3;
refx_values = [-1, -3, 3];
refy_values = [-2, 1, 2];

figure;
subplot_counter = 1;

errors_x = [];
errors_y = [];

for i = 1:length(refx_values)
    for j = 1:length(refy_values)
        refx = refx_values(i);
        refy = refy_values(j);
     
        sim('PositionControlNet.slx');
        sim('PositionControl.slx');

        posX_net = out_x_net.signals.values;
        posY_net = out_y_net.signals.values;
        
        posX = out_x.signals.values;
        posY = out_y.signals.values;

        minLengthX = min(length(posX_net), length(posX));
        minLengthY = min(length(posY_net), length(posY));

        posX_net_trimmed = posX_net(1:minLengthX);
        posY_net_trimmed = posY_net(1:minLengthY);
        posX_trimmed = posX(1:minLengthX);
        posY_trimmed = posY(1:minLengthY);
       
        error_x = mean(abs(posX_net_trimmed - posX_trimmed));
        error_y = mean(abs(posY_net_trimmed - posY_trimmed));

        errors_x(end+1) = error_x;
        errors_y(end+1) = error_y;

        subplot(length(refx_values), length(refy_values), subplot_counter);
        hold on;
        plot(posX_net, posY_net, 'b-', 'DisplayName', 'Red Neuronal');
        plot(posX, posY, 'r-', 'DisplayName', 'Controlador');
        
        xlabel('Posición X');
        ylabel('Posición Y');
        title(sprintf('Refx: %.2f, Refy: %.2f', refx, refy));
        legend('show', 'Location', 'West');
        grid on;
        hold off;

        subplot_counter = subplot_counter + 1;
    end
end

disp('Resumen de error medio absoluto');
for k = 1:length(errors_x)
    fprintf('Para Refx: %.2f y Refy: %.2f -> Error en X: %.4f, Error en Y: %.4f\n', ...
            refx_values(ceil(k / length(refy_values))), ...
            refy_values(mod(k - 1, length(refy_values)) + 1), ...
            errors_x(k), errors_y(k));
end

