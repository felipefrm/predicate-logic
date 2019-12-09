%Atribui a cada pessoa seu cargo
%cargo(nome do funcionario, cargo do funcionario)
cargo(rogerio, tecnico).
cargo(ivone, tecnico).
cargo(daniel, engenheiro).
cargo(isabel, engenheiro).
cargo(oscar, engenheiro).
cargo(tomas, engenheiro).
cargo(ana, engenheiro).
cargo(luis, supervisor).
cargo(sonia, supervisor_chefe).
cargo(laura, secretaria).
cargo(santiago, diretor).

%Permite a consulta de quem é chefe de quem através do nome da pessoa
%chefe(nome do chefe, nome do subordinado)
chefe(Y,X):-(cargo(X, tecnico) , cargo(Y, engenheiro)).  
chefe(Y,X):-(cargo(X, engenheiro) , cargo(Y, supervisor)). 
chefe(Y,X):-(cargo(X, supervisor) , cargo(Y, supervisor_chefe)). 
chefe(Y,X):-(cargo(X, supervisor_chefe) , cargo(Y, diretor)). 
chefe(Y,X):-(cargo(X, secretaria) , cargo(Y, diretor)). 
chefe(X,Z):-chefe(X,Y),chefe(Y,Z).


%Organiza a hierarquia dos cargos, quem é chefiado por quem
%chefiado(cargo subordinado, cargo chefe)
chefiado(tecnico, engenheiro).
chefiado(engenheiro, supervisor).
chefiado(analista, supervisor).
chefiado(supervisor, supervisor_chefe).
chefiado(supervisor_chefe, diretor).
chefiado(secretaria, diretor).

% Chamada recursiva para buscar todos os subordinados diretos e 
% indiretos de um determinado chefe
% chefiados(cargo subordinado, cargo chefe)
chefiados(X,Z):-chefiado(X,Z).
chefiados(X,Z):-
	chefiado(X,Y),chefiados(Y,Z).

% Consultas:

% % a) chefiado(tecnico, W) , chefiado(W, X), cargo(Y, W) , cargo(Z, X)    
% 		W = cargo chefe tecnico, X = cargo chefe do chefe do tecnico, 
% 		Y = nome do chefe do tecnico, Z = nome do chefe do chefe do tencico

% % b) chefe(X, ivone) , cargo(X, Y)
%		X = nome do chefe da ivone, Y = cargo do chefe da ivone
%		
% % c) chefiado(X, supervisor_chefe) , cargo(Y, X)  
%    chefiado(Z, supervisor) , cargo(W, Z)
%    	X = cargo do subordinado do supervisor chefe, Y = nome do subordinado do supervisor chefe
%		Z = cargo do subordinado do supervisor, Y = nome do subordinado do supervisor

% % d) cargo(_,X), not(chefiados(X,diretor)).
% 		X = cargo da Carolina
		
