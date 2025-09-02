%% Matriz Transformação Cilindrico

%% Clear
clear
clc

%% Paremetros
r = 10.77; % Raio (distância do eixo Z)
alfa = 21.8; % Ângulo de rotação ao redor do eixo Z
l = 7; % Deslocamento ao longo do eixo Z.
c = cosd(alfa);
s = sind(alfa);

%% Construção Matriz
T = [c -s 0 r*c;s c 0 r*s; 0 0 1 l; 0 0 0 1];
disp(T);