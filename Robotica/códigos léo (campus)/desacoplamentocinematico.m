%%pc:vetor de posição do ponto de controle (centro de pulso — geralmente onde começa o efetuador final).
%%d06:vetor de posição da extremidade do efetuador (posição final da ferramenta, na base do robô).
%%d6:distância entre o centro do pulso e a ponta do efetuador (geralmente o comprimento do último elo).
%%R06:matriz de rotação do efetuador em relação à base (orientação do efetuador).
%%k:vetor unitário na direção do eixo z (tipicamente [0;0;1]).

%%Exemplo H06=[0 -0.7 -0.7 0; 0 0.7 -0.7 48; 1 0 0 1025; 0 0 0 1]
%%Pc=d06-d6*R06*k
%%d06=[0;48;1025] ultima coluna e 3 primeiras linhas 
%%d6=86.5
%%R06=[0 -0.7 -0.7; 0 0.7 -0.7; 1 0 0 ] primeiras 3 linhas e colunas 3x3
%%k=[0; 0; 1]

%%A simplificação do modelo de DH será baseada em 4 regras
%%1º) Para juntas rotacionais, o eixo Z deve estar sempre em direção ao eixo das
%%juntas ( Para juntas prismáticas, o eixo Z deve estar na direção do movimento da
%%junta)
%%2º) O eixo X deve ser perpendicular aos eixos Zn e Zn-1 (Se houver mais de uma
%%opção, colocar o eixo X na direção do próximo eixo)
%%3º) O eixo Y deve seguir a regra da mão direita
%%4º) O eixo Xn deve interceptar o eixo Zn-1
%%Obs: O end-effector segue a mesma notação do eixo anterior a ele (caso seja
%%verificado as 4 regras acima)

Pc=(d06-(d6*R06*k))

