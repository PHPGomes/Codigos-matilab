%% Matriz Orientação Euler Angles
% Yaw rotação em torno do eixo Z
% Pitch rotação em torno do eixo Y
% Roll rotação em torno do eixo X

%% Clear
clear
clc

%% Matriz Matriz de rotação (ou extraída de matriz homogênea)

R = [0 0 1 573;0 -1 0 0;1 0 0 440;0 0 0 1];

%% Parametros da Matriz


% Cálculo dos ângulos de Euler (convenção ZYZ) 
phiO  = atan2d(-R(3,1), sqrt(R(1,1)^2 + R(2,1)^2));  % pitch
phiN = atan2d(R(2,1), R(1,1));                     % roll
phiA = atan2d((-R(2,3)*cosd(phiN)+R(1,3)*sind(phiN)), (R(2,2)*cosd(phiN)-R(1,2)*sind(phiN)));     % yaw


fprintf('phiA = %.2f°\n', phiA);
fprintf('phiN = %.2f°\n', phiN);
fprintf('phiO = %.2f°\n', phiO);
    



