data Anillo = UnAnillo{
 peso :: Int,
 frase :: String
                      } deriving Show

data Hobbit = UnHobbit {
 nombre :: String,
 estatura :: Int,
 salud :: Int,
 fuerza :: Int,
 de_Comarca :: Bool,
 anillo :: Anillo
                        } deriving Show

-- Punto 1
-- a
frodo = UnHobbit {
 nombre = "Frodo",
 estatura = 106,
 salud = 10,
 fuerza = 50,
 de_Comarca = True,
 anillo = anillo_unico
                  }
--anillo de frodo
anillo_unico = UnAnillo{
 peso =12, 
 frase = "Un Anillo para gobernarlos a todos. Un Anillo para encontrarlos, un Anillo para atraerlos a todos y atarlos en las tinieblas."
                      }
-- b 
ciel = UnHobbit {
 nombre = "Ciel",
 estatura = 135,
 salud = 20,
 fuerza = 25,
 de_Comarca = False,
 anillo = anillo_de_la_reina
                  }
--anillo de Ciel
anillo_de_la_reina = UnAnillo{
 peso =20, 
 frase ="Un anillo que vuelve las mentiras en verdad.Simbolo de su lealtad a la reina."
                             }
anillo_vongola = UnAnillo{
peso = 15,
frase = "Un anillo que le da poder a Tsunayoshi."
                         }
-- Punto 2
poder_delAnillo :: Anillo -> Int
poder_delAnillo anillo = (length(frase anillo))*(peso anillo)

--Punto 3

absolute num
 |num <= 0     = 0
 |otherwise    = num
 
--Punto 4
resistencia :: Hobbit -> Int
resistencia hobbit
 |de_Comarca hobbit == True  && head (nombre hobbit)== 'F'     = absolute((estatura hobbit) * (salud hobbit) + (fuerza hobbit)+ 10 -(poder_delAnillo (anillo hobbit)))
 |de_Comarca hobbit == False && head (nombre hobbit)== 'F'     = absolute((estatura hobbit) * (salud hobbit) + (fuerza hobbit)+ 10 -(poder_delAnillo (anillo hobbit)))
 |de_Comarca hobbit == True                                    = absolute((estatura hobbit) * (salud hobbit) + (fuerza hobbit)) 
 |otherwise                                                    = (salud hobbit) * (fuerza hobbit)
 
flip_anillo :: Hobbit -> Anillo -> Hobbit
flip_anillo (UnHobbit nombre estatura salud fuerza de_Comarca anillo) anillo_new = (UnHobbit nombre estatura salud fuerza de_Comarca anillo_new)

--Punto 5
comida :: Hobbit -> String -> Int -> Hobbit
comida (UnHobbit nombre estatura salud fuerza  de_Comarca anillo) food cant_manz
 |food == "Desayuno"             = (UnHobbit ("Errrp"++nombre) estatura (salud+5) fuerza de_Comarca anillo)
 |food == "Segundo desayuno"     = (UnHobbit nombre estatura salud (fuerza+4*cant_manz) de_Comarca anillo)
 |food == "Merienda"             = (UnHobbit ("Errrp"++nombre) estatura (salud+5) (fuerza+8) de_Comarca anillo)

--Punto 6
mas_OP :: Hobbit -> Hobbit -> Int
mas_OP hobbit1 hobbit2
 |(resistencia (comida hobbit1 "Merienda" 0)) >(resistencia (comida hobbit2 "Merienda" 0))    = resistencia hobbit1
 |otherwise                                                                                   = resistencia hobbit2
 