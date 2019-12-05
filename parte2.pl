tecnico(rogerio).
tecnico(ivone).
engenheiro(daniel).
engenheiro(isabel).
engenheiro(oscar).
engenheiro(tomas).
engenheiro(ana).
supervisor(luis).
supervisor_chefe(sonia).
secretaria(laura).
diretor(santiago).
%analista().

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

