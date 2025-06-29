%% Clear
clear
clc

%% Calculo
syms a1 a2 a3 theta1 theta2 theta3 real

% Teta
teta1 = 0;
teta2 = 0;
teta3 = 0;

% Tamanho elo
a1 = 10;
a2 = 10;
a3 = 10;

% Posição da ponta (efetuador)
x = a1*cosd(teta1) + a2*cosd(teta1 + teta2) + a3*cosd(teta1 + teta2 + teta3);
y = a1*sind(teta1) + a2*sind(teta1 + teta2) + a3*sind(teta1 + teta2 + teta3);

% Jacobiano
J = jacobian([x; y], [teta1, teta2, teta3]);
disp('Jacobiano do manipulador 3R planar:');
pretty(J)