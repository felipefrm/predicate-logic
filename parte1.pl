% Insere no final da lista = inserir_final(lista onde quer inserir o elemento, elemento, lista resultante)
inserir_final([], X, [X]).         % Se a lista estava vazia, o resultado é [X]
inserir_final([C|R], X, [C|R1]) :- % Senão, o primeiro elemento é igual, e o resto é obtido
    inserir_final(R, X, R1).       % Inserindo o elemento X no final do antigo resto

% Insere em uma posição N = insere_N(elemento a ser inserido, indice, lista, lista resultante)
insere_N(X, 1, L, [X|L]).
insere_N(X, N, [C|L], [C|R]) :- N1 is N-1, insere_N(X, N1, L, R).

% Remove um elemento da lista a partir do índice = insere_indice(indice, lista, lista resultante)
insere_inicio(H, L, [H|L]):- !.
remove_indice(0,[_|T],T):- !.
remove_indice(I,[H|T],R):- X is I - 1, remove_indice(X, T, Y), insere_inicio(H, Y, R).

% Maior elemento da lista = max(lista, variavel que receberá o maior elemento)
max([H|T], Y):- max1(T,X),
    (H > X ->
     H = Y;
     Y = X).
max([X],X).

% Interseção de duas listas = inter(lista1, lista2, lista resultante)
pertence(X, [X|_]).
pertence(X, [_|R]) :- pertence(X, R).
inter([ ], _, [ ]).
inter([X|L1], L2, [X|L3]):- pertence(X, L2), inter(L1, L2, L3).
inter([_|L1], L2, L3):- inter(L1, L2, L3).

% Soma dos n primeiros números
sum(0,0).  		% caso base
sum(N,R) :-		% se n não for igual a 0: 
  N > 0,		% considerando n positivo
  N1 is N-1,	% decrementa o contador
  sum(N1,R1),	% chama sum para o contador decrementado
  R is R1+N.	% incrementa o resultado da soma com o contador
