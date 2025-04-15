%% Cinemática Inversa Manipulador Esférico

%% Clear
clear
clc

%% Matriz Esférica
T = [1 0 0 3.1375;0 1 0 2.195;0 0 1 3.214;0 0 0 1]; %Colocar a Matriz dada aqui

%% Parametros da Matriz
x = T(1,1)*T(3,4)/T(3,3);
y = T(3,4)*(-T(1,2));
z = T(1,4)/T(2,2);

d = sqrt(x^2+y^2+z^2);
teta = atan2d(y,x);
fi = atand((z)/(sqrt(x^2+y^2)));

disp('d:');
disp(d);
disp('teta:');
disp(teta);
disp('fi:');
disp(fi);