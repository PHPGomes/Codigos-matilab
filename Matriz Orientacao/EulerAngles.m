%% Matriz Orientação Euler Angles
% Yaw rotação em torno do eixo Z
% Pitch rotação em torno do eixo Y
% Roll rotação em torno do eixo X

%% Clear
clear
clc

%% Parametros (3x3)
ax = 0; % Ângulo de rotação em X
ay = 0; % Ângulo de rotação em Y
az = 0; % Ângulo de rotação em Z

cx = cosd(ax);
sx = sind(ax);

cy = cosd(ay);
sy = sind(ay);

cz = cosd(az);
sz = sind(az);

Rx = [1 0 0;0 cx -sx;0 sx cx];
Ry = [cy 0 sy;0 1 0;-sy 0 cy];
Rz = [cz -sz 0;sz cz 0;0 0 1];

%% Parametros (4x4) rot+pos
ax = 60; % Ângulo de rotação em X
ay = 0; % Ângulo de rotação em Y
az = 60; % Ângulo de rotação em Z

cx = cosd(ax);
sx = sind(ax);

cy = cosd(ay);
sy = sind(ay);

cz = cosd(az);
sz = sind(az);

qx = 0;
qy = 6;
qz = 3;
w = 1;

Rx = [1 0 0 qx;0 cx -sx qy;0 sx cx qz;0 0 0 w];
Ry = [cy 0 sy qx;0 1 0 qy;-sy 0 cy qz; 0 0 0 w];
Rz = [cz -sz 0 qx;sz cz 0 qy;0 0 1 qz; 0 0 0 w];

%% Equação da Orientação
% OBS: Exemplo comum: Ordem ZYX, Primeiro você rotaciona em torno de X (Roll, φ), Depois em torno de Y (Pitch, θ) 
% E por fim em torno de Z (Yaw, ψ) Mas a matriz resultante é multiplicada da esquerda pra direita, 
% então: 𝑅 = 𝑅𝑧(𝜓)⋅R𝑦(𝜃)⋅𝑅𝑥(𝜙) 
% Isso porque a matriz que fica mais à direita é aplicada primeiro no vetor de posição ou orientação.

R = Rz*Ry*Rx;
disp(R);