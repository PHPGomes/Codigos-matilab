%% Matriz Transformação Esferico

%% Clear
clear
clc

%% Paremetros
r = 0; % Distância radial (do centro ao ponto)
beta = 0; % Ângulo de inclinação (tipo latitude, ângulo com o eixo Z)
y = 0; % Ângulo de rotação em torno do eixo Z (tipo longitude).

cb = cosd(beta);
sb = sind(beta);

cy = cosd(y);
sy = sind(y);

%% Construção Matriz
T = [cb*cy -sy sb*cy r*sb*cy;cb*sy cy sb*sy r*sb*sy;-sb 0 cb r*cb;0 0 0 1];
disp(T);