%% Matriz homogênea de um RAG(a,d,theta)
clear; clc;

% Parâmetros do RAG
a = 10;
d = 20;
theta = deg2rad(50); % converte para radianos

% Matriz homogênea
T = [cos(theta) -sin(theta) 0 a*cos(theta);
     sin(theta)  cos(theta) 0 a*sin(theta);
     0           0          1 d;
     0           0          0 1];

disp('Matriz de Transformação Homogênea RAG(10,20,50):');
disp(T);

%%
a = [1 0 0 392.79;0 1 0 266.78; 0 0 1 878.55;0 0 0 1];

b = [0 0.5 sqrt(3)/2 392.79;0 -sqrt(3)/2 0.5 266.78;1 0 0 878.55;0 0 0 1];

T = inv(a)*b