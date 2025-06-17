%% Ponto Cordenada Rotacionada

%% Clear
clear
clc

%% Matriz Rotação

% Localização Ponto antes da Rotação
x = 1;
y = 2;
z = 3;
p = [x;y;z];

% angulo de rotacao 1
teta1 = 30;

% CALCULO SIN E COS
sin1 = sind(teta1);
cos1 = cosd(teta1);

% Criação Matriz Rotação
Rx1 = [1 0 0;0 cos1 -sin1;0 sin1 cos1];
Ry1 = [cos1 0 sin1;0 1 0;-sin1 0 cos1];
Rz1 = [cos1 -sin1 0;sin1 cos1 0; 0 0 1];

% angulo de rotacao 2
teta2 = 60;

% CALCULO SIN E COS
sin2 = sind(teta2);
cos2 = cosd(teta2);

% Criação Matriz Rotação
Rx2 = [1 0 0;0 cos2 -sin2;0 sin2 cos2];
Ry2 = [cos2 0 sin2;0 1 0;-sin2 0 cos2];
Rz2 = [cos2 -sin2 0;sin2 cos2 0; 0 0 1];

% Matriz Resultante (obs: cuidado com a ordem dos fatores, Colocar o ponto e adicinar as rotações nas extremidades
% tomando cuidado com a referencia dos eixos, Fixo antes e Corrente depois e SEMPRE colocar na ponta. "Último mais para
% fora e primeiro mais para dentro")
r = Ry2*Rz1*p;
disp(r);
r2 = Ry(teta2)*Rz(teta1)*p

