%% Rotacao E Translacao Matriz Referencia Em Eixo Fixo E Corrente

%% Clear
clear
clc

%% Calculo

% angulo de rotacao
teta = 90;

% CALCULO SIN E COS
sin = sind(teta);
cos = cosd(teta);

% Criação Matriz Rotação
Rx = [1 0 0 0;0 cos -sin 0;0 sin cos 0;0 0 0 1];
Ry = [cos 0 sin 0;0 1 0 0;-sin 0 cos 0;0 0 0 1];
Rz = [cos -sin 0 0;sin cos 0 0; 0 0 1 0;0 0 0 1];

% Paramentro de deslocamento para Matriz Translação
qx = 3;
qy = 5;
qz = 0;

% Criação Matriz Translação
Trans = [1 0 0 qx;0 1 0 qy; 0 0 1 qz; 0 0 0 1];

% Matriz Referencia
B = [0 1 0 1; 1 0 0 1;0 0 -1 1; 0 0 0 1];

% ponto ref
p = [1;5;4;1];
T = [qx;qy;qz;1];

% Eq de movimento Matriz (Fixo antes e Corrente depois)
R = Ry*Rz*B*Trans*Rx;

% Eq de movimento Ponto (Fixo antes e Corrente depois)
P = ((Rz*Rx*p) + Rz*Rx*T)-[0;0;0;1]; % Para Pontos não se pode multiplicar a translação, com isso tem que rotacionar e somar

% Matriz Resultante
disp(R)
