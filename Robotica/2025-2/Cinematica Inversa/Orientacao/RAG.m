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
