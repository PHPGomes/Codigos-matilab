%% Matriz Orientação Euler Angles
% Yaw rotação em torno do eixo Z
% Pitch rotação em torno do eixo Y
% Roll rotação em torno do eixo Z

%% Clear
clear
clc

%% Matriz Matriz de rotação (ou extraída de matriz homogênea)

R = [0.527 -0.574 0.628 4; 0.369 0.819 0.439 6; -0.766 0 0.643 9; 0 0 0 1];

%% Cálculo dos ângulos de Euler (convenção ZYZ) 

phiA = atan2d(R(2,1),R(1,1));
phiO = atan2d(-R(3,1),R(1,1)*cosd(phiA)+R(2,1)*sind(phiA));
phiN = atan2d(-R(2,3)*cosd(phiA)+R(1,3)*sind(phiA),R(2,2)*cosd(phiA)-R(1,2)*sind(phiA));

fprintf('phiN = %.2f°\n', phiN);
fprintf('phiO = %.2f°\n', phiO);
fprintf('phiA = %.2f°\n', phiA); 