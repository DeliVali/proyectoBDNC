//Estudiantes
CREATE (luis:estudiantes {nombre:"Luis",apellidos:"Perez Lopez",edad:"19",matricula:"zs15404476"})
CREATE (carlos:estudiantes {nombre:"Carlos",apellidos:"Adrade Lopez",edad:"21",matricula:"zs154041234"})
CREATE (javier:estudiantes {nombre:"Javier",apellidos:"Gómez Baez",edad:"20",matricula:"zs154040254"})
CREATE (pablo:estudiantes {nombre:"Pablo",apellidos:"Paez",edad:"21",matricula:"zs18045254"})
CREATE (ingrid:estudiantes {nombre:"Ingrid",apellidos:"Melchor",edad:"22",matricula:"zs18123254"})
//Materias
CREATE (bdnc:materias {nombre:"Base de datos no convencionales",creditos:"6",horasSemana:"4"})
CREATE (gr:materias {nombre:"Graficacion",creditos:"6",horasSemana:"4"})
CREATE (pa:materias {nombre:"Programación Avanzada",creditos:"7",horasSemana:"6"})
CREATE (ed:materias {nombre:"Estructuras de datos",creditos:"5",horasSemana:"6"})
CREATE (is:materias {nombre:"Ingenieria de software",creditos:"6",horasSemana:"5"})
//Estatus
CREATE (estatus1:estatus {Calificacion:"8.0",estatus:"Aprobado",inscripcion:"Primera"})
CREATE (estatus2:estatus {Calificacion:"9.0",estatus:"Aprobado",inscripcion:"Primera"})
CREATE (estatus3:estatus {Calificacion:"5.3",estatus:"Reprobado",inscripcion:"Primera"})
CREATE (estatus4:estatus{Calificacion:"7.0",estatus:"Aprobado",inscripcion:"Segunda"})
CREATE (estatus5:estatus{Calificacion:"4.7",estatus:"Reprobado",inscripcion:"Primera"})
CREATE (estatus6:estatus{Calificacion:"7.7",estatus:"Aprobado",inscripcion:"Primera"})
CREATE (estatus7:estatus{Calificacion:"3.7",estatus:"Reprobado",inscripcion:"Primera"})
//Carrera
CREATE (carr1:carrera {nombre:"Tecnologias computacionales",facultad:"Estadistica e Informatica",region:"Xalapa"})
CREATE (carr2:carrera {nombre:"Ing. de software",facultad:"Estadistica e Informatica",region:"Xalapa"})
CREATE (carr3:carrera {nombre:"Redes",facultad:"Estadistica e Informatica",region:"Xalapa"})
CREATE (carr4:carrera {nombre:"Filosofia",facultad:"Humanidades",region:"Xalapa"})
//Maestros
CREATE (rojano:maestros {nombre:"Rafael",apellidos:"Rojano",matricula:"zsd2323543",edad:"45"})
CREATE (carlosm:maestros{nombre:"Carlos",apellidos:"Perez",matricula:"zsd2525843",edad:"36"})
CREATE (lupita:maestros{nombre:"Lupita",apellidos:"Ramirez",matricula:"zsd5645683",edad:"50"})
CREATE (luism:maestros{nombre:"Luis",apellidos:"García",matricula:"zsd27878343",edad:"37"})
CREATE (juan:maestros{nombre:"Juan",apellidos:"Martinez",matricula:"zsd457623543",edad:"29"})
//________________________RELACIONES_____________________________
// 1 Estudiante cursa N materias
MATCH(luis:estudiantes),(bdnc:materias)
WHERE luis.nombre = "Luis" AND bdnc.nombre= "Base de datos no convencionales" 
CREATE (luis)-[:Cursa]->(bdnc) 

MATCH(carlos:estudiantes),(gr:materias)
WHERE carlos.nombre = "Carlos" AND gr.nombre= "Graficacion" 
CREATE (carlos)-[:Cursa]->(gr) 

MATCH(pablo:estudiantes),(ed:materias)
WHERE pablo.nombre = "Pablo" AND ed.nombre= "Estructuras de datos" 
CREATE (pablo)-[:Cursa]->(ed) 

MATCH(javier:estudiantes),(pa:materias)
WHERE javier.nombre = "Javier" AND pa.nombre= "Programación Avanzada" 
CREATE (javier)-[:Cursa]->(pa)

MATCH(ingrid:estudiantes),(is:materias)
WHERE ingrid.nombre = "Ingrid" AND is.nombre= "Ingenieria de software" 
CREATE (ingrid)-[:Cursa]->(is)

MATCH(luis:estudiantes),(is:materias)
WHERE luis.nombre = "Luis" AND is.nombre= "Ingenieria de software" 
CREATE (luis)-[:Cursa]->(is)

MATCH(ingrid:estudiantes),(pa:materias)
WHERE ingrid.nombre = "Ingrid" AND pa.nombre= "Programación Avanzada" 
CREATE (ingrid)-[:Cursa]->(pa)

// 1 Estudiante se le asigna 1 Calificación a 1 materia
MATCH(luis:estudiantes),(bdnc:materias),(estatus1:estatus)
WHERE luis.nombre = "Luis" AND bdnc.nombre= "Base de datos no convencionales" AND estatus1.Calificacion="8.0"
CREATE (luis)-[:tiene]->(estatus1),(estatus1)-[:en]->(bdnc)

MATCH(carlos:estudiantes),(gr:materias),(estatus2:estatus)
WHERE carlos.nombre = "Carlos" AND gr.nombre= "Graficacion" AND estatus2.Calificacion="9.0"
CREATE (carlos)-[:tiene]->(estatus2),(estatus2)-[:en]->(bdnc)

MATCH(pablo:estudiantes),(ed:materias),(estatus3:estatus)
WHERE pablo.nombre = "Pablo" AND ed.nombre= "Estructuras de datos" AND estatus3.Calificacion="5.3"
CREATE (pablo)-[:tiene]->(estatus3),(estatus3)-[:en]->(ed)

MATCH(javier:estudiantes),(pa:materias),(estatus4:estatus)
WHERE javier.nombre = "Javier" AND pa.nombre= "Programación Avanzada" AND estatus4.Calificacion="7.0"
CREATE (javier)-[:tiene]->(estatus4),(estatus4)-[:en]->(pa)

MATCH(ingrid:estudiantes),(is:materias),(estatus5:estatus)
WHERE ingrid.nombre = "Ingrid" AND is.nombre= "Ingenieria de software" AND estatus5.Calificacion="4.7"
CREATE (ingrid)-[:tiene]->(estatus5),(estatus5)-[:en]->(is)

MATCH(luis:estudiantes),(is:materias),(estatus6:estatus)
WHERE luis.nombre = "Luis" AND is.nombre= "Ingenieria de software" AND estatus6.Calificacion="7.7"
CREATE (luis)-[:tiene]->(estatus6),(estatus6)-[:en]->(is)

MATCH(ingrid:estudiantes),(pa:materias),(estatus7:estatus)
WHERE ingrid.nombre = "Ingrid" AND pa.nombre= "Programación Avanzada" AND estatus7.Calificacion="3.7"
CREATE (ingrid)-[:tiene]->(estatus7),(estatus7)-[:en]->(pa)

// 1 maestro n materias
MATCH(rojano:maestros),(bdnc:materias)
WHERE rojano.nombre = "Rafael" AND bdnc.nombre= "Base de datos no convencionales" 
CREATE (rojano)-[:enseña]->(bdnc)
MATCH(carlosm:maestros),(gr:materias)
WHERE carlosm.nombre = "Carlos" AND gr.nombre= "Graficacion" 
CREATE (carlosm)-[:enseña]->(gr)
MATCH(carlosm:maestros),(ed:materias)
WHERE carlosm.nombre = "Carlos" AND ed.nombre= "Estructuras de datos" 
CREATE (carlosm)-[:enseña]->(ed)
MATCH(lupita:maestros),(is:materias)
WHERE lupita.nombre = "Lupita" AND is.nombre= "Ingenieria de software" 
CREATE (lupita)-[:enseña]->(is)
MATCH(lupita:maestros),(pa:materias)
WHERE lupita.nombre = "Lupita" AND pa.nombre= "Programación Avanzada" 
CREATE (lupita)-[:enseña]->(pa)
MATCH(luism:maestros),(pa:materias)
WHERE luism.nombre = "Luis" AND pa.nombre= "Programación Avanzada" 
CREATE (luism)-[:enseña]->(pa)
MATCH(juan:maestros),(gr:materias)
WHERE juan.nombre = "Juan" AND gr.nombre= "Graficacion" 
CREATE (juan)-[:enseña]->(gr)

// 1 Estudiante estudia 1 carrera
MATCH(luis:estudiantes),(carr1:carrera)
WHERE luis.nombre = "Luis" AND carr1.nombre="Tecnologias computacionales" 
CREATE (luis)-[:Estudia]->(carr1)
MATCH(ingrid:estudiantes),(carr1:carrera)
WHERE ingrid.nombre = "Ingrid" AND carr1.nombre="Tecnologias computacionales" 
CREATE (ingrid)-[:Estudia]->(carr1)
MATCH(carlos:estudiantes),(carr2:carrera)
WHERE carlos.nombre = "Carlos" AND carr2.nombre="Ing. de software" 
CREATE (carlos)-[:Estudia]->(carr2)
MATCH(javier:estudiantes),(carr3:carrera)
WHERE javier.nombre = "Javier" AND carr3.nombre="Redes" 
CREATE (javier)-[:Estudia]->(carr3)
MATCH(pablo:estudiantes),(carr4:carrera)
WHERE pablo.nombre = "Pablo" AND carr4.nombre="Filosofia" 
CREATE (pablo)-[:Estudia]->(carr4)