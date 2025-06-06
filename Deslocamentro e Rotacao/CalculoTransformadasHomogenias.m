%% Calculo Transformadas Homogenias 

%% CLEAR
clear
clc

%% Rotação ou translação de um frame + posição dada em relação ao frame B e quero descobrir em relação a A 

% angulo de rotacao
teta = 0;

% CALCULO SIN E COS
sin = sind(teta);
cos = cosd(teta);

% Criação Matriz Rotação
Rx = [1 0 0 0;0 cos -sin 0;0 sin cos 0;0 0 0 1];
Ry = [cos 0 sin 0;0 1 0 0;-sin 0 cos 0;0 0 0 1];
Rz = [cos -sin 0 0;sin cos 0 0; 0 0 1 0;0 0 0 1];

% Criação Vetor Posição (Em relação ao frame B)
x = 0;
y = 0;
z = 0; 
w = 1; %Fator de escalamento (normalmente usar 1)
vp = [x;y;z;w];

% Paramentro de deslocamento para Matriz Translação
qx = 0;
qy = 0;
qz = 0;

% Criação Matriz Translação
Trans = [1 0 0 qx;0 1 0 qy; 0 0 1 qz; 0 0 0 1];

%% Vetor rotação em X
Pa = Rx*vp

%% Vetor rotação em Y
Pa = Ry*vp

%% Vetor rotação em Z
Pa = Rz*vp

%% Ponto em relação a A apenas com Translação 
Pa = Trans*vp

%% Criação Matriz De Transformação Homogênea 3D (Rotação + Translação)
% angulo de rotacao
teta = 90;

% CALCULO SIN E COS
sin = sind(teta);
cos = cosd(teta);

% Dados de translação
x = 0;
y = 0;
z = 0;
w = 1; %Fator de escalamento (normalmente usar 1)

% Criação Matriz De Transformação Homogênea 3D
THx = [1 0 0 x;0 cos -sin y;0 sin cos z;0 0 0 w];
THy = [cos 0 sin x;0 1 0 y;-sin 0 cos z;0 0 0 w];
THz = [cos -sin 0 x;sin cos 0 y; 0 0 1 z;0 0 0 w];

% Vetor Posição do ponto em relação ao frame B
pxb = -1;
pyb = 2;
pzb = 6;
posPB = [pxb;pyb;pzb;1];

%% Vetor Resultante Rotação em x
Pa = THx*posPB

%% Vetor Resultante Rotação em y
Pa = THy*posPB

%% Vetor Resultante Rotação em z
Pa = THz*posPB
