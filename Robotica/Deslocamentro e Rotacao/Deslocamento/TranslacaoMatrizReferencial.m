%% Translacao Matriz Referencia

%% Clear
clear
clc

%% Resolvendo

% Matriz Referencia (4x4)
b = [0 1 0 2;1 0 0 4;0 0 -1 6; 0 0 0 1];
xb = b(1,4);
yb = b(2,4);
zb = b(3,4);

% Matriz Deslocamento (3x1)
d = [5;2;6];
xd = d(1,1);
yd = d(2,1);
zd = d(3,1);

% Matriz Resultante (4x4)
x = xb + xd;
y = yb + yd;
z = zb + zd;
r =[b(1,1) b(1,2) b(1,3) x; b(2,1) b(2,2) b(2,3) y;b(3,1) b(3,2) b(3,3) z;b(4,1) b(4,2) b(4,3) b(4,4)];
disp(r);