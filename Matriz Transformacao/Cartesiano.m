%% Matriz Transformação Cartesiano

%% Clear
clear
clc

%% Paremetros
Px = 1; % Deslocamento em torno do eixo X
Py = 2; % Deslocamento em torno do eixo Y
Pz = 3; % Deslocamento em torno do eixo Z

%% Construção Matriz
T = [1 0 0 Px;0 1 0 Py;0 0 1 Pz;0 0 0 1];
disp(T);