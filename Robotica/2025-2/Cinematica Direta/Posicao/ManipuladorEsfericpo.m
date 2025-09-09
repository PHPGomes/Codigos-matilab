%% Cinemática Inversa Manipulador Esférico (OLhar e refazer esse )

%% Clear
clear
clc

%% Matriz Esférica
T = [1 0 0 3.1375;0 1 0 2.195; 0 0 1 3.214; 0 0 0 1]; %Colocar a Matriz dada aqui

%% Parametros da Matriz
x = T(1,4);
y = T(2,4);
z = T(3,4);


r = sqrt(x^2 + y^2 + z^2); % distância radial
gamma = atan2d(y, x); % azimute (ângulo no plano xy)
beta = atan2d(sqrt(x^2 + y^2), z); % elevação (ângulo com z)


%%
disp('gamma:');
disp(gamma);

disp('beta:');
disp(beta);

disp('r:');
disp(r);
