

function M1=Bissecao
%Para invocar a fun��o basta escrever Bissecao no 'Command Window'

%Primeira parte do projeto vamos criar um c�digo do m�todo da bisse��o
%assim poderemos revolver o uma das fun��es encontrando suas raizes nas
%limita��es especificadas 

                        % M�todo da Bisse��o

%N�o precisamos fazer a analise de converg�ncia dessa fun��o, estamos
%trabalhando com polin�mios eles s�o continuous em toda reta real

a = 0; % Limite inferior do intervalo
b = 1; % Limite superior do intervalo
% f(t)=t^3-9t=-3 primeira fun��o que vamos avaliar 

    f = 't^3-9*t+3';
    e1 = 10^-3; % Cota de erro absoluto m�xima e para |f(t)|

    
% C�lculos Iniciais
t = (a+b)/2; % Aproxima��o inicial
% erro absoluto inicial vamos trabalhar sempre com uma modifica��o do erro
% absoluto incial assim podemos fazer a an�lise antes e depois da troca de
% dados

EA = abs(b-a); 


k = 0; % Contador de itera��es
g = abs(eval(f)); % M�dulo de f(t) na raiz aprotimada inicial


%vamos tamb�m calcular o n�mero de intera��es 
%dado meu a e b inicial e meu e1 podemos fazer uma aprox�ma��o para o
%n�mero de intera��es totais do nosso m�todo intKBi=Log(na base 2)(E0/e1)
E0 = b-a;
intKBi=log2(E0/e1);

%assim conseguimos estimar um n�mero exato de intera��es 

fprintf(1,'%s %2d %s %12.9f %s %12.9f %s %12.9f\n','k =',k,...
' t =',t,' f(t) =',eval(f),' EA|(b-a)| =',EA);


%aqui j� estamos prontos para come�ar nosso loop vamos usar como crit�rio
%de parada vamos usar 
           %|(b-a)| > e1 && |f(t)| > e1 && k < Log2(E0/e1)

               while EA > e1 && g > e1 && k < intKBi
                            t = a;
              fa = eval(f); %calculo o valor do meu fa usando a fun��o eval
                             t = b;
              fb = eval(f); %calculo o valor do meu fb usando a fun��o eval
                             t = (a+b)/2;
                             ft = eval(f);
              %comando que testa sempre se a imagem da minha fun��o est� em
              %um intervalo certo.
                             if fa*ft < 0
                                b = t;
                             else
                                a = t;
                             end
                             k = k+1;
t = (a+b)/2; % Nova aproxima��o da raiz
EA = abs(b-a); %erro absoluto
g = abs(eval(f)); % M�dulo de f(t) na nova aproxima��o da raiz
fprintf(1,'%s %2d %s %12.9f %s %12.9f %s %12.9f\n','k =',k,...
' t =',t,' f(t) =',eval(f),' EA|(b-a)|=',EA);
end
