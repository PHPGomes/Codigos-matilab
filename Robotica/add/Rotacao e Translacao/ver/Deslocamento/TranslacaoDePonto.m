%% Translação de Ponto

%% Clear
clear
clc

%% Resolução

% Matriz Ponto
x = 3;
y = 5;
z = 7;
p = [x;y;z];

% Matriz Deslocamento
xd = 2;
yd = 3;
zd = 4;
d = [xd;yd;zd];

% Matriz Resultante
r = p+d;
disp(r);