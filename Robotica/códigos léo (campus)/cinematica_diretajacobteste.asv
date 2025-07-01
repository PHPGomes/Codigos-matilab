function [T_final, pos] = cinematica_direta(DH, variaveis, usarGraus)
% CINEMATICA_DIRETA - Calcula a cinemática direta de um manipulador
% usando os parâmetros DH padrão.
%
% Entrada:
%   DH        - Matriz Nx4 com os parâmetros DH: [theta, d, a, alpha]
%               Use 0 para indicar variável (a ser substituída)
%   variaveis - Vetor com os valores das juntas (graus ou metros)
%   usarGraus - (Opcional) true para entrada em graus (padrão: false)
%
% Saída:
%   T_final   - Matriz de transformação homogênea do sistema base ao efetuador
%   pos       - Vetor posição [x; y; z] do efetuador final

    if nargin < 3
        usarGraus = false;  % padrão é radiano
    end

    n = size(DH, 1); % número de elos
    T_final = eye(4); % transformação inicial

    for i = 1:n
        % Parâmetros DH
        theta = DH(i, 1);
        d     = DH(i, 2);
        a     = DH(i, 3);
        alpha = DH(i, 4);

        % Substituição de variáveis
        if theta == 0
            theta = variaveis(i);
            if usarGraus
                theta = deg2rad(theta);  % converte para rad
            end
        end

        if d == 0 && isnan(theta)  % para juntas prismáticas
            d = variaveis(i);
        end

        % Transformação homogênea A_i
        A_i = [
            cos(theta), -sin(theta)*cos(alpha),  sin(theta)*sin(alpha), a*cos(theta);
            sin(theta),  cos(theta)*cos(alpha), -cos(theta)*sin(alpha), a*sin(theta);
            0,           sin(alpha),             cos(alpha),            d;
            0,           0,                      0,                     1];

        % Acumular transformação
        T_final = T_final * A_i;
    end

    % Posição final do efetuador
    pos = T_final(1:3, 4);
end
