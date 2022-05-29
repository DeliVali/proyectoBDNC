//Estudiantes
CREATE (luis:estudiantes {nombre:"Luis",apellidos:"Perez Lopez",edad:"19",matricula:"zs15404476"})

//Materias
CREATE (bdnc:materias {nombre:"Base de datos no convencionales",creditos:"6",horasSemana:"4"})

//Estatus
CREATE (estatus1:estatus {Calificacion:"8.0",estatus:"Aprobado",inscripcion:"Primera"})

//Carrera
CREATE (carr1:carrera {nombre:"Tecnologias computacionales",facultad:"Estadistica e Informatica",region:"Xalapa"})
CREATE (carr2:carrera {nombre:"Ing. de software",facultad:"Estadistica e Informatica",region:"Xalapa"})
CREATE (carr3:carrera {nombre:"Redes",facultad:"Estadistica e Informatica",region:"Xalapa"})
CREATE (carr4:carrera {nombre:"Filosofia",facultad:"Humanidades",region:"Xalapa"})
//Maestros
CREATE (rojano:maestros {nombre:"Rafael",apellidos:"Rojano",matricula:"zsd2323543",edad:"45"})
CREATE (carlos:maestros {nombre:"Carlos",apellidos:"Perez",matricula:"zsd2525843",edad:"36"})
CREATE (lupita:maestros {nombre:"Lupita",apellidos:"Ramirez",matricula:"zsd5645683",edad:"50"})
CREATE (luis:maestros {nombre:"Luis",apellidos:"García",matricula:"zsd27878343",edad:"37"})
CREATE (rojano:maestros {nombre:"Juan",apellidos:"Martinez",matricula:"zsd457623543",edad:"29"})




//________________________RELACIONES_____________________________

// 1 Estudiante cursa N materias

MATCH(luis:estudiantes),(bdnc:materias)
WHERE luis.nombre = "Luis" AND bdnc.nombre= "Base de datos no convencionales" 
CREATE (luis)-[:Cursa]->(bdnc)

// 1 Estudiante se le asigna 1 Calificación a 1 materia

MATCH(luis:estudiantes),(bdnc:materias),(estatus1:estatus)
WHERE luis.nombre = "Luis" AND bdnc.nombre= "Base de datos no convencionales" AND estatus1.estatus="Aprobado"
CREATE (luis)-[:tiene]->(estatus1),(estatus1)-[:en]->(bdnc)

// 1 maestro n materias

MATCH(rojano:maestros),(bdnc:materias)
WHERE rojano.nombre = "Rafael" AND bdnc.nombre= "Base de datos no convencionales" 
CREATE (rojano)-[:enseña]->(bdnc)

// 1 Estudiante estudia 1 carrera

MATCH(luis:estudiantes),(carr1:carrera)
WHERE luis.nombre = "Luis" AND carr1.nombre="Tecnologias computacionales" 
CREATE (luis)-[:Estudia]->(carr1)


