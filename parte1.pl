% Insere no final da lista = inserir_final(lista onde quer inserir o elemento, elemento, lista resultante)
inserir_final([], X, [X]).         % Se a lista estava vazia, o resultado é [X]
inserir_final([C|R], X, [C|R1]) :- % Senão, o primeiro elemento é igual, e o resto é obtido
    inserir_final(R, X, R1).       % Inserindo o elemento X no final do antigo resto


% Insere em uma posição N = insere_N(elemento a ser inserido, indice, lista, lista resultante)
insere_N(X, 1, L, [X|L]).												% Se o indice for 1 já insere na cabeça da lista
insere_N(X, N, [C|L], [C|R]) :- 										% Senão, a cada chamada recursiva desconsidera a cabeça da lista
	N1 is N-1, insere_N(X, N1, L, R).									% e decrementa o indice, até o indice ser igual a 1.

% Remove um elemento da lista a partir do índice = insere_indice(indice, lista, lista resultante)
insere_inicio(H, L, [H|L]):- !.											
remove_indice(0,[_|T],T):- !.											% Se indice for 0, remove a cabeça da lista
remove_indice(I,[H|T],R):- 												% Senão, decrementa o indice, e constroi-se uma lista do inicio
    X is I - 1, remove_indice(X, T, Y), insere_inicio(H, Y, R).			% adicionando a cada chamada o primeiro elemento. Quando o indice for igual a 0
																		% remove o primeiro elemento da lista construida.

% Maior elemento da lista = max(lista, variavel que receberá o maior elemento)
max([H|T], Y):- max(T,X),
    (H > X ->
     H = Y;
     Y = X).
max([X],X).


% Interseção de duas listas = inter(lista1, lista2, lista resultante)
pertence(X, [X|_]).																% verifica se um elemento pertence a uma lista.
pertence(X, [_|R]) :- pertence(X, R).											% se tivermos uma lista desconhecida, e uma lista vazia, a interseção
intersecao([ ], _, [ ]).														% resulta em uma lista também vazia.
intersecao([X|L1], L2, [X|L3]):- pertence(X, L2), intersecao(L1, L2, L3).		% senão, se tivermos um elemento x na lista 1 e ele também estiver contido
intersecao([_|L1], L2, L3):- intersecao(L1, L2, L3).							% na lista resultante, então tem que estar contido também na lista 2
																				% checa-se isso para todos os elementos das listas por recursão
																					

% Soma dos n primeiros números = sum(numero, variavel que receberá o resultado
soma(0,0).  	% caso base
soma(N,R) :-	% se n não for igual a 0: 
  N > 0,		% considerando n positivo
  N1 is N-1,	% decrementa o contador
  soma(N1,R1),	% chama sum para o contador decrementado
  R is R1+N.	% incrementa o resultado da soma com o contador


% Checa se uma lista é palindromo ou não = palindromo(lista)
lista_invertida(X,Y) :- lista_invertida(X,[],Y).
lista_invertida([],X,X).
lista_invertida([X|Y],Z,T) :- lista_invertida(Y,[X|Z],T).
palindromo(L):- lista_invertida(L, L).
