% Limpar
clc; clear;
close all
% -----------------------
% Matrizes de transformação
% -----------------------

% Translação no eixo y local: 6 unidades equivalente
% T1=[1,0,0,0;0,1,0,6;0,0,1,0;0,0,0,1]
% T1(linha,coluna)= localização dos valores
T1 = eye(4);
T1(2,4) = 6;

% Rotação de 60° em torno do eixo x local
theta1 = deg2rad(60);
R1 = eye(4);
R1(2:3, 2:3) = [cos(theta1), -sin(theta1); sin(theta1), cos(theta1)];

% Translação global no eixo z: 3 unidades
T2 = eye(4);
T2(3,4) = 3;

% Rotação global de 60° em torno do eixo z
theta2 = deg2rad(60);
R2 = eye(4);
R2(1:2, 1:2) = [cos(theta2), -sin(theta2); sin(theta2), cos(theta2)];

% Rotação global de 45° em torno do eixo x
theta3 = deg2rad(45);
R3 = eye(4);
R3(2:3, 2:3) = [cos(theta3), -sin(theta3); sin(theta3), cos(theta3)];

% -----------------------
% Multiplicação das transformações
% -----------------------
T_total = R3 * R2 * T2 * R1 * T1;

% Exibir transformação final
disp('Matriz de Transformação Total:');
disp(T_total);

% -----------------------
% Extração dos ângulos de Euler ZYX (Yaw, Pitch, Roll)
% -----------------------
R_total = T_total(1:3, 1:3);           % Matriz de rotação 3x3
eulZYX = rotm2eul(R_total, 'ZYX');     % Em radianos
eulZYX_deg = rad2deg(eulZYX);          % Em graus

% Exibir ângulos
disp('Ângulos de Euler (ZYX) [Yaw, Pitch, Roll] em graus:');
disp(eulZYX_deg);

R1 = eul2rotm(deg2rad([50.7685 -37.7612 86.5651]), 'ZYZ');
R2 = eul2rotm(deg2rad([40.8934 48.5904 85.8934]), 'ZYZ');
disp(norm(R1 - R2))  % → resultado próximo de zero (≈1e-15), ou seja, MESMA orientação

% Ângulos do MATLAB (os que você extraiu)
eul1 = [50.7685, -37.7612, 86.5651];  % [yaw pitch roll]

% Ângulos do Python (os que extraímos aqui)
eul2 = [40.8934, 48.5904, 85.8934];   % [yaw pitch roll]

% Gerar as matrizes
R1 = eul2rotm(deg2rad(eul1), 'ZYZ');
R2 = eul2rotm(deg2rad(eul2), 'ZYZ');

% Diferença entre matrizes
diff_norm = norm(R1 - R2);

disp('Norma da diferença:');
disp(diff_norm);
%214.20 589.62 1100-92
R = [0 -1 0; 0 0 1; -1 0 0];
% Extrair ângulos RAG (XYZ)
angles_RAG = rotm2eul(R, 'ZYX');
angles_deg = rad2deg(angles_RAG);
disp(angles_deg); % retorna [α γ β]
nx=0;
ny=0;
nz=-1;
ox=0;
oy=0;
oz=1;
ax=-1;
ay=0;
az=0;

%RPY=[cos(z1)*cos(y) -cos(z1)*sin(y)*sin(z2)-sin(z1)*cos(z2) cos(z1)*sin(y)*cos(z2)+sin(z1)*sin(z2); sin(z1)*cos(y) -sin(z1)*sin(y)*sin(z2)+cos(z1)*cos(z2) sin(z1)*sin(y)*cos(z2)-cos(z1)*sin(z2); -sin(y) cos(y)*sin(z2) cos(y)*cos(z2)]

ANGa=atan2d(ny,nx)
ANGo=atan2d(-nz,(nx*cos(ANGa)+ny*sin(ANGa)))
ANGn=atan2d(-ay*cos(ANGa)+ax*sin(ANGa),oy*cos(ANGa)-ox*sin(ANGa))



