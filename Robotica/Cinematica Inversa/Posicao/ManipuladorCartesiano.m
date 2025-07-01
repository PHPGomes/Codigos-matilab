%% Cinemática Inversa Manipulador Cartesiano

%% Clear
clear
clc

%% Matriz Cartesiana
T = [1 0 0 1;0 1 0 2;0 0 1 3;0 0 0 1]; %Colocar a Matriz dada aqui

%% Parametros da Matriz

x = T(1,4);
y = T(2,4);
z = T(3,4);
disp('x:');
disp(x);
disp('y:');
disp(y);
disp('z:');
disp(z);