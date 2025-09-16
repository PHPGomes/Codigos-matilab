%% Matriz Orientação Euler Angles
% Yaw rotação em torno do eixo Z
% Pitch rotação em torno do eixo Y
% Roll rotação em torno do eixo X

%% Clear
clear
clc

%% Matriz Matriz de rotação (ou extraída de matriz homogênea)

R = [0.527 -0.574 0.628 4; 0.369 0.819 0.439 6; -0.766 0 0.643 9; 0 0 0 1]

%% Parametros da Matriz


% Cálculo dos ângulos (convenção RPY) RAG
phiO  = atan2d(-R(3,1), sqrt(R(1,1)^2 + R(2,1)^2));  % pitch
phiN = atan2d(R(2,1), R(1,1));                     % roll
phiA = atan2d((-R(2,3)*cosd(phiN)+R(1,3)*sind(phiN)), (R(2,2)*cosd(phiN)-R(1,2)*sind(phiN)));     % yaw
px = R(1,4);
py = R(2,4);
pz = R(3,4);

fprintf('phiA = %.2f°\n', phiN);
fprintf('phiO = %.2f°\n', phiO);
fprintf('phiN = %.2f°\n', phiA);


fprintf('Px = %f\n', px);
fprintf('Py = %f\n', py);
fprintf('Pz = %f\n', pz);


%% Parametros da Matriz

% Extração da submatriz de rotação
Rrot = R(1:3,1:3);

% Cálculo dos ângulos de Euler (ZYZ)
theta = atan2d(sqrt(Rrot(1,3)^2 + Rrot(2,3)^2), Rrot(3,3));
phi   = atan2d(Rrot(2,3), Rrot(1,3));
psi   = atan2d(Rrot(3,2), -Rrot(3,1));

% Posição
px = R(1,4);
py = R(2,4);
pz = R(3,4);

% Exibição
fprintf('phi (Z1) = %.2f°\n', phi);
fprintf('alfa (Y) = %.2f°\n', theta);
fprintf('psi (Z2) = %.2f°\n', psi);
fprintf('Px = %.2f\n', px);
fprintf('Py = %.2f\n', py);
fprintf('Pz = %.2f\n', pz);
