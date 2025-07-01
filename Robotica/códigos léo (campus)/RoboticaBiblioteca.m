%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%> @file RoboticaBiblioteca.m                                                      %
%> @brief Funcoes de Robotica para calculo de angulos das juntas de um manipulador %
%> @author Marcos Carvalho Ferreira                                                %
%> @date 2023-09-05                                                                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

classdef RoboticaBiblioteca
    
    methods (Static)
        function printListaManipuladores()
            disp('--------------------> Lista de Manipuladores <-----------------------')
            disp('1 - Manipulador Cartesiano: PPP')
            disp('   1.1 - Manipulador Pórtico: cartesianos, mas com base em suportes')
            disp('2 - Manipulador Cilíndrico: RPP')
            disp('3 - Manipulador Articulados/Antropomórficos: RRR')
            disp('4 - Manipulador Esféricos/Polares: RRP')
            disp('5 - Manipulador SCARA: RRP, diferente do esférico, tem três eixos z0,')
            disp('                       z1 e z2 todos verticais e paralelos')
        end
        
        function maoDireita()
            disp('--- Regra da mão Direita ---');
            disp('     eixo x --- indicador');
            disp('     eixo y --- meio');
            disp('     eixo z --- dedão');
            disp('----------------------------');
            disp('ver palma da mão -> positivo');
            disp('para z: < positivo | > negativo');
            disp('para x: palma da mão pra cima - positivo | palma da mão pra baixo - negativo');
            disp('para y: pistola pra baixo - positivo | pistola pra cima - negativo')
        end

        function confusao()
            disp('phi = thetaA');
            disp('theta = thetaO');
            disp('psi = thetaN');
        end
        
        function[R] = matrizRot(eixo, angulo)
            if eixo == 'x' || eixo == 'n'
                R = [1, 0, 0;
                     0, cosd(angulo), -sind(angulo);
                     0, sind(angulo), cosd(angulo)];
            elseif eixo == 'y' || eixo == 'o'
                R = [cosd(angulo), 0, sind(angulo);
                     0, 1, 0;
                     -sind(angulo), 0, cosd(angulo)];
            elseif eixo == 'z' || eixo == 'a'
                R = [cosd(angulo), -sind(angulo), 0;
                     sind(angulo), cosd(angulo), 0;
                     0, 0, 1];
            else
                disp('matrizRot: Eixo inválido');
                R = eye(3);
            end
        end
        
        function[R] = matrizRotSyms(eixo, angulo)
            if eixo == 'x' || eixo == 'n'
                R = [1, 0, 0;
                     0, cos(angulo), -sin(angulo);
                     0, sin(angulo), cos(angulo)];
            elseif eixo == 'y' || eixo == 'o'
                R = [cos(angulo), 0, sin(angulo);
                     0, 1, 0;
                     -sin(angulo), 0, cos(angulo)];
            elseif eixo == 'z' || eixo == 'a'
                R = [cos(angulo), -sin(angulo), 0;
                     sin(angulo), cos(angulo), 0;
                     0, 0, 1];
            else
                disp('matrizRotSyms: Eixo inválido');
                R = eye(3);
            end
        end
        
        function[T] = rot(eixo, ang)
            if isnumeric(ang)
                R = RoboticaBiblioteca.matrizRot(eixo, ang);
            else
                R = RoboticaBiblioteca.matrizRotSyms(eixo, ang);
            end
            T = [R, zeros(3,1);
                 zeros(1,3), 1];
        end
        
        function[R] = trans(eixo_x, eixo_y, eixo_z)
            R = [1, 0, 0, eixo_x;
                 0, 1, 0, eixo_y;
                 0, 0, 1, eixo_z;
                 0, 0, 0, 1];
        end
        
        function[R] = Tcart(Px, Py, Pz)
            %     Neste caso haverá três movimentos lineares ao longo dos eixos
            % x, y, e z. Neste tipo de robô todos os atuadores são lineares e o 
            % posicionamento da mão do robô é realizado movendo as três articulações 
            % lineares ao longo dos três eixos.
            R = RoboticaBiblioteca.trans(Px, Py, Pz);
        end
        
        function[R] = Tcil(r, alpha, L)
            %     Neste caso haverá duas translações lineares e uma rotação. A 
            % sequência é uma translação r ao longo do eixo x, a rotação α sobre 
            % o eixo z, e uma translação de l ao longo do eixo z.
            R = RoboticaBiblioteca.trans(0,0,L)*RoboticaBiblioteca.rot('z',alpha)*RoboticaBiblioteca.trans(r,0,0);
        end
        
        function[R] = Tesf(r, beta, gamma)
            %     Um sistema em coordenadas esféricas consiste em um movimento 
            % linear e duas rotações. A seqüência é uma translação de r ao longo 
            % do eixo z, uma rotação de β em torno do eixo y, e uma rotação de γ 
            % em torno de z.
            R = RoboticaBiblioteca.rot('z',gamma)*RoboticaBiblioteca.rot('y',beta)*RoboticaBiblioteca.trans(0,0,r);
        end
        
        function [Px, Py, Pz] = movimentosTcart(x, y, z)
            Px = x;
            Py = y;
            Pz = z;
            str = sprintf("Px = %f | Py = %f | Pz = %f",Px,Py,Pz);
            disp(str);
        end
        
        function [r, alpha, l] = movimentosTcil(x, y, z)
            alpha = atan2d(y,x);
            r = y/sind(alpha);
            l = z;
            str = sprintf("r = %f | alpha = %f | L = %f",r,alpha,l);
            disp(str);
        end
        
        function [r, beta, gamma] = movimentosTesf(x, y, z)
            gamma = atan2d(y,x);
            rsB = x/cosd(gamma);
            beta = atan2d(rsB,z);
            r = z/cosd(beta);
            str = sprintf("r = %f | beta = %f | gamma = %f",r,beta,gamma);
            disp(str);
        end
        
        function [R] = rotZYZ(phi,theta,psi)
            % Movimentações correntes
            R = RoboticaBiblioteca.rot('z', phi)*RoboticaBiblioteca.rot('y', theta)*RoboticaBiblioteca.rot('z', psi);
        end
        
        function [varargout] = angsEuler(matriz4x4)
            if matriz4x4(3,3) == 1 || matriz4x4(3,3) == -1
                theta = 0;
                phi_plus_psi = atan2d(matriz4x4(2,1), matriz4x4(1,1));
                varargout{1} = theta;
                varargout{2} = phi_plus_psi;
                str = sprintf("theta = %f | phi + psi = %f",theta,phi_plus_psi);
                disp(str);
            elseif (matriz4x4(3,3))^2 < 1
                theta = atan2d(sqrt(1 - (matriz4x4(3,3)^2)), matriz4x4(3,3));
                phi = atan2d(matriz4x4(2,3), matriz4x4(1,3));
                psi = atan2d(matriz4x4(3,2), -matriz4x4(3,1));
                varargout{1} = phi;
                varargout{2} = theta;
                varargout{3} = psi;
                str = sprintf("phi = %f | theta = %f | psi = %f",phi,theta,psi);
                disp(str);
            else
                disp('Algo deu errado! Reveja!')
            end
        end
        
        function [R] = rotRAG(phi,theta,psi)
            R = RoboticaBiblioteca.rot('z', phi)*RoboticaBiblioteca.rot('y', theta)*RoboticaBiblioteca.rot('x', psi);
        end
        
        function [thetaN, thetaO, thetaA] = angsRAG(matriz4x4)
            thetaA = atan2d(matriz4x4(2,1), matriz4x4(1,1));
            thetaO = atan2d(-matriz4x4(3,1), (matriz4x4(1,1)*cosd(thetaA) + matriz4x4(2,1)*sind(thetaA)));
            thetaN = atan2d(-matriz4x4(2,3)*cosd(thetaA) + matriz4x4(1,3)*sind(thetaA), matriz4x4(2,2)*cosd(thetaA) - (matriz4x4(1,2)*sind(thetaA)));
            str = sprintf("ThetaN = %f | ThetaO = %f | ThetaA = %f",thetaN,thetaO,thetaA);
            disp(str);
        end

        function [pc] = PC(d06, d6, R06)
            pc = d06 - d6*R06*[0; 0; 1];
        end

        function Pc = pcAUT(H, d6)
            d06 = H(1:3,4);
            R06 = H(1:3,1:3);
            Pc = RoboticaBiblioteca.PC(d06, d6, R06);
        end
        
        function usarDenavit()
            disp('denavit(theta, d, a, alpha)')
        end

        function [dh] = denavit(theta, d, a, alpha)
            dh = RoboticaBiblioteca.rot('z',theta)*RoboticaBiblioteca.trans(0,0,d)*RoboticaBiblioteca.trans(a,0,0)*RoboticaBiblioteca.rot('x',alpha);
        end
        
        function [T, listaT] = MatProgDenavit(M)
            tam = size(M);
            T = eye(4);
            listaT = cell(0,0);
            for nL = 1:tam(1)
                A = RoboticaBiblioteca.denavit(M(nL,4),M(nL,3),M(nL,1),M(nL,2));
                fprintf("A%i%i = \n",nL-1,nL);
                disp(A);
                listaT{nL} = A;
                T = T*A;
            end
        end

        function [J] = jacobiano(Alc, anatom, printParciais)
            Zs = cell(0,0);
            os = cell(0,0);
            tam = size(Alc);

            AFinal = eye(4);
            for i = 1:tam(2)
                AFinal = AFinal*Alc{i};
            end
            
            k = [0; 0; 1];
            Z0 = k;
            Zs{1} = Z0;
            oFinal = AFinal(1:3,4);
            os{tam(2)+1} = oFinal;
            switch anatom(1)
                case 'P'
                    J = [Z0; zeros(3,1)];
                case 'R'
                    o0 = zeros(3,1);
                    os{1} = o0;
                    J = [cross(Z0,(oFinal-o0)); Z0];
                otherwise
                    error('Tipo de junta %c inválido!\nO argumeto deve ser um dos caracteres abaixo:\nP ou R.', anatom(1));
            end
            
            A0N = eye(4);
            for nC = 1:(tam(2) - 1)
                A0N = A0N*Alc{nC};
                ZN = A0N(1:3,1:3)*k;
                Zs{nC+1} = ZN;

                switch anatom(nC + 1)
                    case 'P'
                        J = [J, [ZN; zeros(3,1)]];
                    case 'R'
                        oN = A0N(1:3,4);
                        os{nC+1} = oN;
                        J = [J,[cross(ZN,(oFinal-oN));ZN]];
                    otherwise
                        error('Tipo de junta %c inválido!\nO argumeto deve ser um dos caracteres abaixo:\nP ou R.', anatom(nC + 1));
                end
            end

            if(printParciais)
                temO = false;
                for i = 1:tam(2)
                    switch anatom(i)
                        case 'P'
                            fprintf("Z%i = \n",i-1);
                            disp(Zs{i});
                        case 'R'
                            temO = true;
                            fprintf("Z%i = \n",i-1);
                            disp(Zs{i});
                            fprintf("O%i = \n",i-1);
                            disp(os{i});
                        otherwise
                            error('Tipo de junta %c inválido!\nO argumeto deve ser um dos caracteres abaixo:\nP ou R.', anatom(1));
                    end
                end

                if(temO)
                    fprintf("O%i = \n",tam(2));
                    disp(os{tam(2)+1});
                end
            end

        end

        function [Velocidade, J] = velJacob(Alc, q, anatom, printParciais)
            J = RoboticaBiblioteca.jacobiano(Alc, anatom, printParciais);
            Velocidade = J*q;
        end
        
        function [Coef, M, Theta] = CoefHighOrderPol434(valTheta, valT)
            theta1 = valTheta(1);
            theta1_ponto = 0;
            theta1_2pontos = 0;
            theta2 = valTheta(2);
            theta3 = valTheta(3);
            theta4 = valTheta(4);
            theta4_ponto = 0;
            theta4_2pontos = 0;

            t1f = valT(1);
            t2f = valT(2);
            t3f = valT(3);

            L1 = [1 zeros(1,13)];
            L2 = [0 1 zeros(1,12)];
            L3 = [0 0 2 zeros(1,11)];
            L4 = [1 t1f t1f^2 t1f^3 t1f^4 zeros(1,9)];
            L5 = [zeros(1,5) 1 zeros(1,8)];
            L6 = [0 1 2*t1f 3*t1f^2 4*t1f^3 0 -1 zeros(1,7)];
            L7 = [0 0 2 6*t1f 12*t1f^2 0 0 -2 zeros(1,6)];
            L8 = [zeros(1,5) 1 t2f t2f^2 t2f^3 zeros(1,5)];
            L9 = [zeros(1,9) 1 zeros(1,4)];
            L10 = [zeros(1,6) 1 2*t2f 3*t2f^2 0 -1 0 0 0];
            L11 = [zeros(1,7) 2 6*t2f 0 0 -2 0 0];
            L12 = [zeros(1,9) 1 t3f t3f^2 t3f^3 t3f^4];
            L13 = [zeros(1,10) 1 2*t3f 3*t3f^2 4*t3f^3];
            L14 = [zeros(1,11) 2 6*t3f 12*t3f^2];
            
            M = [L1; L2; L3; L4; L5; L6; L7; L8; L9; L10; L11; L12; L13; L14];
            Theta = [theta1; theta1_ponto; theta1_2pontos; theta2; theta2; 0; 0; theta3; theta3; 0; 0; theta4; theta4_ponto; theta4_2pontos];

            Coef = inv(M)*Theta;
        end

        function X = coef3(theta1, theta2, tf)
           B = [theta1, 0, theta2, 0]';
           A = [1 0 0 0; 0 1 0 0; 1 tf tf^2 tf^3; 0 1 2*tf 3*tf^2];
           X = A\B;
        end

        function [M] = matriz3ord(X, t)
            M = [1, zeros(1,3); 0 , 1, zeros(1,2); 1 t t^2 t^3; 0 1 2*t 3*t^2]*X;
        end

        function graf3ordPosVelAcel(X, tf)
            Ts = cell(1, (tf/0.1)+1);
            Ps = cell(1, (tf/0.1)+1);
            Vs = cell(1, (tf/0.1)+1);
            As = cell(1, (tf/0.1)+1);
            
            for i = 0:0.1:tf
                Ts{round((i/0.1)+1)} = i;
                Ps{round((i/0.1)+1)} = [1 i i^2 i^3] * X;
                Vs{round((i/0.1)+1)} = [0 1 2*i 3*i^2] * X;
                As{round((i/0.1)+1)} = [0 0 2 6*i] * X;
            end
            
            % Gráfico de Posição
            figure;
            subplot(3, 1, 1);
            plot(cell2mat(Ts), cell2mat(Ps));
            title('Gráfico dos Ângulos');
            xlabel('Tempo');
            ylabel('Ângulo');
            
            % Gráfico de Velocidade
            subplot(3, 1, 2);
            plot(cell2mat(Ts), cell2mat(Vs));
            title('Gráfico de Velocidade');
            xlabel('Tempo');
            ylabel('Velocidade');

            % Gráfico de Aceleração
            subplot(3, 1, 3);
            plot(cell2mat(Ts), cell2mat(As));
            title('Gráfico de Aceleração');
            xlabel('Tempo');
            ylabel('Aceleração');
        end


        function X = coef5(theta1, theta2, tf, acel)
           c0 = theta1;
           c1 = 0;
           c2 = acel/2;
           B = [theta2-c0-c1*tf-c2*tf^2,-c1-2*c2*tf, -acel-2*c2]';
           A = [tf^3 tf^4 tf^5; 3*tf^2 4*tf^3 5*tf^4; 6*tf 12*tf^2 20*tf^3];
           X = [c0;c1;c2;A\B];
        end

        function [M] = graf5ordPosVelAcel(X, tf)
            Ts = cell(1, (tf/0.1)+1);
            Ps = cell(1, (tf/0.1)+1);
            Vs = cell(1, (tf/0.1)+1);
            As = cell(1, (tf/0.1)+1);
            
            for i = 0:0.1:tf
                Ts{round((i/0.1)+1)} = i;
                Ps{round((i/0.1)+1)} = [1 i i^2 i^3 i^4 i^5] * X;
                Vs{round((i/0.1)+1)} = [0 1 2*i 3*i^2 4*i^3 5*i^4] * X;
                As{round((i/0.1)+1)} = [0 0 2 6*i 12*i^2 20*i^3] * X;
            end
            
            % Gráfico de Posição
            figure;
            subplot(3, 1, 1);
            plot(cell2mat(Ts), cell2mat(Ps));
            title('Gráfico dos Ângulos');
            xlabel('Tempo');
            ylabel('Ângulo');
            
            % Gráfico de Velocidade
            subplot(3, 1, 2);
            plot(cell2mat(Ts), cell2mat(Vs));
            title('Gráfico de Velocidade');
            xlabel('Tempo');
            ylabel('Velocidade');

            % Gráfico de Aceleração
            subplot(3, 1, 3);
            plot(cell2mat(Ts), cell2mat(As));
            title('Gráfico de Aceleração');
            xlabel('Tempo');
            ylabel('Aceleração');
        end

        % Funções para os calculos e otimização dos ganhos dos controladores PID
        
        function symFT = tf2sym(FT)
            % Converte uma FT em sym
            % FT => funcao de transferencia
            arguments
                FT tf
            end
            syms s;
            Num = poly2sym(FT.Numerator{1,1},s);
            Den = poly2sym(FT.Denominator{1,1},s);
            atraso = FT.OutputDelay;
            if(atraso ~= 0 )
                symFT = simplify(Num*exp(-atraso*s)/Den);
            else
                symFT = simplify(Num/Den);
            end
        end
        
        function L = lineTanInflex(Gsym,indexInflex,dispPI) % ANALISAR indexInflex automaticamente
            % Retorna a expressao simbolica da reta tangente ao ponto de inflexao
            % Gsym => FT simbolica
                % Gsym = PersonalRobotic.tf2sym(G); opcao para entrar com TF
            % dispPI => booleano para printar pontos de inflexao
                % serve para analisar alguns erros
            syms t;
            Gt = ilaplace(Gsym);
            d2Gt = simplify(diff(Gt,t,2));
            pontos_de_inflexao = double(solve(d2Gt == 0,t));
            if(dispPI)
                pontos_de_inflexao
            end
            if(length(pontos_de_inflexao) > 1)
                if(~isreal(pontos_de_inflexao))
                    t_inflex = real(pontos_de_inflexao(indexInflex)); % considera o 2° ponto
                else
                    t_inflex = pontos_de_inflexao(indexInflex);
                end
            else
                if(~isreal(pontos_de_inflexao))
                    t_inflex = real(pontos_de_inflexao(1));
                else
                    t_inflex = pontos_de_inflexao(1);
                end
            end
            y_inflex = double(subs(Gt, t, t_inflex));
            dGt = simplify(diff(Gt,t));
            m = double(subs(dGt,t,t_inflex));
            L = simplify(m*t - m*t_inflex + y_inflex);
        end
        
        function [Gapx, Kp, Ki, Kd] = ZNajustavel(G, M, znPlots)
            % considera entrada a degrau
            % G => FT
            % M => amplitude do degrau
            % znPlots => boolean para plotar graficos ou nao
            syms t;
            s = tf('s');
            Mlinha = dcgain(G)
            Gsym = PersonalRobotic.tf2sym(G*M/s);
            tanInfSym = lineTanInflex(Gsym,3,false); % CONSERTAR esse 3
            T = double(solve(tanInfSym==0,t))
            Gt = ilaplace(Gsym);
            T1 = double(solve(Gt==(dcgain(G)*0.632),t))
            tau = T1 - T
            k = Mlinha/M
            Gapx = (k*exp(-T*s))/(tau*s + 1);
            Kp = 1.2*tau/T;
            Ti = 2*T
            Td = 0.5*T
            Ki = Kp/Ti;
            Kd = Kp*Td;
            
            if(znPlots)
                figure(1);
                step(G*M)
                limitStep = axis;
                temp = (0:0.1:limitStep(2)); % limitStep(2) = xMax no grafico
                tanInflex = subs(tanInfSym,t,temp);
                y = [dcgain(G)*0.632, dcgain(G)*0.632];
                x = [0,T1*1.1]; % limitStep(2) = xMax no grafico
                hold on
                plot(x,y,'--r')
                plot(temp,tanInflex,'--k')
                plot([T,T],[0,dcgain(G)/4],'--k') % dcgain(G)/6 valor pequeno arbitrario
                plot([T1,T1],[0, dcgain(G)*0.632*1.1],'r--')
                grid on
                title("Ziegler-Nichols auto-ajustável")
                legend("FT","Define T1","Define T")
                hold off
                
                figure(2);
                step(G*M)
                hold on
                step(Gapx*M)
                grid on
                title("Comparação - planta com modelo aproximado")
                legend("Planta","Modelo aproximado")
                hold off
            end
        end

        function [Gapx, Kp, Ki, Kd] = ZNnaoAjustavel(G, M, tLim, znPlots)
            % considera entrada a degrau
            % G => FT
            % M => amplitude do degrau
            % tLim => limite do eixo t ajustado
            % znPlots => boolean para plotar graficos ou nao
            syms t;
            s = tf('s');
            Gsym = RoboticaBiblioteca.tf2sym(G*M/s);

            Gt = ilaplace(Gsym);
%             d2Gt = simplify(diff(Gt,t,2))
%             double(solve(d2Gt==0,t))
            tL = tLim/2;
            y = double(subs(Gt, t, tL));
            dGt = simplify(diff(Gt,t));
            m = double(subs(dGt,t,tL));
            Lsym = simplify(m*t - m*tL + y);
            
            T = double(solve(Lsym==0,t))
%             Gt = ilaplace(Gsym);
            k = m/M
            Gapx = (k*exp(-T*s))/s;
            Kp = 1.2/(T*k);
            Ti = 2*T
            Td = 0.5*T
            Ki = Kp/Ti;
            Kd = Kp*Td;
            
            if(znPlots)
                figure(1);
                step(G*M)
                xlim([0,tLim])
                limitStep = axis;
                temp = (0:0.1:limitStep(2)); % limitStep(2) = xMax no grafico
                L = subs(Lsym,t,temp);
                hold on
                plot(temp,L,'--k')
                plot([T,T],[0,limitStep(4)/4],'--k') % dcgain(G)/4 valor pequeno arbitrario
                grid on
                title("Ziegler-Nichols auto-ajustável")
                legend("FT","Define T")
                hold off
                
                figure(2);
                step(G*M)
                xlim([0,tLim])
                hold on
                step(Gapx*M)
                grid on
                title("Comparação - planta com modelo aproximado")
                legend("Planta","Modelo aproximado")
                hold off
            end
        end

    end
    
end

