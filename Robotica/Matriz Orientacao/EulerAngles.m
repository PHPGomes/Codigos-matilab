%% Matriz Orientação Euler Angles
% Yaw rotação em torno do eixo Z
% Pitch rotação em torno do eixo Y
% Roll rotação em torno do eixo X

%% Clear
clear
clc

%% Parametros (3x3)
ax = 30; % Ângulo de rotação em X
ay = 40; % Ângulo de rotação em Y
az = 50; % Ângulo de rotação em Z

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
ax = 0; % Ângulo de rotação em X
ay = 20; % Ângulo de rotação em Y
az1 = 10; % Ângulo de rotação em Z
az2 = 30; % Ângulo de rotação em Z

cx = cosd(ax);
sx = sind(ax);

cy = cosd(ay);
sy = sind(ay);

cz1 = cosd(az1);
sz1 = sind(az1);

cz2 = cosd(az2);
sz2 = sind(az2);


qx = 1;
qy = 2;
qz = 3;
w = 1;

Rx = [1 0 0 qx;0 cx -sx qy;0 sx cx qz;0 0 0 w];
Ry1 = [cy 0 sy qx;0 1 0 qy;-sy 0 cy qz; 0 0 0 w];
Rz1 = [cz1 -sz1 0 qx;sz1 cz1 0 qy;0 0 1 qz; 0 0 0 w];
Rz2 = [cz2 -sz2 0 qx;sz2 cz2 0 qy;0 0 1 qz; 0 0 0 w];

%% Equação da Orientação
% OBS: Exemplo comum: Ordem ZYZ, Primeiro você rotaciona em torno de X (Roll, φ), Depois em torno de Y (Pitch, θ) 
% E por fim em torno de Z (Yaw, ψ) Mas a matriz resultante é multiplicada da esquerda pra direita, 
% então: 𝑅 = 𝑅𝑧(𝜓)⋅R𝑦(𝜃)⋅𝑅𝑥(𝜙) 
% Isso porque a matriz que fica mais à direita é aplicada primeiro no vetor de posição ou orientação.

R = Rz1*Ry1*Rz2;
disp(R);
r = Rz(10,1,2,3,1)* Ry(20,1,2,3,1)*Rz(30,1,2,3,1)