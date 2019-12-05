%cargo(X, analista).
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

chefe(Y,X):-(cargo(X, tecnico) , cargo(Y, engenheiro)).  
chefe(Y,X):-(cargo(X, engenheiro) , cargo(Y, supervisor)). 
%chefe(Y,X):-(cargo(X, analista), cargo(Y, supervisor)).
chefe(Y,X):-(cargo(X, supervisor) , cargo(Y, supervisor_chefe)). 
chefe(Y,X):-(cargo(X, supervisor_chefe) , cargo(Y, diretor)). 
chefe(Y,X):-(cargo(X, secretaria) , cargo(Y, diretor)). 
chefe(X,Z):-chefe(X,Y),chefe(Y,Z).

chefiado(tecnico, engenheiro).
chefiado(engenheiro, supervisor).
chefiado(analista, supervisor).
chefiado(supervisor, supervisor_chefe).
chefiado(supervisor_chefe, diretor).
chefiado(secretaria, diretor).

% Consultas:
% a) chefiado(tecnico, X) , chefiado(X, Y) 
% b) chefe(X, ivone) , cargo(X, Y)
% c) chefiado(X, supervisor_chefe) , cargo(Y, X)  
%    chefiado(Z, supervisor) , cargo(W, Z)
% d)
