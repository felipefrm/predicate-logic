%% a)Um predicado que insira um elemento no final da lista.
% Insere no final da lista = inserir_final(lista onde quer inserir o elemento, elemento, lista resultante)
inserir_final([], ELEMENTO, [ELEMENTO]).         			% Se a lista estava vazia, o resultado é [X]
inserir_final([CABECA|RESTO], ELEMENTO, [CABECA|RESTO1]) :- % Senão, o primeiro elemento é igual, e o resto é obtido
    inserir_final(RESTO, ELEMENTO, RESTO1).       			% Inserindo o elemento X no final do antigo resto



%% b)Um predicado que insira um elemento em uma determinada posição da lista.
% Insere em uma posição N = insere_N(elemento a ser inserido, indice, lista, lista resultante)
% Posição começa de 0
insere_N(ELEMENTO, 0, LISTA, [ELEMENTO|LISTA]).													% Se o indice for 0 já insere na cabeça da lista
insere_N(ELEMENTO, INDICE, [CABECA|LISTA], [CABECA|RESULTANTE]) :- 								% Senão, a cada chamada recursiva desconsidera a cabeça da lista
	INDICE1 is INDICE-1,																		% e decrementa o indice, até o indice ser igual a 0.
    insere_N(ELEMENTO, INDICE1, LISTA, RESULTANTE).



%% c)Um predicado que remova um elemento em uma determinada posição da lista.
% Remove um elemento da lista a partir do índice = insere_indice(indice, lista, lista resultante)
insere_inicio(ELEMENTO, LISTA, [ELEMENTO|LISTA]):- !.
remove_indice(0, [_|CAUDA], CAUDA):- !.% Se indice for 0, remove a cabeça da lista
remove_indice(INDICE, [ELEMENTO|CAUDA], RESULTANTE):- % Senão, decrementa o indice, e constroi-se uma lista do inicio
    INDICE1 is INDICE - 1,
    remove_indice(INDICE1, CAUDA, LISTA),
    insere_inicio(ELEMENTO, LISTA, RESULTANTE).	% adicionando a cada chamada o primeiro elemento. Quando o indice for igual a 0
																								% remove o primeiro elemento da lista construida.


%% d)Um predicado que forneça a intersecção de duas listas.
% Interseção de duas listas = inter(lista1, lista2, lista resultante)
pertence(X, [X|_]) :- !.														% verifica se um elemento pertence a uma lista.
pertence(X, [_|RESTO]) :-
  pertence(X, RESTO).									% se tivermos uma lista desconhecida, e uma lista vazia, a interseção
intersecao([ ], _, [ ]). % resulta em uma lista também vazia.
intersecao([X|L1], L2, [X|L3]):- % senão, se tivermos um elemento x na lista 1 e ele também estiver contido
  pertence(X, L2),
  intersecao(L1, L2, L3).
intersecao([_|L1], L2, L3):- intersecao(L1, L2, L3).							% na lista resultante, então tem que estar contido também na lista 2
																				% checa-se isso para todos os elementos das listas por recursão


%% e)Um predicado que identifique se um conjunto de elementos está contido em uma
%% lista (os elementos do conjunto podem estar em qualquer ordem na lista)
% Checa se conjunto de elementos está em uma lista
% elementos_percentem(lista1, lista2)
% tal que a lista1 é a lista que deve-se checar se seus elementos estão na lista2
elementos_pertencem([CABECA],LISTA) :- !,
    pertence(CABECA,LISTA).
elementos_pertencem([CABECA|RESTO],LISTA) :-
    pertence(CABECA,LISTA),
    elementos_pertencem(RESTO,LISTA).



%% f)Um predicado que retorne o maior valor contido em uma lista numérica.

% Maior elemento da lista = max(lista, variavel que receberá o maior elemento)
max([CABECA|CAUDA], Y):- max(CAUDA, X),
    (CABECA > X ->
     CABECA = Y;
     Y = X).
max([X], X).


%% g)Um predicado denominado ordena(X, Y)onde Y é uma versão ordenada da lista X.

% exclui(elemento, lista, lista resultante)
exclui(ELEMENTO,[ELEMENTO|RESTO],RESTO).
% Ordena uma lista
exclui(ELEMENTO,[CABECA|RESTO1],[CABECA|RESTO2]) :-
  exclui(ELEMENTO,RESTO1,RESTO2).
% ordena(lista,lista resultante)
ordena([ELEMENTO],[ELEMENTO]).
ordena(LISTA,RESULTADO) :-
    max(LISTA,MAIOR_ELEMENTO),          % pega o maior elemento da lista
    exclui(MAIOR_ELEMENTO,LISTA,RESTO), % exclui esse elemento e gera a lista RESTO
    ordena(RESTO,RESTO_ORDENADO),       % ordena a lista RESTO
    inserir_final(RESTO_ORDENADO,MAIOR_ELEMENTO,RESULTADO).
    % insere o maior elemento no final da lista RESTO que já está ordenada


%% h)Um predicado para obter a soma dos N primeiros números naturais.

% Soma dos n primeiros números = sum(numero, variavel que receberá o resultado)
soma(0,0).  	   % caso base
soma(NUMERO,RESULTADO) :-	   % se o numero não for igual a 0:
  NUMERO > 0,		     % considerando o numero positivo
  N1 is NUMERO-1,	   % decrementa o contador
  soma(N1,R1),	 % chama sum para o contador decrementado
  RESULTADO is R1+NUMERO.	   % incrementa o resultado da soma com o contador


%% i) Escreva um predicado denominado palíndromo(X) que é verdadeiro
%% se X é uma lista cujos elementos invertidos produzem a mesma ordem original.

% lista_invertida("lista", "lista" invertida)
lista_invertida(L1,L2) :-
  lista_invertida(L1,[],L2).
lista_invertida([],L1,L1).
lista_invertida([L1|L2],X,Y) :-
  lista_invertida(L2,[L1|X],Y).
% Checa se uma lista é palindromo ou não = palindromo(lista)
palindromo(LISTA) :- lista_invertida(LISTA, LISTA).



%% j) Escreva um predicado denominado acomoda/2 cujo primeiro argumento é uma
%% lista permitindo listas como  elementos  (ex.  [a,  [a,  [b,  c]],  b,  [c,  d]])
%% e  cujo  segundo  argumento  é  outra  lista  com  todos  os elementos da primeira
%% acomodados em uma única lista (ex. [a, a, b, c, b, c, d].

% Concatena duas listas, concatena(lista1, lista2, lista resultante)
concatena([], LISTA, LISTA).
% Se a primeira lista é vazia o resultado será a própria lista.
concatena([CABECA | RESTO1], LISTA, [CABECA | RESTO2]) :-
    concatena(RESTO1, LISTA, RESTO2).
% faz uma lista "plana" com a lista dada como entrada
% acomoda(lista1,lista resultante)
acomoda([], []) :- !.
acomoda([CABECA|RESTO], LISTA_PLANA) :-
    !,
    % NOVA_LISTA1 e NOVA_LISTA2 serão uma lista "plana"
    % NOVA_LISTA1 será a lista "plana" da cabeça da lista
    % NOVA_LISTA2 será a lista "plana" do resto da lista
    acomoda(CABECA, NOVA_LISTA1),
    acomoda(RESTO, NOVA_LISTA2),
    concatena(NOVA_LISTA1, NOVA_LISTA2, LISTA_PLANA).
acomoda(LISTA, [LISTA]).


% Exemplo de uso:
% inserir_final([1,2,3,4],5,L)
% insere_N(99,2,[1,2,2,4],L)
% remove_indice(2,[1,2,3,5,6],L)
% intersecao([1,2,3],[2,3,4], L)
% elementos_pertencem([2,4], [1,2,3,4], L)
% max([3,2,4], L)
% ordena([2,3,5,1], L)
% soma(5,L)
% palindromo([a,r,a,r,a])
% acomoda([a,  [a,  [b,  c]],  b,  [c,  d]],L)
