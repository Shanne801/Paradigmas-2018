anioIngreso "george"    = 2018
anioIngreso "sexy99"    = 2017
anioIngreso "boca_cabj" = 2010
anioIngreso "jroman"    = 2014
anioIngreso "turing"    = 2005

anioIngreso "Tur1ng"    = 2018

puntosMax "newbie"     = 1
puntosMax "intermedio" = 5
puntosMax "avanzado"   = 10

antiguedad nombre = 2018 - anioIngreso nombre

puntosBase nombre = (antiguedad nombre)* (length nombre)

nivel nombre 
 |nombre == "turing"        = "avanzado"
 |antiguedad nombre <   1   = "newbie"
 |puntosBase nombre <   50  = "intermedio"
 |otherwise = "avanzado"
 
puedeOtorgar nombre nro = nro <= (puntosMax.nivel) nombre
 -- puedo dar puntos negativos?
 
tieneMasPuntos nombre1 nombre2 
 |puntosBase nombre1 >= puntosBase nombre2     = nombre1
 |otherwise                                    = nombre2 
 -- el caso de igual esta en vano porque no hay puntajes iguales
 
puntosDelMasGroso nombre1 nombre2 = (puntosBase . tieneMasPuntos nombre1) nombre2

 