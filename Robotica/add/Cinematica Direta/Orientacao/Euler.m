%% Clear
clear
clc

%% ZYZ
% Equação da Orientação
% OBS: Exemplo comum: Ordem ZYZ, Primeiro você rotaciona em torno de z (Roll, φ), Depois em torno de Y (Pitch, θ) 
% E por fim em torno de Z (Yaw, ψ) Mas a matriz resultante é multiplicada da esquerda pra direita, 
% então: 𝑅 = 𝑅𝑧(𝜙)⋅R𝑦(𝜃)⋅𝑅𝑧(𝜓)
% Isso porque a matriz que fica mais à direita é aplicada primeiro no vetor de posição ou orientação.

% Parametros

% 𝜙
phi = 10;

% 𝜃
theta = 20;

% 𝜓
psi = 30;

r = Rz(phi)*Ry(theta)*Rz(psi)

