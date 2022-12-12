function Inv = inversa(A)
%% La inversa se define como I = Adjunta(A transpuesta)/determinante de A
determinante = det(A); %obtencion del determinante de A
At= transpose(A); %obtención de la transpuesta de A
%% Obtenemos la adjunta de A transpuesta
[filas,columnas] = size(A);
Aadj = ones(filas); %generamos una matriz llena de 1's de nxn, es una matriz auxiliar
for i=1:filas %%Llenamos la matriz Adjunta en cada uno de sus elementos
    for j = 1: columnas
        
        if(mod(i,2)==0) %el factor depende de las posiciones de la matriz, ya sea 1 o -1 dependiendo de donde este
            if(mod(j,2)==1)
                factor = -1;% si la fila es par y columna es impar, el factor es -1
            else
                factor = 1;
            end
        else
            if(mod(j,2)==0)
                factor = -1; % si la fila es impar y la columna par, el factor es -1
            else
                factor=1;
            end
        end
        Cof = At;   % A partir de la matriz
        Cof(i,:) = []; %eliminamos la fila i
        Cof(:,j) = []; %eliminamos la columna j para obtener el cofactor
        Aadj(i,j)= factor*det(Cof); %el elemento i,j de la matriz adjunta es el determinante del cofactor multiplicador por el factor
    end
end
Inv = Aadj/determinante;%I = Adjunta(A transpuesta)/determinante de A
Comprobacion = Inv*A%%Si al multiplicar la inversa sale la identidad se cumple la inversa
end
