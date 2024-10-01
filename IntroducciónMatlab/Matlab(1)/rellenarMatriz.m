function Matriz = rellenarMatriz(dim)
    Matriz = zeros(dim(1), dim(2));

    for i = 1:dim(1)
        for j = 1:dim(2)
            entrada = input(['Ingrese un valor para la posición (', num2str(i), ',', num2str(j), ') o "r" para rellenar el resto aleatoriamente: '], 's'); % string
            
            if entrada == 'r'
                for ii = i:dim(1)
                    for jj = (j:dim(2))
                        Matriz(ii, jj) = randi([1, 10]);
                    end
                    j = 1; % recogemos carrete para nueva fila
                end
                return; % Salir de la función ya que la matriz está completa
            else
                % Convertir la entrada a un número y asignarlo a la matriz
                Matriz(i, j) = str2double(entrada);
            end
        end
    end
end
