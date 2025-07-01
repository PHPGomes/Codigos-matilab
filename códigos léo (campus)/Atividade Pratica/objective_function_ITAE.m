% Integral do Erro Absoluto Ponderado pelo Tempo (ITAE)

function ITAE = objective_function_ITAE(x)

global kp ki kd

kp = x(1);
ki = x(2);
kd = x(3);

time=0:0.1:200;

[T] = sim('AtividadeAvaliativaQ2MotorB', time);

ITAE = (sum(abs(erro).*T));