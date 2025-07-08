% Resolver equações espaço de estados
%% Clear
clear
clc

%% Equação espaço de estados
% A*X=B
A = [512 4096 32768;192 2048 20480;48 768 10240];
B = [-356.87;-80;0];
C = inv(A)*B