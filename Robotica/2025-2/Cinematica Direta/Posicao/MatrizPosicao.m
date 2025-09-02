%% Cinemática Inversa Posição

%% Clear
clear
clc

%% Matriz Posição
x = 1;
y = 1;
z = 1;
P = [x;y;z];

%% Dados dos elos
L1 = 10;
L2 = 5;

%% Resultado dos angulos
t2 =  acosd((x^2+y^2-L1^2-L2^2)/(2*L1*L2));
t1 = atan2d(x,y)-atand((L2*sind(t2))/(L1+L2*cosd(t2)));
disp(t1);
disp(t2);
