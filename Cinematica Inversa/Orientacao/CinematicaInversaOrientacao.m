%% Matriz Orientação Euler Angles
% Yaw rotação em torno do eixo Z
% Pitch rotação em torno do eixo Y
% Roll rotação em torno do eixo X

%% Clear
clear
clc

%% Matriz Matriz de rotação (ou extraída de matriz homogênea)

R = [0.527 -0.574 0.628 4;0.369 0.819 0.439 6;-0.766 0 0.643 9; 0 0 0 1];

%% Parametros da Matriz


% Cálculo dos ângulos de Euler (convenção ZYX) 
beta  = atan2d(-R(3,1), sqrt(R(1,1)^2 + R(2,1)^2));  % pitch
alpha = atan2d(R(3,2), R(3,3));                     % roll
gamma = atan2d(R(2,1), R(1,1));                     % yaw


fprintf('Roll (α)  = %.2f°\n', alpha);
fprintf('Pitch (β) = %.2f°\n', beta);
fprintf('Yaw (γ)   = %.2f°\n', gamma);
