%% Calculo Deslocamento + Rotação Frame 

%% CLEAR
clear
clc

%% Caso 3:
% Rotação e deslocamento de um frame + posição dada em relação ao frame B e quero descobrir em relação a A 

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

% Origem de B em relação a A
PxBA
PyBA
PzBA
PosBA = [PxBA;PyBA;PzBA]
%% Ponto em relação a A com rotação em X

Pa = Rx*posPB + PosBA
%% Ponto em relação a A com rotação em Y

Pa = Ry*posPB + PosBA
%% Ponto em relação a A com rotação em Z

Pa = Rz*posPB + PosBA
