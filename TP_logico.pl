persona(juan).
persona(ana).
persona(claudia).
persona(pedro).

contacto(juan,ana).
contacto(juan,claudia).
contacto(juan,pedro).

contacto(ana,juan).

mensaje(juan,ana,hola).
mensaje(juan,claudia,notequieromas).


incomodidad(hola,1).
incomodidad(notequieromas,10).

%variblesenmayus
%1
sonAmigos(P1,P2):- contacto(P1,P2),contacto(P2,P1),mensaje(P1,P2,_), P1\=P2 .
sonAmigos(P1,P2):- contacto(P1,P2),contacto(P2,P1),mensaje(P2,P1,_), P1\=P2 .

%2
recMsjInesperado(Emisor,P1) :- not(contacto(P1,Emisor)),
                                mensaje(Emisor,P1,_), 
                                   Emisor\=P1 .
%3
recvMsjIncomodo(P2) :- mensaje(_,P2,Msj), incomodidad(Msj,Inc), Inc>7 .							   
