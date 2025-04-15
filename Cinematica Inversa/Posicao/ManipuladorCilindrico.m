%% Cinemática Inversa Manipulador Cilíndrico

%% Clear
clear
clc

%% Matriz Cilíndrica
T = [1 0 0 1;0 1 0 2;0 0 1 3;0 0 0 1]; %Colocar a Matriz dada aqui

%% Parametros da Matriz
x = T(1,4);
y = T(2,4);
z = T(3,4);

r = sqrt(x^2+y^2);
teta = atan2d(y,x);
q3 = z;

disp('r:');
disp(r);
disp('teta:');
disp(teta);
disp('q3:');
disp(q3);