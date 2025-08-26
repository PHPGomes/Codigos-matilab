%% Rotacao E Translacao Matriz Referencia Em Eixo Fixo E Corrente

%% Clear
clear
clc

%% Calculo

% angulo de rotacao 1
teta = 45;

% CALCULO SIN E COS
sin = sind(teta);
cos = cosd(teta);

% Criação Matriz Rotação 1
Rx1 = [1 0 0 0;0 cos -sin 0;0 sin cos 0;0 0 0 1];
Ry1 = [cos 0 sin 0;0 1 0 0;-sin 0 cos 0;0 0 0 1];
Rz1 = [cos -sin 0 0;sin cos 0 0; 0 0 1 0;0 0 0 1];

% angulo de rotacao 2
teta2 = 30;

% CALCULO SIN E COS
sin2 = sind(teta2);
cos2 = cosd(teta2);

% Criação Matriz Rotação 2
Rx2 = [1 0 0 0;0 cos2 -sin2 0;0 sin2 cos2 0;0 0 0 1];
Ry2 = [cos2 0 sin2 0;0 1 0 0;-sin2 0 cos2 0;0 0 0 1];
Rz2 = [cos2 -sin2 0 0;sin2 cos2 0 0; 0 0 1 0;0 0 0 1];

% angulo de rotacao 3
teta3 = 90;

% CALCULO SIN E COS
sin3 = sind(teta3);
cos3 = cosd(teta3);


% Criação Matriz Rotação 3
Rx3 = [1 0 0 0;0 cos3 -sin3 0;0 sin3 cos3 0;0 0 0 1];
Ry3 = [cos3 0 sin3 0;0 1 0 0;-sin3 0 cos3 0;0 0 0 1];
Rz3 = [cos3 -sin3 0 0;sin3 cos3 0 0; 0 0 1 0;0 0 0 1];

% Paramentro de deslocamento para Matriz Translação
qx = 0;
qy = 4;
qz = 2;

% Criação Matriz Translação
Trans = [1 0 0 qx;0 1 0 qy; 0 0 1 qz; 0 0 0 1];

% Matriz Referencia
B = [1 0 0 0;0 1 0 0;0 0 1 0;0 0 0 1];

% ponto ref
%p = [1;5;4;1];
%T = [qx;qy;qz;1];

%%
% Eq de movimento Matriz (Fixo antes e Corrente depois)
R = Rz1*Ry2*B*Trans*Rz3;

% Eq de movimento Ponto (Fixo antes e Corrente depois)
%P = ((Rz*Rx*p) + Rz*Rx*T)-[0;0;0;1]; % Para Pontos não se pode multiplicar a translação, com isso tem que rotacionar e somar

% Matriz Resultante
disp(R)


%% Q3 Rascunho
ru = [2;-1;0];
up = [1;4;0];
rp = up-ru 