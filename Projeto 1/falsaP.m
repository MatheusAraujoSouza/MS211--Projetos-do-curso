

function M2=falsaP
%Agora vamos implementar o m�todo da Falsa posi��o para a resolu��o da 
%segunda fun��o

                    %m�todo da falsa posi��o 
         
 %o melhor ponto � entre 1 e 3 conseguimos ver isso pela plotagem do
 %gr�fico tamb�m podemos analisar isso pelas derivadas que etistem uma
 %�nica no intervalo mas vamos deitar isso para o rel�torio 
% Par�metros
a = 4; % Limite inferior do intervalo
b = 5; % Limite superior do intervalo

%analisamos a fun��o graficamente logo esses pontos iniciais respeitao a
%convergencia da fun��o com logaritmo 
f = 'log10(t).*t-3';    
e1 = 10^-3;            
                 
  % C�lculos Iniciais
t = a;
fa = eval(f);
t = b;
fb = eval(f);
%Temos aqui que nossa primeira aproxima��o da reta do m�todo da falsa
%posi��o
t = (a*fb-b*fa)/(fb-fa); 
%aqui temos a imagem do pr�ximo ponto xk encontrado no nosso m�todo
%que busca sempre a intersec��o com o eixo das abissi�as 
ft = eval(f);
k=0;
fprintf(1,'%s %2d %s %12.9f %s %12.9f %s %12.9f\n','k =',k,...
' t =',t,' f(t) =',ft,'|b-a| =',abs(b-a));
        
                   
  %aqui vamos usar apenas dois crit�rios de parada como foi passado em aula
  %poderiamos usar at� mais como diz no livro da M�rcia A.gomes
  %temos ent�o |f(t)| > e1 && |(b-a)| >e1
              while abs(ft) > e1 && abs(b-a) >e1

                           k = k+1;
                           if fa*ft < 0
                                    b = t;
                           else
                                    a = t;
                           end
                            t = a;
                            fa = eval(f);
                            t = b;
                            fb = eval(f);
                            t = (a*fb-b*fa)/(fb-fa);
                            ft = eval(f);
fprintf(1,'%s %2d %s %12.9f %s %12.9f %s %12.9f\n',...
    'k =',k,' t =',t,' f(t) =',ft,' |b-a|=',abs(b-a));
end
        