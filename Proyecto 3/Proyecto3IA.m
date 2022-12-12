%% Introducimos los valores X's y los valores de Y
tic
X =[ 1 4 5;
     7 6 7;
     4 7 9;
     4 9 1];
Y = [2 ;
     4;
     6;
     8];
 b0 = ones(length(Y),1);   
 XM =[-1*Y b0 X];

 %% Obetenemos la matriz M
[numRows,numCols] = size(XM);
S = 0;
for i = 1: numRows
    p = XM(i,:);%cada vector p es una fila de XM
    pt = transpose(p);
    Mn = pt*p;%Matriz p al cuadrado
    S = S + Mn; %Suma de matrices M, resulta en S
end

 %% Se obtienen las derivadas parciales a partir de M
 dS = [];
 for i = 2: numCols
   element = 2*S(i,:);%Cada derivada parcial es una fila de la matriz exceptuando la primera fila, esto multiplicado por dos
   dS= [dS ;element]; % Vector con una expresion de derivada parcial
end

%% Separamos la matriz de derivadas parciales en los terminos independientes y el resto
[numRows,numCols] = size(dS);% se obtiene el numero de filas y de columnas
B = dS(:,1)*-1;% Vector de términos independientes, se multiplica por -1 ya que se esta despejando
A = dS(:,2:numCols) %Matriz de coeficientes
C = inv(A)*B% Resolución de sistema de ecuaciones
Ynew= X*C(2:length(C)) + C(1)
desviacion = (Ynew-Y);
varianza = sum(desviacion.^2)/length(Y)
toc
    