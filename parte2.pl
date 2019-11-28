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
analista().
chefe(Y,X):-(tecnico(X) , engenheiro(Y)).  
chefe(Y,X):-(engenheiro(X) , supervisor(Y)).
chefe(Y,X):-(analista(X) , supervisor(Y)).
chefe(Y,X):-(supervisor(X) , supervisor_chefe(Y)).
chefe(Y,X):-(supervisor_chefe(X) , diretor(Y)).
chefe(Y,X):-(secretaria(X) , diretor(Y)).
chefe(X,Z):-chefe(X,Y),chefe(Y,Z).
