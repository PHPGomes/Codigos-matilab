% Resolver equações espaço de estados
%% Clear
clear
clc

%% Equação espaço de estados
% A*X=B
A = [25 125;10 75];
B = [45;0];
C = inv(A)*B