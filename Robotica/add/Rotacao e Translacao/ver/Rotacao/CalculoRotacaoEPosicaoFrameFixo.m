%% Calculo Rotação e Posição Frame Fixo

%% CLEAR
clear
clc

%% Caso 1:
% Rotação em um eixo + posição dada em relação ao frame B (A rotacionado)
% e quero descobrir em relação a A (frame inicial)

% angulo de rotacao
teta = 30;

% CALCULO SIN E COS
sin = sind(teta);
cos = cosd(teta);

% CRIAÇÃO MATRIZ Rotação
Rx = [1 0 0 ; 0 cos -sin ; 0 sin cos];
Ry = [cos 0 sin ; 0 1 0 ; -sin 0 cos];
Rz = [cos -sin 0 ; sin cos 0 ; 0 0 1];

% Posição do ponto em relação ao frame B
pxb = 0;
pyb = 2;
pzb = 0;
posPB = [pxb;pyb;pzb];

%% Ponto em relação a A com rotação em X
Pa = Rx*posPB

%% Ponto em relação a A com rotação em Y
Pa = Ry*posPB

%% Ponto em relação a A com rotação em Z
Pa = Rz*posPB
