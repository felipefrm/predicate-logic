% Insere no final da lista
inserir_final([], Y, [Y]).         % Se a lista estava vazia, o resultado é [Y]
inserir_final([I|R], Y, [I|R1]) :- % Senão, o primeiro elemento é igual, e o resto é obtido
    inserir_final(R, Y, R1).       % Inserindo o elemento Y no final do antigo resto

% Insere numa posição N
insereN(X,1,L,[X|L]).
insereN(X,N,[C|L],[C|R]):-N1 is N-1, insereN(X,N1,L,R).

% Remove um elemento da lista a partir do índice
insereInicio(H, L, [H|L]):- !.
removeind(0,[_|T],T):- !.
removeind(I,[H|T],R):- X is I - 1, removeind(X, T, Y), insereInicio(H, Y, R).

% Maior elemento
max([X,Y|Cauda],Max) :- X >= Y, !, max([X|Cauda],Max).
max([X,Y|Cauda],Max) :- max([Y|Cauda],Max).

% Interseção de duas linhas
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


  
