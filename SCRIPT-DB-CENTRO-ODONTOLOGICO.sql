USE CENTRO_ODONTOLOGICO

CREATE TABLE PAISES
(id_pais int ,
descripcion varchar (100),
CONSTRAINT PK_paises PRIMARY KEY (id_pais)
)

CREATE TABLE PROVINCIAS 
(id_provincia int ,
descripcion varchar (100),
id_pais int ,
CONSTRAINT PK_provincias PRIMARY KEY (id_provincia),
CONSTRAINT FK_provincias_paises FOREIGN KEY (id_pais)
REFERENCES paises (id_pais) 
)

CREATE TABLE LOCALIDADES 
(id_localidad int  ,
descripcion varchar (100),
id_provincia int,
CONSTRAINT PK_localidades PRIMARY KEY (id_localidad),
CONSTRAINT FK_localidades_provincias FOREIGN KEY (id_provincia)
REFERENCES provincias (id_provincia) 
)

CREATE TABLE BARRIOS 
(id_barrio int,
descripcion varchar (100),
id_localidad int ,
CONSTRAINT PK_barrios PRIMARY KEY (id_barrio),
CONSTRAINT FK_barrios_localidades FOREIGN KEY (id_localidad)
REFERENCES localidades (id_localidad) 
)


CREATE TABLE TIPOS_DOCUMENTOS
(id_tipo_doc int,
descripcion varchar (70),
CONSTRAINT PK_tipos_documentos PRIMARY KEY (id_tipo_doc)
)
CREATE TABLE OBRAS_SOCIALES
(id_obra_social int,
nombre varchar (70),
CONSTRAINT PK_obras_sociales PRIMARY KEY (id_obra_social)
)

CREATE TABLE TIPOS_MOVIMIENTOS
(id_tipo_movimiento int,
descripcion varchar (50),
CONSTRAINT PK_tipos_movimientos PRIMARY KEY (id_tipo_movimiento)
)

CREATE TABLE PROCEDIMIENTOS_ODONTOLOGICOS
(id_proc_odontologico int,
nombre varchar (100),
precio int,
CONSTRAINT PK_procedimientos_odontologicos PRIMARY KEY (id_proc_odontologico)
) 


CREATE TABLE FORMAS_DE_PAGOS
(id_forma_pago int,
descripcion varchar  (100),
recargo int,
CONSTRAINT  PK_formas_pagos PRIMARY KEY (id_forma_pago)
)

CREATE TABLE TIPOS_CONTACTOS
(id_tipo_contacto int,
tipo_contacto varchar (100),
CONSTRAINT PK_tipos_contactos PRIMARY KEY (id_tipo_contacto)
)

CREATE TABLE ESPECIALIDADES
(id_especialidad int,
descripcion varchar (100),
CONSTRAINT PK_especialidades PRIMARY KEY (id_especialidad)
)

CREATE TABLE MARCAS
(id_marca int,
marca varchar (100),
CONSTRAINT PK_marcas PRIMARY KEY (id_marca)
)

CREATE TABLE TIPOS_REPARACIONES
(id_tipo_reparacion  int,
descripcion varchar (150),
CONSTRAINT PK_tipos_reparaciones PRIMARY KEY (id_tipo_reparacion)
)

CREATE TABLE PACIENTES
(id_paciente int,
nombre varchar (50),
apellido varchar (50),
nro_telefono int,
fecha_nacimiento date,
nro_documento int,
email varchar (100),  
calle varchar (50),
altura int,
id_tipo_doc int,
id_barrio int,
id_obra_social int,
CONSTRAINT PK_pacientes PRIMARY KEY (id_paciente),
CONSTRAINT FK_pacientes_tipos_documentos FOREIGN KEY (id_tipo_doc)
REFERENCES tipos_documentos (id_tipo_doc),
CONSTRAINT FK_pacientes_barrios  FOREIGN KEY (id_barrio)
REFERENCES barrios (id_barrio),
CONSTRAINT FK_pacientes_obras_sociales FOREIGN KEY (id_obra_social)
REFERENCES obras_sociales (id_obra_social)
)

CREATE TABLE DENTISTAS
(nro_dentista int,
nombre varchar (50),
apellido  varchar (50),
id_tipo_doc int,
nro_documento int,
nro_telefono int,
id_especialidad int,
nro_matricula varchar (30),
email varchar (100),
CONSTRAINT PK_dentistas PRIMARY KEY (nro_dentista),
CONSTRAINT FK_dentistas_tipos_documentos FOREIGN KEY (id_tipo_doc)
REFERENCES  tipos_documentos (id_tipo_doc),
CONSTRAINT FK_dentistas_especialidades FOREIGN KEY(id_especialidad)
REFERENCES especialidades (id_especialidad)
)

CREATE TABLE CLINICAS
(id_clinica int,
nombre varchar (100),
altura int,
calle varchar (100),
hora_apertura  time,
hora_cierre time,
id_barrio int,
CONSTRAINT PK_clinicas PRIMARY KEY (id_clinica),
CONSTRAINT FK_clinicas_barrios FOREIGN KEY (id_barrio)
REFERENCES barrios (id_barrio)
) 

CREATE TABLE FACTURAS
(nro_factura int,
fecha date,
id_clinica int,
id_paciente int,
nro_dentista int,
CONSTRAINT PK_facturas PRIMARY KEY (nro_factura),
CONSTRAINT FK_facturas_clinicas FOREIGN KEY (id_clinica)
REFERENCES clinicas (id_clinica),
CONSTRAINT FK_facturas_pacientes FOREIGN KEY (id_paciente)
REFERENCES pacientes (id_paciente),
CONSTRAINT FK_facturas_dentistas FOREIGN KEY (nro_dentista)
REFERENCES dentistas (nro_dentista)
)

CREATE TABLE DETALLE_FACTURAS
(id_detalle_factura int,
nro_factura int,
id_proc_odontologico int,
precio int,
CONSTRAINT PK_detalles_facturas PRIMARY KEY (id_detalle_factura),
CONSTRAINT FK_detalles_facturas_facturas FOREIGN KEY (nro_factura)
REFERENCES facturas (nro_factura),
CONSTRAINT FK_detalles_facturas_procedimientos_odontologicos FOREIGN KEY (id_proc_odontologico)
REFERENCES procedimientos_odontologicos (id_proc_odontologico)
)

CREATE TABLE FACTURAS_FORMAS_PAGOS
(id_factura_forma_pago int,
nro_factura int,
id_forma_pago int,
monto int,
CONSTRAINT PK_facturas_formas_pagos PRIMARY KEY (id_factura_forma_pago),
CONSTRAINT FK_facturas_formas_pagos_facturas FOREIGN KEY (nro_factura)
REFERENCES facturas (nro_factura),
CONSTRAINT FK_facturas_formas_pagos_formas_de_pagos FOREIGN KEY (id_forma_pago)
REFERENCES formas_de_pagos (id_forma_pago)
)

CREATE TABLE CONSULTORIOS
(id_consultorio int,
descripcion varchar (100),
id_clinica int,
CONSTRAINT PK_consultorios PRIMARY KEY (id_consultorio),
CONSTRAINT FK_consultorios_clinicas FOREIGN KEY (id_clinica)
REFERENCES clinicas (id_clinica)
)

CREATE TABLE CONTACTOS	
(id_contacto int,
contacto varchar (150),
id_tipo_contacto int,
id_clinica int,
CONSTRAINT PK_contactos PRIMARY KEY (id_contacto),
CONSTRAINT FK_contactos_tipos_contactos FOREIGN KEY (id_tipo_contacto)
REFERENCES tipos_contactos (id_tipo_contacto),
CONSTRAINT FK_contactos_clinicas FOREIGN KEY (id_clinica)
REFERENCES clinicas (id_clinica)
)

CREATE TABLE OBRAS_SOCIALES_PROCEDIMIENTOS
(id_obra_social_procedimiento int,
id_proc_odontologico int,
id_obra_social int,
porc_cobertura int,
CONSTRAINT PK_obras_sociales_procedimientos PRIMARY KEY (id_obra_social_procedimiento),
CONSTRAINT FK_obras_sociales_procedimientos_procedimientos_odontologicos FOREIGN KEY (id_proc_odontologico)
REFERENCES procedimientos_odontologicos (id_proc_odontologico),
CONSTRAINT FK_obras_sociales_procedimientos_obras_sociales FOREIGN KEY (id_obra_social)
REFERENCES obras_sociales (id_obra_social)
)

CREATE TABLE PACIENTES_PROCEDIMIENTOS_ODONTOLOGICOS
(id_paciente_proc_odontologico int,		
id_paciente int,
id_proc_odontologico int,
fecha date,
costo int,
CONSTRAINT PK_pacientes_procedimientos_odontologicos PRIMARY KEY (id_paciente_proc_odontologico),
CONSTRAINT FK_pacientes_procedimientos_odontologicos_pacientes FOREIGN KEY (id_paciente)
REFERENCES pacientes (id_paciente),
CONSTRAINT FK_pacientes_procedimientos_odontologicos_proce_odontologicos FOREIGN KEY (id_proc_odontologico)
REFERENCES procedimientos_odontologicos (id_proc_odontologico)
)

CREATE TABLE INSTRUMENTOS
(id_instrumento int,
nombre varchar (100),
id_marca int,
id_pais int,
nro_serie varchar (150),
fecha_adquisicion date,
fecha_ult_revision date,
fecha_proxima_revision date,
CONSTRAINT PK_instrumentos PRIMARY KEY (id_instrumento),
CONSTRAINT FK_instrumentos_marcas FOREIGN KEY (id_marca) 
REFERENCES marcas (id_marca),
CONSTRAINT FK_instrumentos_paises FOREIGN KEY (id_pais) 
REFERENCES paises (id_pais)
)


CREATE TABLE INSTRUMENTOS_CONSULTORIOS
(id_instrumento_consultorio int,
id_instrumento int,
nro_dentista int,
id_consultorio int,
CONSTRAINT PK_instrumentos_consultorios PRIMARY KEY (id_instrumento_consultorio),
CONSTRAINT FK_instrumentos_consultorios_instrumentos   FOREIGN KEY (id_instrumento)
REFERENCES instrumentos (id_instrumento),
CONSTRAINT FK_instrumentos_consultorios_dentistas FOREIGN KEY (nro_dentista)
REFERENCES dentistas (nro_dentista),
CONSTRAINT FK_instrumentos_consultorios_consultorios FOREIGN KEY (id_consultorio)
REFERENCES consultorios (id_consultorio)
)

CREATE TABLE MATERIALES
(id_material int,
nombre varchar (100),
id_marca int,
id_pais int,
fecha_vencimiento date,
cantidad int,
CONSTRAINT PK_materiales PRIMARY KEY (id_material),
CONSTRAINT FK_materiales_marcas FOREIGN KEY (id_marca)
REFERENCES marcas (id_marca),
CONSTRAINT FK_materiales_paises FOREIGN KEY (id_pais)
REFERENCES paises (id_pais)
)
CREATE TABLE INVENTARIOS
(id_inventario int,
id_instrumento int,
id_material int,
id_tipo_movimiento int,
fecha date,
cantidad int,
CONSTRAINT PK_inventarios PRIMARY KEY (id_inventario),
CONSTRAINT Fk_inventarios_instrumentos FOREIGN KEY (id_instrumento)
REFERENCES instrumentos (id_instrumento),
CONSTRAINT Fk_inventarios_materiales FOREIGN KEY (id_material)
REFERENCES materiales (id_material),
CONSTRAINT FK_inventarios_tipos_movimientos FOREIGN KEY (id_tipo_movimiento)
REFERENCES tipos_movimientos (id_tipo_movimiento)
)	

CREATE TABLE PROCEDIMIENTOS_X_INSTRUMENTOS
(id_proc_instrumento int,
id_proc_odontologico int,
id_material int,
id_instrumento int,
cantidad int,
CONSTRAINT PK_procedimientos_x_instrumentos PRIMARY KEY (id_proc_instrumento),
CONSTRAINT FK_procedimientos_x_instrumentos_procedimientos_odontologicos FOREIGN KEY (id_proc_odontologico)
REFERENCES procedimientos_odontologicos (id_proc_odontologico),
CONSTRAINT FK_procedimientos_x_instrumentos_materiales  FOREIGN KEY (id_material)
REFERENCES materiales (id_material),
CONSTRAINT FK_procedimientos_x_instrumentos_instrumentos FOREIGN KEY (id_instrumento)
REFERENCES  instrumentos (id_instrumento)
)

CREATE TABLE REPARACIONES
(id_reparacion int,
id_instrumento int,
id_tipo_reparacion int,
costo int,
CONSTRAINT PK_reparaciones PRIMARY KEY (id_reparacion),
CONSTRAINT FK_reparaciones_instrumentos FOREIGN KEY (id_instrumento)
REFERENCES instrumentos (id_instrumento),
CONSTRAINT FK_reparaciones_tipos_reparaciones FOREIGN KEY (id_tipo_reparacion)
REFERENCES tipos_reparaciones (id_tipo_reparacion)
)



-----------------------INSERT DE TODAS LAS TABLAS DE LA BASE DE DATOS  CENTRO_ODONTOLOGICO----------------------------------------------------------------------


--  ------------------------------------------ INSERT DE PAISES

INSERT INTO PAISES (id_pais,descripcion) VALUES(1,'Argentina');
INSERT INTO PAISES (id_pais,descripcion) VALUES(2,'Uruguay');
INSERT INTO PAISES (id_pais,descripcion) VALUES(3,'Brasil');
INSERT INTO PAISES (id_pais,descripcion) VALUES(4,'Chile');
INSERT INTO PAISES (id_pais,descripcion) VALUES(5,'Bolivia');
INSERT INTO PAISES (id_pais,descripcion) VALUES(6,'Colombia');
INSERT INTO PAISES (id_pais,descripcion) VALUES(7,'Paraguay');
INSERT INTO PAISES (id_pais,descripcion) VALUES(8,'Peru');
INSERT INTO PAISES (id_pais,descripcion) VALUES(9,'Ecuador');
INSERT INTO PAISES (id_pais,descripcion) VALUES(10,'Venezuela');
INSERT INTO PAISES (id_pais,descripcion) VALUES(11,'Mexico');
INSERT INTO PAISES (id_pais,descripcion) VALUES(12,'España');
INSERT INTO PAISES (id_pais,descripcion) VALUES(13,'Estados Unidos');
INSERT INTO PAISES (id_pais,descripcion) VALUES(14,'Italia');
INSERT INTO PAISES (id_pais,descripcion) VALUES(15,'Alemania');
INSERT INTO PAISES (id_pais,descripcion) VALUES(16,'Panama');
INSERT INTO PAISES (id_pais,descripcion) VALUES(17,'Guatemala');
INSERT INTO PAISES (id_pais,descripcion) VALUES(18,'Nicaragua');
INSERT INTO PAISES (id_pais,descripcion) VALUES(19,'Costa Rica');
INSERT INTO PAISES (id_pais,descripcion) VALUES(20,'Cuba');
INSERT INTO PAISES (id_pais,descripcion) VALUES(21,'China');




--  ------------------------------------------ INSERT DE PROVINCIAS


INSERT INTO PROVINCIAS (id_provincia,descripcion,id_pais) VALUES(1,'Cordoba',1);
INSERT INTO PROVINCIAS (id_provincia,descripcion,id_pais) VALUES(2,'Buenos Aires',1);
INSERT INTO PROVINCIAS (id_provincia,descripcion,id_pais) VALUES(3,'Catamarca',1);
INSERT INTO PROVINCIAS (id_provincia,descripcion,id_pais) VALUES(4,'Chaco',1);
INSERT INTO PROVINCIAS (id_provincia,descripcion,id_pais) VALUES(5,'Chubut',1);
INSERT INTO PROVINCIAS (id_provincia,descripcion,id_pais) VALUES(6,'Jujuy',1);
INSERT INTO PROVINCIAS (id_provincia,descripcion,id_pais) VALUES(7,'Corrientes',1);
INSERT INTO PROVINCIAS (id_provincia,descripcion,id_pais) VALUES(8,'Entre Rios',1);
INSERT INTO PROVINCIAS (id_provincia,descripcion,id_pais) VALUES(9,'Formosa',1);
INSERT INTO PROVINCIAS (id_provincia,descripcion,id_pais) VALUES(10,'La Pampa',1);
INSERT INTO PROVINCIAS (id_provincia,descripcion,id_pais) VALUES(11,'La Rioja',1);
INSERT INTO PROVINCIAS (id_provincia,descripcion,id_pais) VALUES(12,'Mendoza',1);
INSERT INTO PROVINCIAS (id_provincia,descripcion,id_pais) VALUES(13,'Misiones',1);
INSERT INTO PROVINCIAS (id_provincia,descripcion,id_pais) VALUES(14,'Neuquen',1);
INSERT INTO PROVINCIAS (id_provincia,descripcion,id_pais) VALUES(15,'Rio Negro',1);
INSERT INTO PROVINCIAS (id_provincia,descripcion,id_pais) VALUES(16,'Salta',1);
INSERT INTO PROVINCIAS (id_provincia,descripcion,id_pais) VALUES(17,'San Juan',1);
INSERT INTO PROVINCIAS (id_provincia,descripcion,id_pais) VALUES(18,'San Luis',1);
INSERT INTO PROVINCIAS (id_provincia,descripcion,id_pais) VALUES(19,'Santa Cruz',1);
INSERT INTO PROVINCIAS (id_provincia,descripcion,id_pais) VALUES(20,'Santa Fe',1);
INSERT INTO PROVINCIAS (id_provincia,descripcion,id_pais) VALUES(21,'Santigo Del Estero',1);
INSERT INTO PROVINCIAS (id_provincia,descripcion,id_pais) VALUES(22,'Tierra Del Fuego',1);
INSERT INTO PROVINCIAS (id_provincia,descripcion,id_pais) VALUES(23,'Tucuman',1);
INSERT INTO PROVINCIAS (id_provincia,descripcion,id_pais) VALUES(24,'Montevideo',2);
INSERT INTO PROVINCIAS (id_provincia,descripcion,id_pais) VALUES(25,'Santiago',4);
INSERT INTO PROVINCIAS (id_provincia,descripcion,id_pais) VALUES(26,'Bogota',6);



--  ------------------------------------------ INSERT DE LOCALIDADES


INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(1,'Cordoba',1);
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(2,'Carloz Paz',1);
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(3,'Adelia Maria ',1);
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(4,'Alta Gracia',1);
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(5,'Agua De Oro',1);
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(6,'Agua De Tala',1);
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(7,'Agua Pintada',1);
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(8,'Alejandro Roca',1);
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(9,'Arias',1);
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(10,'Arroyo Cabral',1);
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(11,'Arroyo La Higuera',1);
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(12,'Ascochinga',1);
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(13,'Bajo De Fernandez',1);
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(14,'Bajo Del Carmen',1);
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(15,'Bajo Grande',1);
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(16,'Bajo Hondo',1);
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(17,'Bajo Lindo',1);
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(18,'Barrio Dean Funes',1);
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(19,'Barrio La Feria',1);
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(20,'Bo Flores Guarnicion Aerea',1);
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(21,'Cajon Del Rio',1);
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(22,'Calasuya',1);
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(23,'Campo Bandillo',1);
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(24,'Campo Los Zorroz',1);
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(25,'Candelaria Sur',1);
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(26,'Capilla De Siton',1);
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(27,'Capilla La Esperanza',1);
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(28,'Casas Vejas',1);
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(29,'Caser Este',1);
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(30,'Cañada De Cuevas',1);
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(31,'Cañada Del Tala',1);
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(32,'Cañada verde',1);
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(33,'Cerro Pelado',1);
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(34,'Characato',1);
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(35,'Chañariaco',1);
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(36,'Buenos Aires',2);  
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(37,'Mendoza',12); 
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(38,'Jesus Maria',1);
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(39,'San Juan',17);
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(40,'Villa Maria',1);
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(41,'Santiago',25);  
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(42,'Montevideo',24);  
INSERT INTO LOCALIDADES (id_localidad,descripcion,id_provincia) VALUES(43,'Bogota',26); 



--  ------------------------------------------ INSERT DE BARRIOS



INSERT INTO BARRIOS(id_barrio,descripcion,id_localidad) VALUES (1,'Centro',1);
INSERT INTO BARRIOS(id_barrio,descripcion,id_localidad) VALUES (2,'Alto Alberdi',1);
INSERT INTO BARRIOS(id_barrio,descripcion,id_localidad) VALUES (3,'Engativa',43); 
INSERT INTO BARRIOS(id_barrio,descripcion,id_localidad) VALUES (4,'Jardin',1);
INSERT INTO BARRIOS(id_barrio,descripcion,id_localidad) VALUES (5,'General Paz',1);
INSERT INTO BARRIOS(id_barrio,descripcion,id_localidad) VALUES (6,'Franklin',41);   
INSERT INTO BARRIOS(id_barrio,descripcion,id_localidad) VALUES (7,'La Blanqueada',42); 
INSERT INTO BARRIOS(id_barrio,descripcion,id_localidad) VALUES (8,'Almagro',36); 
INSERT INTO BARRIOS(id_barrio,descripcion,id_localidad) VALUES (9,'San Vicente',1);
INSERT INTO BARRIOS(id_barrio,descripcion,id_localidad) VALUES (10,'Alta Cordoba',1);
INSERT INTO BARRIOS(id_barrio,descripcion,id_localidad) VALUES (11,'Santa Lucia',39);  
INSERT INTO BARRIOS(id_barrio,descripcion,id_localidad) VALUES (12,'Dorrego',37);
INSERT INTO BARRIOS(id_barrio,descripcion,id_localidad) VALUES (13,'Yofre Norte',1);
INSERT INTO BARRIOS(id_barrio,descripcion,id_localidad) VALUES (14,'Ampliacion Residencial America',1);
INSERT INTO BARRIOS(id_barrio,descripcion,id_localidad) VALUES (15,'Arguello',1);
INSERT INTO BARRIOS(id_barrio,descripcion,id_localidad) VALUES (16,'Ayacucho',1);
INSERT INTO BARRIOS(id_barrio,descripcion,id_localidad) VALUES (17,'Las Rosas',2); 
INSERT INTO BARRIOS(id_barrio,descripcion,id_localidad) VALUES (18,'Ferreyra',1);
INSERT INTO BARRIOS(id_barrio,descripcion,id_localidad) VALUES (19,'Malvin',42);   
INSERT INTO BARRIOS(id_barrio,descripcion,id_localidad) VALUES (20,'Patricios',1);



--  ------------------------------------------ INSERT DE TIPOS DE DOCUMENTOS

INSERT INTO TIPOS_DOCUMENTOS (id_tipo_doc, descripcion) VALUES(1,'DNI');
INSERT INTO TIPOS_DOCUMENTOS (id_tipo_doc, descripcion) VALUES(2,'Pasaporte');
INSERT INTO TIPOS_DOCUMENTOS (id_tipo_doc, descripcion) VALUES(3,'Libreta Civica');
INSERT INTO TIPOS_DOCUMENTOS (id_tipo_doc, descripcion) VALUES(4,'Libreta Enrolamiento');
INSERT INTO TIPOS_DOCUMENTOS (id_tipo_doc, descripcion) VALUES(5,'Carnet de Conducir');
INSERT INTO TIPOS_DOCUMENTOS (id_tipo_doc, descripcion) VALUES(6,'Cuil');
INSERT INTO TIPOS_DOCUMENTOS (id_tipo_doc, descripcion) VALUES(7,'Cuit');



--  ------------------------------------------ INSERT DE OBRAS SOCIALES


INSERT INTO OBRAS_SOCIALES(id_obra_social,nombre) VALUES(1,'Nobis');
INSERT INTO OBRAS_SOCIALES(id_obra_social,nombre) VALUES(2,'Sipssa');
INSERT INTO OBRAS_SOCIALES(id_obra_social,nombre) VALUES(3,'Gea');
INSERT INTO OBRAS_SOCIALES(id_obra_social,nombre) VALUES(4,'Prosalud');
INSERT INTO OBRAS_SOCIALES(id_obra_social,nombre) VALUES(5,'Osde');
INSERT INTO OBRAS_SOCIALES(id_obra_social,nombre) VALUES(6,'Ospe');
INSERT INTO OBRAS_SOCIALES(id_obra_social,nombre) VALUES(7,'Osmedica');
INSERT INTO OBRAS_SOCIALES(id_obra_social,nombre) VALUES(8,'Oschoca');
INSERT INTO OBRAS_SOCIALES(id_obra_social,nombre) VALUES(9,'Medife');
INSERT INTO OBRAS_SOCIALES(id_obra_social,nombre) VALUES(10,'Omint');
INSERT INTO OBRAS_SOCIALES(id_obra_social,nombre) VALUES(11,'Swiss Medical');
INSERT INTO OBRAS_SOCIALES(id_obra_social,nombre) VALUES(12,'Sancor Salud');
INSERT INTO OBRAS_SOCIALES(id_obra_social,nombre) VALUES(13,'Osplad');
INSERT INTO OBRAS_SOCIALES(id_obra_social,nombre) VALUES(14,'Prevencion Salud');
INSERT INTO OBRAS_SOCIALES(id_obra_social,nombre) VALUES(15,'Cemic');
INSERT INTO OBRAS_SOCIALES(id_obra_social,nombre) VALUES(16,'Avalian');
INSERT INTO OBRAS_SOCIALES(id_obra_social,nombre) VALUES(17,'Premedic');
INSERT INTO OBRAS_SOCIALES(id_obra_social,nombre) VALUES(18,'Ensalud');
INSERT INTO OBRAS_SOCIALES(id_obra_social,nombre) VALUES(19,'Accord Salud');
INSERT INTO OBRAS_SOCIALES(id_obra_social,nombre) VALUES(20,'Pami');



--  ------------------------------------------ INSERT DE TIPOS DE MOVIMIENTOS



INSERT INTO TIPOS_MOVIMIENTOS(id_tipo_movimiento, descripcion)VALUES(1,'Entrada');
INSERT INTO TIPOS_MOVIMIENTOS(id_tipo_movimiento, descripcion)VALUES(2,'Salida');
INSERT INTO TIPOS_MOVIMIENTOS(id_tipo_movimiento, descripcion)VALUES(3,'Reparacion');



--  ------------------------------------------ INSERT DE PROCEDIMIENTOS ODONTOLOGICOS


INSERT INTO PROCEDIMIENTOS_ODONTOLOGICOS (id_proc_odontologico,nombre,precio)VALUES(1,'Frenos Dentales',200000);
INSERT INTO PROCEDIMIENTOS_ODONTOLOGICOS (id_proc_odontologico,nombre,precio)VALUES(2,'Puentes e Implantes',95000);
INSERT INTO PROCEDIMIENTOS_ODONTOLOGICOS (id_proc_odontologico,nombre,precio)VALUES(3,'Coronas',32000);
INSERT INTO PROCEDIMIENTOS_ODONTOLOGICOS (id_proc_odontologico,nombre,precio)VALUES(4,'Extracciones',19000);
INSERT INTO PROCEDIMIENTOS_ODONTOLOGICOS (id_proc_odontologico,nombre,precio)VALUES(5,'Carrillas Dentales',120000);
INSERT INTO PROCEDIMIENTOS_ODONTOLOGICOS (id_proc_odontologico,nombre,precio)VALUES(6,'Protesis Dental',86000);
INSERT INTO PROCEDIMIENTOS_ODONTOLOGICOS (id_proc_odontologico,nombre,precio)VALUES(7,'Empastes y Reparaciones',150000);
INSERT INTO PROCEDIMIENTOS_ODONTOLOGICOS (id_proc_odontologico,nombre,precio)VALUES(8,'Cirugia de las Encias',70000);
INSERT INTO PROCEDIMIENTOS_ODONTOLOGICOS (id_proc_odontologico,nombre,precio)VALUES(9,'Selladores',40000);
INSERT INTO PROCEDIMIENTOS_ODONTOLOGICOS (id_proc_odontologico,nombre,precio)VALUES(10,'Blanqueamiento Dental',20000);
INSERT INTO PROCEDIMIENTOS_ODONTOLOGICOS (id_proc_odontologico,nombre,precio)VALUES(11,'Obturacion',18000);
INSERT INTO PROCEDIMIENTOS_ODONTOLOGICOS (id_proc_odontologico,nombre,precio)VALUES(12,'Dentaduras Removibles',55000);
INSERT INTO PROCEDIMIENTOS_ODONTOLOGICOS (id_proc_odontologico,nombre,precio)VALUES(13,'Fisioterapia Oral',60000);
INSERT INTO PROCEDIMIENTOS_ODONTOLOGICOS (id_proc_odontologico,nombre,precio)VALUES(14,'Cirugia bucal Ambulatoria',90000);
INSERT INTO PROCEDIMIENTOS_ODONTOLOGICOS (id_proc_odontologico,nombre,precio)VALUES(15,'Reconstruccion e Injerto de Hueso Bucal ',100000);


--  ------------------------------------------ INSERT DE FORMAS DE PAGOS



INSERT INTO FORMAS_DE_PAGOS (id_forma_pago, descripcion,recargo) VALUES(1,'Efectivo',0);
INSERT INTO FORMAS_DE_PAGOS (id_forma_pago, descripcion,recargo) VALUES(2,'Transferencia',0);
INSERT INTO FORMAS_DE_PAGOS (id_forma_pago, descripcion,recargo) VALUES(3,'Tarjeta Credito',15);
INSERT INTO FORMAS_DE_PAGOS (id_forma_pago, descripcion,recargo) VALUES(4,'Tarjeta Debito',5);
INSERT INTO FORMAS_DE_PAGOS (id_forma_pago, descripcion,recargo) VALUES(5,'Marcado Pago',10);


--  ------------------------------------------ INSERT DE TIPOS CONTACTOS


INSERT INTO  TIPOS_CONTACTOS (id_tipo_contacto,tipo_contacto)VALUES(1,'Teléfono');
INSERT INTO  TIPOS_CONTACTOS (id_tipo_contacto,tipo_contacto)VALUES(2,'Correo Electronico');
INSERT INTO  TIPOS_CONTACTOS (id_tipo_contacto,tipo_contacto)VALUES(3,'Instagram');
INSERT INTO  TIPOS_CONTACTOS (id_tipo_contacto,tipo_contacto)VALUES(4,'WhatsApp');
INSERT INTO  TIPOS_CONTACTOS (id_tipo_contacto,tipo_contacto)VALUES(5,'Twitter');
INSERT INTO  TIPOS_CONTACTOS (id_tipo_contacto,tipo_contacto)VALUES(6,'Facebook');
INSERT INTO  TIPOS_CONTACTOS (id_tipo_contacto,tipo_contacto)VALUES(7,'Mensaje Comun');
INSERT INTO  TIPOS_CONTACTOS (id_tipo_contacto,tipo_contacto)VALUES(8,'Telegram');



--  ------------------------------------------ INSERT DE ESPECIALIDADES

INSERT INTO ESPECIALIDADES (id_especialidad,descripcion)VALUES(1,'Dentista General');
INSERT INTO ESPECIALIDADES (id_especialidad,descripcion)VALUES(2,'Odontopediatria');
INSERT INTO ESPECIALIDADES (id_especialidad,descripcion)VALUES(3,'Ortodoncia');  
INSERT INTO ESPECIALIDADES (id_especialidad,descripcion)VALUES(4,'Periodoncista');
INSERT INTO ESPECIALIDADES (id_especialidad,descripcion)VALUES(5,'Endoncista');
INSERT INTO ESPECIALIDADES (id_especialidad,descripcion)VALUES(6,'Patologia Dental');
INSERT INTO ESPECIALIDADES (id_especialidad,descripcion)VALUES(7,'Protodoncista');
INSERT INTO ESPECIALIDADES (id_especialidad,descripcion)VALUES(8,'Cirujano Maxilofacial');
INSERT INTO ESPECIALIDADES (id_especialidad,descripcion)VALUES(9,'Rehabilitacion Oral');
INSERT INTO ESPECIALIDADES (id_especialidad,descripcion)VALUES(10,'Implantologia');


--  ------------------------------------------ INSERT DE MARCAS



INSERT INTO MARCAS (id_marca ,marca)VALUES(1,'Dental X');
INSERT INTO MARCAS (id_marca ,marca)VALUES(2,'Oxy Instruments');
INSERT INTO MARCAS (id_marca ,marca)VALUES(3,'Tecno Dental');
INSERT INTO MARCAS (id_marca ,marca)VALUES(4,'Komed');
INSERT INTO MARCAS (id_marca ,marca)VALUES(5,'Novaplus');
INSERT INTO MARCAS (id_marca ,marca)VALUES(6,'Ordisi');
INSERT INTO MARCAS (id_marca ,marca)VALUES(7,'Hu-Friedy');
INSERT INTO MARCAS (id_marca ,marca)VALUES(8,'Kerr');
INSERT INTO MARCAS (id_marca ,marca)VALUES(9,'Dentsply Sirona');
INSERT INTO MARCAS (id_marca ,marca)VALUES(10,'Coltene');
INSERT INTO MARCAS (id_marca ,marca)VALUES(11,'Carl Martin');
INSERT INTO MARCAS (id_marca ,marca)VALUES(12,'Paradise Dental Technologies');
INSERT INTO MARCAS (id_marca ,marca)VALUES(13,'Premier Dental');
INSERT INTO MARCAS (id_marca ,marca)VALUES(14,'Septodont');
INSERT INTO MARCAS (id_marca ,marca)VALUES(15,'NSK');
INSERT INTO MARCAS (id_marca ,marca)VALUES(16,'W&H');
INSERT INTO MARCAS (id_marca ,marca)VALUES(17,'Satelec');
INSERT INTO MARCAS (id_marca ,marca)VALUES(18,'LM-Dental');
INSERT INTO MARCAS (id_marca ,marca)VALUES(19,'Ultradent');
INSERT INTO MARCAS (id_marca ,marca)VALUES(20,'GC Corporation');
INSERT INTO MARCAS (id_marca ,marca)VALUES(21,'3M ESPE');
INSERT INTO MARCAS (id_marca ,marca)VALUES(22,'KaVo');
INSERT INTO MARCAS (id_marca ,marca)VALUES(23,'Ivoclar Vivadent');
INSERT INTO MARCAS (id_marca ,marca)VALUES(24,'Medesy');
INSERT INTO MARCAS (id_marca ,marca)VALUES(25,'Zhermack');
INSERT INTO MARCAS (id_marca ,marca)VALUES(26,'Woodpecker');



--  ------------------------------------------ INSERT DE TIPOS DE REPARACIONES


INSERT INTO TIPOS_REPARACIONES(id_tipo_reparacion,descripcion)VALUES(1,'Reemplazo de una pieza');
INSERT INTO TIPOS_REPARACIONES(id_tipo_reparacion,descripcion)VALUES(2,'Afilado de una pieza');
INSERT INTO TIPOS_REPARACIONES(id_tipo_reparacion,descripcion)VALUES(3,'Reparación de un cable');
INSERT INTO TIPOS_REPARACIONES(id_tipo_reparacion,descripcion)VALUES(4,'Reparación de grieta o fractura');
INSERT INTO TIPOS_REPARACIONES(id_tipo_reparacion,descripcion)VALUES(5,'Reajuste y lubricación de mecanismos');
INSERT INTO TIPOS_REPARACIONES(id_tipo_reparacion,descripcion)VALUES(6,'Cambio de bateria');
INSERT INTO TIPOS_REPARACIONES(id_tipo_reparacion,descripcion)VALUES(7,'Calibración y ajuste');
INSERT INTO TIPOS_REPARACIONES(id_tipo_reparacion,descripcion)VALUES(8,'Mantenimiento y limpieza general');
INSERT INTO TIPOS_REPARACIONES(id_tipo_reparacion,descripcion)VALUES(9,'Cambio de jeringa');
INSERT INTO TIPOS_REPARACIONES(id_tipo_reparacion,descripcion)VALUES(10,'Reemplazo de puntas desgastadas');
INSERT INTO TIPOS_REPARACIONES(id_tipo_reparacion,descripcion)VALUES(11,'Cambio de espejo');
INSERT INTO TIPOS_REPARACIONES(id_tipo_reparacion,descripcion)VALUES(12,'Cambio de motor');


--  ------------------------------------------ INSERT DE PACIENTES



INSERT INTO PACIENTES (id_paciente,nombre,apellido,nro_telefono,fecha_nacimiento,nro_documento,email,calle,altura,id_tipo_doc,id_barrio,id_obra_social)VALUES(1,'Valentina','Rosa',351511975 ,'2000-05-18',42648536,'valentinarosa@gmail.com','25 de Mayo', 458,1,1,2);
INSERT INTO PACIENTES (id_paciente,nombre,apellido,nro_telefono,fecha_nacimiento,nro_documento,email,calle,altura,id_tipo_doc,id_barrio,id_obra_social)VALUES(2,'Juan Fernando','Perez',351186591,'1985-06-12',31217340  ,'juanfernandoperez@gmail.com','Colon', 1689,1,1,4);
INSERT INTO PACIENTES (id_paciente,nombre,apellido,nro_telefono,fecha_nacimiento,nro_documento,email,calle,altura,id_tipo_doc,id_barrio,id_obra_social)VALUES(3,'Martin', 'Acosta',351685987,'1980-02-23',29008452,'martinacosta@gmail.com' ,'Velez' ,987 ,1 ,2,9);
INSERT INTO PACIENTES (id_paciente,nombre,apellido,nro_telefono,fecha_nacimiento,nro_documento,email,calle,altura,id_tipo_doc,id_barrio,id_obra_social)VALUES(4,'Oscar','Martinez',351563254 ,'1975-10-07' ,23855204 ,'oscarmartinez@gmail.com','Isabella Catolica',347 ,1 ,10 ,11);
INSERT INTO PACIENTES (id_paciente,nombre,apellido,nro_telefono,fecha_nacimiento,nro_documento,email,calle,altura,id_tipo_doc,id_barrio,id_obra_social)VALUES(5,'Maria' ,'Del Carmen',351252643,'1986-08-08' ,33599332 ,'mariadelcarmen86@gmail.com','Oncativo',729 ,1 ,5 ,8 );
INSERT INTO PACIENTES (id_paciente,nombre,apellido,nro_telefono,fecha_nacimiento,nro_documento,email,calle,altura,id_tipo_doc,id_barrio,id_obra_social)VALUES(6,'Antonio','Garcia',351321578,'1969-07-15' ,18174804 ,'antoniogarcia@gmail.com','Entre Rios',325,1,9,7);
INSERT INTO PACIENTES (id_paciente,nombre,apellido,nro_telefono,fecha_nacimiento,nro_documento,email,calle,altura,id_tipo_doc,id_barrio,id_obra_social)VALUES(7,'Mirtha Batriz','Dunaevsky',351529691,'1951-01-06',6789246,'mirtabeatrizdunaevsky@gmail.com','Joaquin Montaña',849,1,14,20 );
INSERT INTO PACIENTES (id_paciente,nombre,apellido,nro_telefono,fecha_nacimiento,nro_documento,email,calle,altura,id_tipo_doc,id_barrio,id_obra_social)VALUES(8,'Pedro','Molina',351529771, '1990-12-17',34715384,'pedromolina@gmail.com','Arturo Cabdevila',1697,1,16,2);
INSERT INTO PACIENTES (id_paciente,nombre,apellido,nro_telefono,fecha_nacimiento,nro_documento,email,calle,altura,id_tipo_doc,id_barrio,id_obra_social)VALUES(9,'Jose','Sanchez',351516189,'2002-04-19',43450682,'josesanchez02@gmail.com','La Salle',1298,1,15,11 );
INSERT INTO PACIENTES (id_paciente,nombre,apellido,nro_telefono,fecha_nacimiento,nro_documento,email,calle,altura,id_tipo_doc,id_barrio,id_obra_social)VALUES(10,'Marcelo','Tejeda',351465132,'1984-09-12',30470032,'mtejeda@gmail.com','Don Bosco',889,1,8,15 );
INSERT INTO PACIENTES (id_paciente,nombre,apellido,nro_telefono,fecha_nacimiento,nro_documento,email,calle,altura,id_tipo_doc,id_barrio,id_obra_social)VALUES(11,'Federico','Arias',351782694,'1992-09-20',37635206,'federicoarias@gmail.com','Los Pinos',96,1,17,11);
INSERT INTO PACIENTES (id_paciente,nombre,apellido,nro_telefono,fecha_nacimiento,nro_documento,email,calle,altura,id_tipo_doc,id_barrio,id_obra_social)VALUES(12,'Alejandro','Miro',264458525,'1963-02-11',14693198,'alejandromiro@gmail.com','San Francisco',1238,1,11,14);
INSERT INTO PACIENTES (id_paciente,nombre,apellido,nro_telefono,fecha_nacimiento,nro_documento,email,calle,altura,id_tipo_doc,id_barrio,id_obra_social)VALUES(13,'Malena','Acevedo',261846353,'2001-05-14',43429150,'malenaacevedo@gmail.com','French',987,1,12,19);
INSERT INTO PACIENTES (id_paciente,nombre,apellido,nro_telefono,fecha_nacimiento,nro_documento,email,calle,altura,id_tipo_doc,id_barrio,id_obra_social)VALUES(14,'Juan Carlos','Del Rio',351612145,'1960-03-28',14501769,'juancarlosdelrio@gmail.com','Wilson',1964,1,13,20);
INSERT INTO PACIENTES (id_paciente,nombre,apellido,nro_telefono,fecha_nacimiento,nro_documento,email,calle,altura,id_tipo_doc,id_barrio,id_obra_social)VALUES(15,'Emilio','Rodriguez',301235896 ,'1981-08-27',4748562,'emiliorodriguez@gmail.com','Carrera 86',82,2,3,15);
INSERT INTO PACIENTES (id_paciente,nombre,apellido,nro_telefono,fecha_nacimiento,nro_documento,email,calle,altura,id_tipo_doc,id_barrio,id_obra_social)VALUES(16,'Alberto','Placeres',351803657,'1978-10-04',26498528,'albertoplaceres@gmail.com','Juan de Alagon',532,1,18,13);
INSERT INTO PACIENTES (id_paciente,nombre,apellido,nro_telefono,fecha_nacimiento,nro_documento,email,calle,altura,id_tipo_doc,id_barrio,id_obra_social)VALUES(17, 'Diego','Di Ciariaco',262883276,'1974-07-09',15168142,'diegodiciriaco@gmail.com','Verdi',416,2,19,10);
INSERT INTO PACIENTES (id_paciente,nombre,apellido,nro_telefono,fecha_nacimiento,nro_documento,email,calle,altura,id_tipo_doc,id_barrio,id_obra_social)VALUES(18,'Rocio','Gomez',220451995,'2003-05-01',12127046,'rociogomez@gmail.com','Mariano Moreno',758,2,7,12);
INSERT INTO PACIENTES (id_paciente,nombre,apellido,nro_telefono,fecha_nacimiento,nro_documento,email,calle,altura,id_tipo_doc,id_barrio,id_obra_social)VALUES(19,'Laura','Diaz',620994863,'1193-06-18',2325698,'lauradiaz@gmail.com','Arauco',548,2,6,18);
INSERT INTO PACIENTES (id_paciente,nombre,apellido,nro_telefono,fecha_nacimiento,nro_documento,email,calle,altura,id_tipo_doc,id_barrio,id_obra_social)VALUES(20,'Cristian','Saez',351206497,'2006-10-07',45524328,'cristiansaez49@gmail.com','Juan de Dios',421,1,18,11 );




--  ------------------------------------------ INSERT DE DENTISTAS


INSERT INTO DENTISTAS(nro_dentista,nombre,apellido,id_tipo_doc,nro_documento,nro_telefono,id_especialidad,nro_matricula,email )VALUES(1,'Carlos','Raul',1,16254836,351511975,1,'MO96947','carlosruiz@gmail.com');
INSERT INTO DENTISTAS(nro_dentista,nombre,apellido,id_tipo_doc,nro_documento,nro_telefono,id_especialidad,nro_matricula,email )VALUES(2,'Javier','Hernandez',1,24120296,351514183,2,'MO96948','javierhernandez@gmail.com');
INSERT INTO DENTISTAS(nro_dentista,nombre,apellido,id_tipo_doc,nro_documento,nro_telefono,id_especialidad,nro_matricula,email )VALUES(3,'Jorge','Blazquez',1,20359647,35129775,3,'MO96949','jorgeblazquez@gmail.com');
INSERT INTO DENTISTAS(nro_dentista,nombre,apellido,id_tipo_doc,nro_documento,nro_telefono,id_especialidad,nro_matricula,email )VALUES(4,'Adrian','Pardo',1,18947852,351135684,9,'MO96950','adrianpardo@gmail.com');
INSERT INTO DENTISTAS(nro_dentista,nombre,apellido,id_tipo_doc,nro_documento,nro_telefono,id_especialidad,nro_matricula,email )VALUES(5,'Ruben','Moya',1,25168495,351299376,4,'MO96951','rubenmoya@gmail.com');
INSERT INTO DENTISTAS(nro_dentista,nombre,apellido,id_tipo_doc,nro_documento,nro_telefono,id_especialidad,nro_matricula,email )VALUES(6,'Juan Manuel','Arenas',1,17426863,351915652,10,'MO96952','juanmanuelarenas@gmail.com');
INSERT INTO DENTISTAS(nro_dentista,nombre,apellido,id_tipo_doc,nro_documento,nro_telefono,id_especialidad,nro_matricula,email )VALUES(7,'Andrea','Castillo',1,28576954,351363387,7,'MO96953','andreacastillo@gmail.com');
INSERT INTO DENTISTAS(nro_dentista,nombre,apellido,id_tipo_doc,nro_documento,nro_telefono,id_especialidad,nro_matricula,email )VALUES(8,'Juana','Alfaro',1,32689231,351298364,3,'MO96954','juanaalfaro@gmail.com');
INSERT INTO DENTISTAS(nro_dentista,nombre,apellido,id_tipo_doc,nro_documento,nro_telefono,id_especialidad,nro_matricula,email )VALUES(9,'Marta','Picazo',1,30665298,351376248,3,'MO96955','martapicazo@gmail.com');
INSERT INTO DENTISTAS(nro_dentista,nombre,apellido,id_tipo_doc,nro_documento,nro_telefono,id_especialidad,nro_matricula,email )VALUES(10,'Raquel','Alvarez',1,14387692,351238754,4,'MO96956','raquelalvarez@gmail.com');
INSERT INTO DENTISTAS(nro_dentista,nombre,apellido,id_tipo_doc,nro_documento,nro_telefono,id_especialidad,nro_matricula,email )VALUES(11,'Ana Maria','Muñoz',1,16587695,351699524,3,'MO96957', 'anamariamuñoz@gmail.com');
INSERT INTO DENTISTAS(nro_dentista,nombre,apellido,id_tipo_doc,nro_documento,nro_telefono,id_especialidad,nro_matricula,email )VALUES(12,'Agustin','Cortes',1,23289654,351496258,1,'MO96958','agustincortes@gmail.com');
INSERT INTO DENTISTAS(nro_dentista,nombre,apellido,id_tipo_doc,nro_documento,nro_telefono,id_especialidad,nro_matricula,email )VALUES(13,'Gustavo ','Alvizo',1,26543922,351757684,6,'MO96959','gustavoalvizo@gmail.com');
INSERT INTO DENTISTAS(nro_dentista,nombre,apellido,id_tipo_doc,nro_documento,nro_telefono,id_especialidad,nro_matricula,email )VALUES(14,'Javier','Milei',1,21834641,351696524,5,'MO96960','javiermilei@gmail.com');
INSERT INTO DENTISTAS(nro_dentista,nombre,apellido,id_tipo_doc,nro_documento,nro_telefono,id_especialidad,nro_matricula,email )VALUES(15,'Jorge Luis ','Navarro',1,18256489,351458939,10,'MO96961','joseluisnavarro@gmail.com');
INSERT INTO DENTISTAS(nro_dentista,nombre,apellido,id_tipo_doc,nro_documento,nro_telefono,id_especialidad,nro_matricula,email )VALUES(16,'Gonzalo ','Tolosa',1,14369951,351463215,2,'MO96962','gonzalotoloza@gmail.com');
INSERT INTO DENTISTAS(nro_dentista,nombre,apellido,id_tipo_doc,nro_documento,nro_telefono,id_especialidad,nro_matricula,email )VALUES(17,'Maria  Dolores','Gonzalez',1,22579865,351625423,6,'MO96963','mariadoloresgonzalez@gmail.com');
INSERT INTO DENTISTAS(nro_dentista,nombre,apellido,id_tipo_doc,nro_documento,nro_telefono,id_especialidad,nro_matricula,email )VALUES(18,'Nicolas','Quiroga',1,28659325,351358656,8,'MO96964','nicolasquiroga@gmail.com');
INSERT INTO DENTISTAS(nro_dentista,nombre,apellido,id_tipo_doc,nro_documento,nro_telefono,id_especialidad,nro_matricula,email )VALUES(19,'Vanesa','Del Valle',1,29554632,351029658,5,'MO96965','vanesadelvalle@gmail.com');
INSERT INTO DENTISTAS(nro_dentista,nombre,apellido,id_tipo_doc,nro_documento,nro_telefono,id_especialidad,nro_matricula,email )VALUES(20,'Walter','Enriquez',1,23789143,351626359,8,'MO96966','walterenriquez@gmail.com');



--  ------------------------------------------ INSERT DE LA CLINICA



 INSERT INTO CLINICAS(id_clinica,nombre,altura,calle,hora_apertura,hora_cierre,id_barrio)VALUES (1,'Clinica Delntal LL',1566,'Mariano Fragueiro','8:00','20:30',10);



--  ------------------------------------------ INSERT DE FACTURAS



INSERT INTO FACTURAS(nro_factura,fecha,id_clinica,id_paciente,nro_dentista)VALUES(1,'2016-10-02',1,1,1);
 INSERT INTO FACTURAS(nro_factura,fecha,id_clinica,id_paciente,nro_dentista)VALUES(2,'2016-11-18',1,2,2);
 INSERT INTO FACTURAS(nro_factura,fecha,id_clinica,id_paciente,nro_dentista)VALUES(3,'2017-06-24',1,3,3);
 INSERT INTO FACTURAS(nro_factura,fecha,id_clinica,id_paciente,nro_dentista)VALUES(4,'2018-09-06',1,4,4);
 INSERT INTO FACTURAS(nro_factura,fecha,id_clinica,id_paciente,nro_dentista)VALUES(5,'2018-10-16',1,5,5);
 INSERT INTO FACTURAS(nro_factura,fecha,id_clinica,id_paciente,nro_dentista)VALUES(6,'2017-12-12',1,6,6);
 INSERT INTO FACTURAS(nro_factura,fecha,id_clinica,id_paciente,nro_dentista)VALUES(7,'2017-02-28',1,7,7);
 INSERT INTO FACTURAS(nro_factura,fecha,id_clinica,id_paciente,nro_dentista)VALUES(8,'2019-10-30',1,8,8);
 INSERT INTO FACTURAS(nro_factura,fecha,id_clinica,id_paciente,nro_dentista)VALUES(9,'2020-07-15',1,9,9);
 INSERT INTO FACTURAS(nro_factura,fecha,id_clinica,id_paciente,nro_dentista)VALUES(10,'2021-09-21',1,10,10);
 INSERT INTO FACTURAS(nro_factura,fecha,id_clinica,id_paciente,nro_dentista)VALUES(11,'2020-03-15',1,11,11);
 INSERT INTO FACTURAS(nro_factura,fecha,id_clinica,id_paciente,nro_dentista)VALUES(12,'2020-07-11',1,12,12);
 INSERT INTO FACTURAS(nro_factura,fecha,id_clinica,id_paciente,nro_dentista)VALUES(13,'2017-08-19',1,13,13);
 INSERT INTO FACTURAS(nro_factura,fecha,id_clinica,id_paciente,nro_dentista)VALUES(14,'2018-06-24',1,14,14);
 INSERT INTO FACTURAS(nro_factura,fecha,id_clinica,id_paciente,nro_dentista)VALUES(15,'2018-02-22',1,15,15);
 INSERT INTO FACTURAS(nro_factura,fecha,id_clinica,id_paciente,nro_dentista)VALUES(16,'2016-12-27',1,16,16);
 INSERT INTO FACTURAS(nro_factura,fecha,id_clinica,id_paciente,nro_dentista)VALUES(17,'2019-08-22',1,17,17);
 INSERT INTO FACTURAS(nro_factura,fecha,id_clinica,id_paciente,nro_dentista)VALUES(18,'2019-05-21',1,18,1);
 INSERT INTO FACTURAS(nro_factura,fecha,id_clinica,id_paciente,nro_dentista)VALUES(19,'2019-09-23',1,19,4);
 INSERT INTO FACTURAS(nro_factura,fecha,id_clinica,id_paciente,nro_dentista)VALUES(20,'2021-03-17',1,20,2);
 INSERT INTO FACTURAS(nro_factura,fecha,id_clinica,id_paciente,nro_dentista)VALUES(21,'2023-04-15',1,15,9);
 INSERT INTO FACTURAS(nro_factura,fecha,id_clinica,id_paciente,nro_dentista)VALUES(22,'2023-03-21',1,17,10);
 INSERT INTO FACTURAS(nro_factura,fecha,id_clinica,id_paciente,nro_dentista)VALUES(23,'2023-02-14',1,14,14);
 INSERT INTO FACTURAS(nro_factura,fecha,id_clinica,id_paciente,nro_dentista)VALUES(24,'2022-10-05',1,11,15);
 INSERT INTO FACTURAS(nro_factura,fecha,id_clinica,id_paciente,nro_dentista)VALUES(25,'2022-11-10',1,8,17);
 INSERT INTO FACTURAS(nro_factura,fecha,id_clinica,id_paciente,nro_dentista)VALUES(26,'2022-09-09',1,6,3);
 INSERT INTO FACTURAS(nro_factura,fecha,id_clinica,id_paciente,nro_dentista)VALUES(27,'2022-08-01',1,9,6);
 INSERT INTO FACTURAS(nro_factura,fecha,id_clinica,id_paciente,nro_dentista)VALUES(28,'2023-06-01',1,7,5);
 INSERT INTO FACTURAS(nro_factura,fecha,id_clinica,id_paciente,nro_dentista)VALUES(29,'2023-04-24',1,3,7);
 INSERT INTO FACTURAS(nro_factura,fecha,id_clinica,id_paciente,nro_dentista)VALUES(30,'2022-07-07',1,1,8);



--  ------------------------------------------ INSERT DE DETALLES FACTURAS



 INSERT INTO DETALLE_FACTURAS(id_detalle_factura,nro_factura,id_proc_odontologico,precio)VALUES(1,1,1,55000);
 INSERT INTO DETALLE_FACTURAS(id_detalle_factura,nro_factura,id_proc_odontologico,precio)VALUES(2,2,1,55000);
 INSERT INTO DETALLE_FACTURAS(id_detalle_factura,nro_factura,id_proc_odontologico,precio)VALUES(3,3,10,9500);
 INSERT INTO DETALLE_FACTURAS(id_detalle_factura,nro_factura,id_proc_odontologico,precio)VALUES(4,4,4,6000);
 INSERT INTO DETALLE_FACTURAS(id_detalle_factura,nro_factura,id_proc_odontologico,precio)VALUES(5,5,3,21000);
 INSERT INTO DETALLE_FACTURAS(id_detalle_factura,nro_factura,id_proc_odontologico,precio)VALUES(6,6,2,60550);
 INSERT INTO DETALLE_FACTURAS(id_detalle_factura,nro_factura,id_proc_odontologico,precio)VALUES(7,7,7,115000);
 INSERT INTO DETALLE_FACTURAS(id_detalle_factura,nro_factura,id_proc_odontologico,precio)VALUES(8,8,6,75400);
 INSERT INTO DETALLE_FACTURAS(id_detalle_factura,nro_factura,id_proc_odontologico,precio)VALUES(9,9,11,37900);
 INSERT INTO DETALLE_FACTURAS(id_detalle_factura,nro_factura,id_proc_odontologico,precio)VALUES(10,10,14,77800);
 INSERT INTO DETALLE_FACTURAS(id_detalle_factura,nro_factura,id_proc_odontologico,precio)VALUES(11,11,10,13500);
 INSERT INTO DETALLE_FACTURAS(id_detalle_factura,nro_factura,id_proc_odontologico,precio)VALUES(12,12,1,180000);
 INSERT INTO DETALLE_FACTURAS(id_detalle_factura,nro_factura,id_proc_odontologico,precio)VALUES(13,13,10,9500);
 INSERT INTO DETALLE_FACTURAS(id_detalle_factura,nro_factura,id_proc_odontologico,precio)VALUES(14,14,10,11600);
 INSERT INTO DETALLE_FACTURAS(id_detalle_factura,nro_factura,id_proc_odontologico,precio)VALUES(15,15,1,150000);
 INSERT INTO DETALLE_FACTURAS(id_detalle_factura,nro_factura,id_proc_odontologico,precio)VALUES(16,16,8,21000);
 INSERT INTO DETALLE_FACTURAS(id_detalle_factura,nro_factura,id_proc_odontologico,precio)VALUES(17,17,10,12200);
 INSERT INTO DETALLE_FACTURAS(id_detalle_factura,nro_factura,id_proc_odontologico,precio)VALUES(18,18,12,33000);
 INSERT INTO DETALLE_FACTURAS(id_detalle_factura,nro_factura,id_proc_odontologico,precio)VALUES(19,19,9,18700);
 INSERT INTO DETALLE_FACTURAS(id_detalle_factura,nro_factura,id_proc_odontologico,precio)VALUES(20,20,15,75000);
 INSERT INTO DETALLE_FACTURAS(id_detalle_factura,nro_factura,id_proc_odontologico,precio)VALUES(21,21,14,90000);
 INSERT INTO DETALLE_FACTURAS(id_detalle_factura,nro_factura,id_proc_odontologico,precio)VALUES(22,22,13,60000);
 INSERT INTO DETALLE_FACTURAS(id_detalle_factura,nro_factura,id_proc_odontologico,precio)VALUES(23,23,4,15000);
 INSERT INTO DETALLE_FACTURAS(id_detalle_factura,nro_factura,id_proc_odontologico,precio)VALUES(24,24,4,13000);
 INSERT INTO DETALLE_FACTURAS(id_detalle_factura,nro_factura,id_proc_odontologico,precio)VALUES(25,25,6,79500);
 INSERT INTO DETALLE_FACTURAS(id_detalle_factura,nro_factura,id_proc_odontologico,precio)VALUES(26,26,8,65000);
 INSERT INTO DETALLE_FACTURAS(id_detalle_factura,nro_factura,id_proc_odontologico,precio)VALUES(27,27,3,27800);
 INSERT INTO DETALLE_FACTURAS(id_detalle_factura,nro_factura,id_proc_odontologico,precio)VALUES(28,28,5,120000);
 INSERT INTO DETALLE_FACTURAS(id_detalle_factura,nro_factura,id_proc_odontologico,precio)VALUES(29,29,4,15000);
 INSERT INTO DETALLE_FACTURAS(id_detalle_factura,nro_factura,id_proc_odontologico,precio)VALUES(30,30,10,18250);
 

--  ------------------------------------------ INSERT DE FACTURAS FORMAS DE PAGOS


INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(1,1,1,30000);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(2,2,1,30000);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(3,3,1,9500);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(4,4,2,6000);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(5,5,2,21000);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(6,6,1,30275);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(7,7,2,70000);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(8,8,5,40000);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(9,9,1,37900);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(10,10,2,47000);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(11,11,2,13500);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(12,12,2,120000);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(13,13,1,50000);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(14,14,1,11600);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(15,15,2,100000);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(16,16,2,21000);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(17,17,1,12200);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(18,18,2,33000);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(19,19,1,18700);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(20,20,2,40000);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(21,21,2,50000);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(22,22,1,30000);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(23,23,2,15000);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(24,24,1,13000);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(25,25,2,50000);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(26,26,2,40000);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(27,27,1,27800);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(28,28,2,100000);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(29,29,1,15000);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(30,30,2,18250);     
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(31,1,4,25000);    
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(32,2,4,25000);   
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(33,6,4,30275);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(34,7,3,45000);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(35,8,4,35400);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(36,10,4,30800);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(37,12,3,60000);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(38,13,4,45000);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(39,15,3,50000);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(40,20,4,35000);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(41,21,4,40000);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(42,22,3,30000);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(43,25,4,29500);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(44,26,4,25000);
 INSERT INTO FACTURAS_FORMAS_PAGOS(id_factura_forma_pago,nro_factura,id_forma_pago,monto)VALUES(45,28,3,20000);



--  ------------------------------------------ INSERT DE CONSULTORIOS


 INSERT INTO CONSULTORIOS (id_consultorio,descripcion,id_clinica)VALUES(1,'Consultorio N_1',1);
INSERT INTO CONSULTORIOS (id_consultorio,descripcion,id_clinica)VALUES(2,'Consultorio N_2',1);
INSERT INTO CONSULTORIOS (id_consultorio,descripcion,id_clinica)VALUES(3,'Consultorio N_3',1);
INSERT INTO CONSULTORIOS (id_consultorio,descripcion,id_clinica)VALUES(4,'Consultorio N_4',1);
INSERT INTO CONSULTORIOS (id_consultorio,descripcion,id_clinica)VALUES(5,'Consultorio N_5',1);
INSERT INTO CONSULTORIOS (id_consultorio,descripcion,id_clinica)VALUES(6,'Consultorio N_6',1);
INSERT INTO CONSULTORIOS (id_consultorio,descripcion,id_clinica)VALUES(7,'Consultorio N_7',1);
INSERT INTO CONSULTORIOS (id_consultorio,descripcion,id_clinica)VALUES(8,'Consultorio N_8',1);
INSERT INTO CONSULTORIOS (id_consultorio,descripcion,id_clinica)VALUES(9,'Consultorio N_9',1);
INSERT INTO CONSULTORIOS (id_consultorio,descripcion,id_clinica)VALUES(10,'Consultorio N_10',1);

--  ------------------------------------------ INSERT DE CONTACTOS


INSERT INTO CONTACTOS (id_contacto,contacto,id_tipo_contacto,id_clinica)VALUES(1,'Odontodentisll',6,1);
 INSERT INTO CONTACTOS (id_contacto,contacto,id_tipo_contacto,id_clinica)VALUES(2,'Dentaldentisll',3,1); 
 INSERT INTO CONTACTOS (id_contacto,contacto,id_tipo_contacto,id_clinica)VALUES(3,'3515895724',4,1);
 INSERT INTO CONTACTOS (id_contacto,contacto,id_tipo_contacto,id_clinica)VALUES(4,'03514780852',1,1);
 INSERT INTO CONTACTOS (id_contacto,contacto,id_tipo_contacto,id_clinica)VALUES(5,'3514591364',1,1);
 INSERT INTO CONTACTOS (id_contacto,contacto,id_tipo_contacto,id_clinica)VALUES(6,'03514320394',1,1);
 INSERT INTO CONTACTOS (id_contacto,contacto,id_tipo_contacto,id_clinica)VALUES(7,'dentisllturnos@gmail.com',2,1);
 INSERT INTO CONTACTOS (id_contacto,contacto,id_tipo_contacto,id_clinica)VALUES(8,'dentisllinformes@gmail.com',2,1);
 INSERT INTO CONTACTOS (id_contacto,contacto,id_tipo_contacto,id_clinica)VALUES(9,'GrupoTGDentis',8,1);
 INSERT INTO CONTACTOS (id_contacto,contacto,id_tipo_contacto,id_clinica)VALUES(10,'Dentaldentisll',5,1);



--  ------------------------------------------ INSERT DE OBRA SOCIAL PROCEDIMIENTOS


 INSERT INTO OBRAS_SOCIALES_PROCEDIMIENTOS(id_obra_social_procedimiento,id_proc_odontologico,id_obra_social,porc_cobertura)VALUES(1,1,11,60);
 INSERT INTO OBRAS_SOCIALES_PROCEDIMIENTOS(id_obra_social_procedimiento,id_proc_odontologico,id_obra_social,porc_cobertura)VALUES(2,7,2,20);
 INSERT INTO OBRAS_SOCIALES_PROCEDIMIENTOS(id_obra_social_procedimiento,id_proc_odontologico,id_obra_social,porc_cobertura)VALUES(3,3,7,15);
 INSERT INTO OBRAS_SOCIALES_PROCEDIMIENTOS(id_obra_social_procedimiento,id_proc_odontologico,id_obra_social,porc_cobertura)VALUES(4,8,15,25);
 INSERT INTO OBRAS_SOCIALES_PROCEDIMIENTOS(id_obra_social_procedimiento,id_proc_odontologico,id_obra_social,porc_cobertura)VALUES(5,5,9,45);
 INSERT INTO OBRAS_SOCIALES_PROCEDIMIENTOS(id_obra_social_procedimiento,id_proc_odontologico,id_obra_social,porc_cobertura)VALUES(6,9,13,10);
 INSERT INTO OBRAS_SOCIALES_PROCEDIMIENTOS(id_obra_social_procedimiento,id_proc_odontologico,id_obra_social,porc_cobertura)VALUES(7,15,17,25);
 INSERT INTO OBRAS_SOCIALES_PROCEDIMIENTOS(id_obra_social_procedimiento,id_proc_odontologico,id_obra_social,porc_cobertura)VALUES(8,10,8,5);
 INSERT INTO OBRAS_SOCIALES_PROCEDIMIENTOS(id_obra_social_procedimiento,id_proc_odontologico,id_obra_social,porc_cobertura)VALUES(9,12,20,40);
 INSERT INTO OBRAS_SOCIALES_PROCEDIMIENTOS(id_obra_social_procedimiento,id_proc_odontologico,id_obra_social,porc_cobertura)VALUES(10,2,2,20);
 INSERT INTO OBRAS_SOCIALES_PROCEDIMIENTOS(id_obra_social_procedimiento,id_proc_odontologico,id_obra_social,porc_cobertura)VALUES(11,13,18,15);
 INSERT INTO OBRAS_SOCIALES_PROCEDIMIENTOS(id_obra_social_procedimiento,id_proc_odontologico,id_obra_social,porc_cobertura)VALUES(12,15,14,10);
 INSERT INTO OBRAS_SOCIALES_PROCEDIMIENTOS(id_obra_social_procedimiento,id_proc_odontologico,id_obra_social,porc_cobertura)VALUES(13,6,20,35);
 INSERT INTO OBRAS_SOCIALES_PROCEDIMIENTOS(id_obra_social_procedimiento,id_proc_odontologico,id_obra_social,porc_cobertura)VALUES(14,7,17,35);
 INSERT INTO OBRAS_SOCIALES_PROCEDIMIENTOS(id_obra_social_procedimiento,id_proc_odontologico,id_obra_social,porc_cobertura)VALUES(15,14,4,5);
 INSERT INTO OBRAS_SOCIALES_PROCEDIMIENTOS(id_obra_social_procedimiento,id_proc_odontologico,id_obra_social,porc_cobertura)VALUES(16,11,1,15);
 INSERT INTO OBRAS_SOCIALES_PROCEDIMIENTOS(id_obra_social_procedimiento,id_proc_odontologico,id_obra_social,porc_cobertura)VALUES(17,3,16,25);
 INSERT INTO OBRAS_SOCIALES_PROCEDIMIENTOS(id_obra_social_procedimiento,id_proc_odontologico,id_obra_social,porc_cobertura)VALUES(18,2,19,25);
 INSERT INTO OBRAS_SOCIALES_PROCEDIMIENTOS(id_obra_social_procedimiento,id_proc_odontologico,id_obra_social,porc_cobertura)VALUES(19,1,11,30);
 INSERT INTO OBRAS_SOCIALES_PROCEDIMIENTOS(id_obra_social_procedimiento,id_proc_odontologico,id_obra_social,porc_cobertura)VALUES(20,4,6,5);



--  ------------------------------------------ INSERT DE PACIENTES PROCEDIMIENTOS ODONTOLOGICOS


INSERT INTO PACIENTES_PROCEDIMIENTOS_ODONTOLOGICOS(id_paciente_proc_odontologico,id_paciente,id_proc_odontologico,fecha,costo)VALUES(1,1,1,'2016-10-02',55000);
INSERT INTO PACIENTES_PROCEDIMIENTOS_ODONTOLOGICOS(id_paciente_proc_odontologico,id_paciente,id_proc_odontologico,fecha,costo)VALUES(2,2,1,'2016-11-18',55000);
INSERT INTO PACIENTES_PROCEDIMIENTOS_ODONTOLOGICOS(id_paciente_proc_odontologico,id_paciente,id_proc_odontologico,fecha,costo)VALUES(3,3,10,'2017-06-24',9500);
INSERT INTO PACIENTES_PROCEDIMIENTOS_ODONTOLOGICOS(id_paciente_proc_odontologico,id_paciente,id_proc_odontologico,fecha,costo)VALUES(4,4,4,'2018-09-06',6000);
INSERT INTO PACIENTES_PROCEDIMIENTOS_ODONTOLOGICOS(id_paciente_proc_odontologico,id_paciente,id_proc_odontologico,fecha,costo)VALUES(5,5,3,'2018-10-09',21000);
INSERT INTO PACIENTES_PROCEDIMIENTOS_ODONTOLOGICOS(id_paciente_proc_odontologico,id_paciente,id_proc_odontologico,fecha,costo)VALUES(6,6,2,'2017-12-12',60550);
INSERT INTO PACIENTES_PROCEDIMIENTOS_ODONTOLOGICOS(id_paciente_proc_odontologico,id_paciente,id_proc_odontologico,fecha,costo)VALUES(7,7,7,'2017-02-08',115000);
INSERT INTO PACIENTES_PROCEDIMIENTOS_ODONTOLOGICOS(id_paciente_proc_odontologico,id_paciente,id_proc_odontologico,fecha,costo)VALUES(8,8,6,'2019-10-30',75400);
INSERT INTO PACIENTES_PROCEDIMIENTOS_ODONTOLOGICOS(id_paciente_proc_odontologico,id_paciente,id_proc_odontologico,fecha,costo)VALUES(9,9,11,'2020-07-15',37900);
INSERT INTO PACIENTES_PROCEDIMIENTOS_ODONTOLOGICOS(id_paciente_proc_odontologico,id_paciente,id_proc_odontologico,fecha,costo)VALUES(10,10,14,'2021-09-21',77800);
INSERT INTO PACIENTES_PROCEDIMIENTOS_ODONTOLOGICOS(id_paciente_proc_odontologico,id_paciente,id_proc_odontologico,fecha,costo)VALUES(11,11,10,'2020-03-15',13500);
INSERT INTO PACIENTES_PROCEDIMIENTOS_ODONTOLOGICOS(id_paciente_proc_odontologico,id_paciente,id_proc_odontologico,fecha,costo)VALUES(12,12,1,'2021-07-11',180000);
INSERT INTO PACIENTES_PROCEDIMIENTOS_ODONTOLOGICOS(id_paciente_proc_odontologico,id_paciente,id_proc_odontologico,fecha,costo)VALUES(13,13,10,'2017-08-19',9500);
INSERT INTO PACIENTES_PROCEDIMIENTOS_ODONTOLOGICOS(id_paciente_proc_odontologico,id_paciente,id_proc_odontologico,fecha,costo)VALUES(14,14,10,'2018-06-24',11600);
INSERT INTO PACIENTES_PROCEDIMIENTOS_ODONTOLOGICOS(id_paciente_proc_odontologico,id_paciente,id_proc_odontologico,fecha,costo)VALUES(15,15,1,'2018-02-22',150000);
INSERT INTO PACIENTES_PROCEDIMIENTOS_ODONTOLOGICOS(id_paciente_proc_odontologico,id_paciente,id_proc_odontologico,fecha,costo)VALUES(16,16,8,'2016-12-27',21000);
INSERT INTO PACIENTES_PROCEDIMIENTOS_ODONTOLOGICOS(id_paciente_proc_odontologico,id_paciente,id_proc_odontologico,fecha,costo)VALUES(17,17,10,'2019-08-26',12200);
INSERT INTO PACIENTES_PROCEDIMIENTOS_ODONTOLOGICOS(id_paciente_proc_odontologico,id_paciente,id_proc_odontologico,fecha,costo)VALUES(18,18,12,'2019-05-21',33000);
INSERT INTO PACIENTES_PROCEDIMIENTOS_ODONTOLOGICOS(id_paciente_proc_odontologico,id_paciente,id_proc_odontologico,fecha,costo)VALUES(19,19,9,'2019-09-23',18700);
INSERT INTO PACIENTES_PROCEDIMIENTOS_ODONTOLOGICOS(id_paciente_proc_odontologico,id_paciente,id_proc_odontologico,fecha,costo)VALUES(20,20,15,'2021-03-17',75000);
INSERT INTO PACIENTES_PROCEDIMIENTOS_ODONTOLOGICOS(id_paciente_proc_odontologico,id_paciente,id_proc_odontologico,fecha,costo)VALUES(21,15,14,'2023-04-23',90000);
INSERT INTO PACIENTES_PROCEDIMIENTOS_ODONTOLOGICOS(id_paciente_proc_odontologico,id_paciente,id_proc_odontologico,fecha,costo)VALUES(22,17,13,'2023-03-21',60000);
INSERT INTO PACIENTES_PROCEDIMIENTOS_ODONTOLOGICOS(id_paciente_proc_odontologico,id_paciente,id_proc_odontologico,fecha,costo)VALUES(23,14,4,'2023-02-14',15000);
INSERT INTO PACIENTES_PROCEDIMIENTOS_ODONTOLOGICOS(id_paciente_proc_odontologico,id_paciente,id_proc_odontologico,fecha,costo)VALUES(24,11,4,'2022-10-05',13000);
INSERT INTO PACIENTES_PROCEDIMIENTOS_ODONTOLOGICOS(id_paciente_proc_odontologico,id_paciente,id_proc_odontologico,fecha,costo)VALUES(25,8,6,'2022-11-10',79500);
INSERT INTO PACIENTES_PROCEDIMIENTOS_ODONTOLOGICOS(id_paciente_proc_odontologico,id_paciente,id_proc_odontologico,fecha,costo)VALUES(26,6,8,'2022-09-09',65000);
INSERT INTO PACIENTES_PROCEDIMIENTOS_ODONTOLOGICOS(id_paciente_proc_odontologico,id_paciente,id_proc_odontologico,fecha,costo)VALUES(27,9,3,'2022-08-01',27800);
INSERT INTO PACIENTES_PROCEDIMIENTOS_ODONTOLOGICOS(id_paciente_proc_odontologico,id_paciente,id_proc_odontologico,fecha,costo)VALUES(28,7,5,'2023-06-02',120000);
INSERT INTO PACIENTES_PROCEDIMIENTOS_ODONTOLOGICOS(id_paciente_proc_odontologico,id_paciente,id_proc_odontologico,fecha,costo)VALUES(29,3,4,'2023-04-24',15000);
INSERT INTO PACIENTES_PROCEDIMIENTOS_ODONTOLOGICOS(id_paciente_proc_odontologico,id_paciente,id_proc_odontologico,fecha,costo)VALUES(30,1,10,'2022-07-04',18250);




--  ------------------------------------------ INSERT DE INSTRUMENTOS


INSERT INTO INSTRUMENTOS(id_instrumento,nombre,id_marca,id_pais,nro_serie,fecha_adquisicion,fecha_ult_revision,fecha_proxima_revision)VALUES(1,'Espejo dental',1,21,40001,'2016-3-20','2023-4-3','2023-7-3');
INSERT INTO INSTRUMENTOS(id_instrumento,nombre,id_marca,id_pais,nro_serie,fecha_adquisicion,fecha_ult_revision,fecha_proxima_revision)VALUES(2,'Torno',1,21,50017,'2019-3-20','2023-5-7','2023-8-7');
INSERT INTO INSTRUMENTOS(id_instrumento,nombre,id_marca,id_pais,nro_serie,fecha_adquisicion,fecha_ult_revision)VALUES(3,'Torno',1,21,40001,'2016-1-7','2019-5-7');
INSERT INTO INSTRUMENTOS(id_instrumento,nombre,id_marca,id_pais,nro_serie,fecha_adquisicion,fecha_ult_revision,fecha_proxima_revision)VALUES(4,'Mango de bisturí',9,21,50017,'2016-2-15','2023-4-3','2023-7-3');
INSERT INTO INSTRUMENTOS(id_instrumento,nombre,id_marca,id_pais,nro_serie,fecha_adquisicion,fecha_ult_revision,fecha_proxima_revision)VALUES(5,'Explorador dental',11,21,77999,'2023-10-10','2023-5-1','2023-8-01');
INSERT INTO INSTRUMENTOS(id_instrumento,nombre,id_marca,id_pais,nro_serie,fecha_adquisicion,fecha_ult_revision)VALUES(6,'Explorador dental',14,21,67595,'2020-1-12','2022-10-8');
INSERT INTO INSTRUMENTOS(id_instrumento,nombre,id_marca,id_pais,nro_serie,fecha_adquisicion,fecha_ult_revision,fecha_proxima_revision)VALUES(7,'Explorador dental',17,21,77998,'2022-10-10','2023-5-01','2023-8-01');
INSERT INTO INSTRUMENTOS(id_instrumento,nombre,id_marca,id_pais,nro_serie,fecha_adquisicion,fecha_ult_revision,fecha_proxima_revision)VALUES(8,'Pinzas de algodón',25,21,50017,'2016-7-07','2023-1-17','2023-7-17');
INSERT INTO INSTRUMENTOS(id_instrumento,nombre,id_marca,id_pais,nro_serie,fecha_adquisicion,fecha_ult_revision,fecha_proxima_revision)VALUES(9,'Lima para hueso',26,21,55000,'2022-7-07','2023-5-17','2023-8-17');
INSERT INTO INSTRUMENTOS(id_instrumento,nombre,id_marca,id_pais,nro_serie,fecha_adquisicion,fecha_ult_revision)VALUES(10,'Lima para hueso',26,21,43023,'2017-7-07','2022-7-05');
INSERT INTO INSTRUMENTOS(id_instrumento,nombre,id_marca,id_pais,nro_serie,fecha_adquisicion,fecha_ult_revision,fecha_proxima_revision)VALUES(11,'Pulidor dental',2,21,75849,'2022-4-22','2023-5-09','2023-8-09');
INSERT INTO INSTRUMENTOS(id_instrumento,nombre,id_marca,id_pais,nro_serie,fecha_adquisicion,fecha_ult_revision)VALUES(12,'Pulidor dental',5,21,50119,'2016-7-07','2022-4-21');
INSERT INTO INSTRUMENTOS(id_instrumento,nombre,id_marca,id_pais,nro_serie,fecha_adquisicion,fecha_ult_revision,fecha_proxima_revision)VALUES(13,'Bandeja de impresión',7,21,51111,'2016-4-20','2023-5-09','2023-8-09');
INSERT INTO INSTRUMENTOS(id_instrumento,nombre,id_marca,id_pais,nro_serie,fecha_adquisicion,fecha_ult_revision,fecha_proxima_revision)VALUES(14,'Bandeja de impresión',19,21,51112,'2017-4-22','2023-5-09','2023-8-09');
INSERT INTO INSTRUMENTOS(id_instrumento,nombre,id_marca,id_pais,nro_serie,fecha_adquisicion,fecha_ult_revision,fecha_proxima_revision)VALUES(15,'Jeringa anestesia',19,21,50233,'2016-4-22','2023-5-10','2023-8-10');
INSERT INTO INSTRUMENTOS(id_instrumento,nombre,id_marca,id_pais,nro_serie,fecha_adquisicion,fecha_ult_revision,fecha_proxima_revision)VALUES(16,'Jeringa anestesia',18,21,85545,'2022-9-05','2023-5-10','2023-8-10');
INSERT INTO INSTRUMENTOS(id_instrumento,nombre,id_marca,id_pais,nro_serie,fecha_adquisicion,fecha_ult_revision,fecha_proxima_revision)VALUES(17,'Aspiradora dental',8,21,66667,'2016-4-20','2023-5-09','2023-8-09');
INSERT INTO INSTRUMENTOS(id_instrumento,nombre,id_marca,id_pais,nro_serie,fecha_adquisicion,fecha_ult_revision,fecha_proxima_revision)VALUES(18,'Aspiradora dental',8,21,30017,'2017-4-22','2023-5-09','2023-8-09');
INSERT INTO INSTRUMENTOS(id_instrumento,nombre,id_marca,id_pais,nro_serie,fecha_adquisicion,fecha_ult_revision,fecha_proxima_revision)VALUES(19,'Aspiradora dental',12,21,50100,'2019-6-02','2023-5-09','2023-8-09');
INSERT INTO INSTRUMENTOS(id_instrumento,nombre,id_marca,id_pais,nro_serie,fecha_adquisicion,fecha_ult_revision,fecha_proxima_revision)VALUES(20,'Torno',12,21,99556,'2023-3-07','2023-5-07','2023-8-07');
INSERT INTO INSTRUMENTOS(id_instrumento,nombre,id_marca,id_pais,nro_serie,fecha_adquisicion,fecha_ult_revision,fecha_proxima_revision)VALUES(21,'Pinzas',4,21,10023,'2016-3-07','2023-5-07','2023-8-07');
INSERT INTO INSTRUMENTOS(id_instrumento,nombre,id_marca,id_pais,nro_serie,fecha_adquisicion,fecha_ult_revision,fecha_proxima_revision)VALUES(22,'Pinzas',4,21,56899,'2021-5-03','2023-4-10','2023-7-10');
INSERT INTO INSTRUMENTOS(id_instrumento,nombre,id_marca,id_pais,nro_serie,fecha_adquisicion,fecha_ult_revision,fecha_proxima_revision)VALUES(23,'Fresas dentales',3,21,50017,'2016-5-03','2023-4-10','2023-7-10');
INSERT INTO INSTRUMENTOS(id_instrumento,nombre,id_marca,id_pais,nro_serie,fecha_adquisicion,fecha_ult_revision,fecha_proxima_revision)VALUES(24,'Fresas dentales',13,21,89994,'2022-5-03','2023-4-10','2023-7-10');
INSERT INTO INSTRUMENTOS(id_instrumento,nombre,id_marca,id_pais,nro_serie,fecha_adquisicion,fecha_ult_revision,fecha_proxima_revision)VALUES(25,'Forcep dental',16,21,00600,'2016-3-03','2023-3-07','2023-6-07');
INSERT INTO INSTRUMENTOS(id_instrumento,nombre,id_marca,id_pais,nro_serie,fecha_adquisicion,fecha_ult_revision,fecha_proxima_revision)VALUES(26,'Forcep dental',15,21,50000,'2021-5-08','2023-3-07','2023-6-07');
INSERT INTO INSTRUMENTOS(id_instrumento,nombre,id_marca,id_pais,nro_serie,fecha_adquisicion,fecha_ult_revision,fecha_proxima_revision)VALUES(27,'Cucharilla de dentina',15,21,23337,'2016-5-05','2023-5-07','2023-9-07');
INSERT INTO INSTRUMENTOS(id_instrumento,nombre,id_marca,id_pais,nro_serie,fecha_adquisicion,fecha_ult_revision,fecha_proxima_revision)VALUES(28,'Cucharilla de dentina',7,21,78669,'2022-5-08','2023-5-07','2023-9-07');
INSERT INTO INSTRUMENTOS(id_instrumento,nombre,id_marca,id_pais,nro_serie,fecha_adquisicion,fecha_ult_revision,fecha_proxima_revision)VALUES(29,'Espejo dental',7,21,78009,'2019-3-07','2023-4-03','2023-7-3');
INSERT INTO INSTRUMENTOS(id_instrumento,nombre,id_marca,id_pais,nro_serie,fecha_adquisicion,fecha_ult_revision,fecha_proxima_revision)VALUES(30,'Espejo dental',1,21,99998,'2023-5-20','2023-4-03','2023-7-03');


--  ------------------------------------------ INSERT DE INSTRUMETOS  CONSULTORIOS




 INSERT INTO INSTRUMENTOS_CONSULTORIOS(id_instrumento_consultorio,id_instrumento,nro_dentista,id_consultorio)VALUES(1,2,1,1);
 INSERT INTO INSTRUMENTOS_CONSULTORIOS(id_instrumento_consultorio,id_instrumento,nro_dentista,id_consultorio)VALUES(2,3,2,2);
 INSERT INTO INSTRUMENTOS_CONSULTORIOS(id_instrumento_consultorio,id_instrumento,nro_dentista,id_consultorio)VALUES(3,3,3,3);
 INSERT INTO INSTRUMENTOS_CONSULTORIOS(id_instrumento_consultorio,id_instrumento,nro_dentista,id_consultorio)VALUES(4,11,4,4);
 INSERT INTO INSTRUMENTOS_CONSULTORIOS(id_instrumento_consultorio,id_instrumento,nro_dentista,id_consultorio)VALUES(5,18,5,5);
 INSERT INTO INSTRUMENTOS_CONSULTORIOS(id_instrumento_consultorio,id_instrumento,nro_dentista,id_consultorio)VALUES(6,2,6,6);
 INSERT INTO INSTRUMENTOS_CONSULTORIOS(id_instrumento_consultorio,id_instrumento,nro_dentista,id_consultorio)VALUES(7,9,7,7);
 INSERT INTO INSTRUMENTOS_CONSULTORIOS(id_instrumento_consultorio,id_instrumento,nro_dentista,id_consultorio)VALUES(8,3,1,1);
 INSERT INTO INSTRUMENTOS_CONSULTORIOS(id_instrumento_consultorio,id_instrumento,nro_dentista,id_consultorio)VALUES(9,2,2,2);
 INSERT INTO INSTRUMENTOS_CONSULTORIOS(id_instrumento_consultorio,id_instrumento,nro_dentista,id_consultorio)VALUES(10,11,3,3);
 INSERT INTO INSTRUMENTOS_CONSULTORIOS(id_instrumento_consultorio,id_instrumento,nro_dentista,id_consultorio)VALUES(11,2,4,4);
 INSERT INTO INSTRUMENTOS_CONSULTORIOS(id_instrumento_consultorio,id_instrumento,nro_dentista,id_consultorio)VALUES(12,30,5,5);
 INSERT INTO INSTRUMENTOS_CONSULTORIOS(id_instrumento_consultorio,id_instrumento,nro_dentista,id_consultorio)VALUES(13,18,6,6);
 INSERT INTO INSTRUMENTOS_CONSULTORIOS(id_instrumento_consultorio,id_instrumento,nro_dentista,id_consultorio)VALUES(14,2,7,7);
 INSERT INTO INSTRUMENTOS_CONSULTORIOS(id_instrumento_consultorio,id_instrumento,nro_dentista,id_consultorio)VALUES(15,11,1,1);
 INSERT INTO INSTRUMENTOS_CONSULTORIOS(id_instrumento_consultorio,id_instrumento,nro_dentista,id_consultorio)VALUES(16,21,2,2);
 INSERT INTO INSTRUMENTOS_CONSULTORIOS(id_instrumento_consultorio,id_instrumento,nro_dentista,id_consultorio)VALUES(17,21,3,3);
 INSERT INTO INSTRUMENTOS_CONSULTORIOS(id_instrumento_consultorio,id_instrumento,nro_dentista,id_consultorio)VALUES(18,3,4,4);
 INSERT INTO INSTRUMENTOS_CONSULTORIOS(id_instrumento_consultorio,id_instrumento,nro_dentista,id_consultorio)VALUES(19,14,5,5);
 INSERT INTO INSTRUMENTOS_CONSULTORIOS(id_instrumento_consultorio,id_instrumento,nro_dentista,id_consultorio)VALUES(20,23,6,6);
 INSERT INTO INSTRUMENTOS_CONSULTORIOS(id_instrumento_consultorio,id_instrumento,nro_dentista,id_consultorio)VALUES(21,17,7,7);
 INSERT INTO INSTRUMENTOS_CONSULTORIOS(id_instrumento_consultorio,id_instrumento,nro_dentista,id_consultorio)VALUES(22,21,1,1);
 INSERT INTO INSTRUMENTOS_CONSULTORIOS(id_instrumento_consultorio,id_instrumento,nro_dentista,id_consultorio)VALUES(23,11,2,2);
 INSERT INTO INSTRUMENTOS_CONSULTORIOS(id_instrumento_consultorio,id_instrumento,nro_dentista,id_consultorio)VALUES(24,2,3,3);
 INSERT INTO INSTRUMENTOS_CONSULTORIOS(id_instrumento_consultorio,id_instrumento,nro_dentista,id_consultorio)VALUES(25,21,4,4);
 INSERT INTO INSTRUMENTOS_CONSULTORIOS(id_instrumento_consultorio,id_instrumento,nro_dentista,id_consultorio)VALUES(26,25,5,5);
 INSERT INTO INSTRUMENTOS_CONSULTORIOS(id_instrumento_consultorio,id_instrumento,nro_dentista,id_consultorio)VALUES(27,27,6,6);
 INSERT INTO INSTRUMENTOS_CONSULTORIOS(id_instrumento_consultorio,id_instrumento,nro_dentista,id_consultorio)VALUES(28,24,7,7);
 INSERT INTO INSTRUMENTOS_CONSULTORIOS(id_instrumento_consultorio,id_instrumento,nro_dentista,id_consultorio)VALUES(29,15,1,1);
 INSERT INTO INSTRUMENTOS_CONSULTORIOS(id_instrumento_consultorio,id_instrumento,nro_dentista,id_consultorio)VALUES(30,15,2,2);
 INSERT INTO INSTRUMENTOS_CONSULTORIOS(id_instrumento_consultorio,id_instrumento,nro_dentista,id_consultorio)VALUES(31,15,3,3);
 INSERT INTO INSTRUMENTOS_CONSULTORIOS(id_instrumento_consultorio,id_instrumento,nro_dentista,id_consultorio)VALUES(32,17,4,4);
 INSERT INTO INSTRUMENTOS_CONSULTORIOS(id_instrumento_consultorio,id_instrumento,nro_dentista,id_consultorio)VALUES(33,24,5,5);
 INSERT INTO INSTRUMENTOS_CONSULTORIOS(id_instrumento_consultorio,id_instrumento,nro_dentista,id_consultorio)VALUES(34,2,6,6);
 INSERT INTO INSTRUMENTOS_CONSULTORIOS(id_instrumento_consultorio,id_instrumento,nro_dentista,id_consultorio)VALUES(35,30,7,7);




--  ------------------------------------------ INSERT DE MATERIALES




INSERT INTO MATERIALES(id_material,nombre,id_marca,id_pais,fecha_vencimiento,cantidad)VALUES(1,'Anestesia',1,13,'2024-12-01',690);
INSERT INTO MATERIALES(id_material,nombre,id_marca,id_pais,fecha_vencimiento,cantidad)VALUES(2,'Anestesia',14,13,'2020-12-10',800);
INSERT INTO MATERIALES(id_material,nombre,id_marca,id_pais,fecha_vencimiento,cantidad)VALUES(3,'Jeringa blanqueadora',10,13,'2020-12-29',200);
INSERT INTO MATERIALES(id_material,nombre,id_marca,id_pais,fecha_vencimiento,cantidad)VALUES(4,'Jeringa blanqueadora',9,21,'2026-12-10',500);
INSERT INTO MATERIALES(id_material,nombre,id_marca,id_pais,cantidad)VALUES(5,'Guantes descartables',9,1,750);
INSERT INTO MATERIALES(id_material,nombre,id_marca,id_pais,cantidad)VALUES(6,'Guantes descartables',26,1,800);
INSERT INTO MATERIALES(id_material,nombre,id_marca,id_pais,cantidad)VALUES(7,'Gasas',24,1,550);
INSERT INTO MATERIALES(id_material,nombre,id_marca,id_pais,cantidad)VALUES(8,'Gasas',23,1,850);
INSERT INTO MATERIALES(id_material,nombre,id_marca,id_pais,cantidad)VALUES(9,'Algodón',23,1,640);
INSERT INTO MATERIALES(id_material,nombre,id_marca,id_pais,cantidad)VALUES(10,'Algodón',2,1,740);
INSERT INTO MATERIALES(id_material,nombre,id_marca,id_pais,cantidad)VALUES(11,'Brackets',3,13,230);
INSERT INTO MATERIALES(id_material,nombre,id_marca,id_pais,cantidad)VALUES(12,'Brackets',4,13,540);
INSERT INTO MATERIALES(id_material,nombre,id_marca,id_pais,cantidad)VALUES(13,'Barbijo',5,1,1200);
INSERT INTO MATERIALES(id_material,nombre,id_marca,id_pais,cantidad)VALUES(14,'Barbijo',7,1,1200);
INSERT INTO MATERIALES(id_material,nombre,id_marca,id_pais,cantidad)VALUES(15,'Hoja de bisturí',7,21,900);
INSERT INTO MATERIALES(id_material,nombre,id_marca,id_pais,cantidad)VALUES(16,'Hoja de bisturí',7,1,675);
INSERT INTO MATERIALES(id_material,nombre,id_marca,id_pais,fecha_vencimiento,cantidad)VALUES(17,'Anestesia',10,21,'2026-12-05',3000);
INSERT INTO MATERIALES(id_material,nombre,id_marca,id_pais,fecha_vencimiento,cantidad)VALUES(18,'Anestesia',1,13,'2020-12-10',1500);
INSERT INTO MATERIALES(id_material,nombre,id_marca,id_pais,fecha_vencimiento,cantidad)VALUES(19,'Jeringa blanqueadora',1,13,'2020-12-29',2000);
INSERT INTO MATERIALES(id_material,nombre,id_marca,id_pais,fecha_vencimiento,cantidad)VALUES(20,'Jeringa blanqueadora',1,1,'2024-12-10',3500);
INSERT INTO MATERIALES(id_material,nombre,id_marca,id_pais,fecha_vencimiento,cantidad)VALUES(21,'Hidróxido de calcio',5,1,'2021-12-07',890);
INSERT INTO MATERIALES(id_material,nombre,id_marca,id_pais,fecha_vencimiento,cantidad)VALUES(22,'Hidróxido de calcio',5,1,'2024-12-15',1000);
INSERT INTO MATERIALES(id_material,nombre,id_marca,id_pais,fecha_vencimiento,cantidad)VALUES(23,'Cemento dental',14,13,'2026-12-15',895);
INSERT INTO MATERIALES(id_material,nombre,id_marca,id_pais,fecha_vencimiento,cantidad)VALUES(24,'Cemento dental',9,1,'2023-12-15',380);
INSERT INTO MATERIALES(id_material,nombre,id_marca,id_pais,fecha_vencimiento,cantidad)VALUES(25,'Pasta',8,1,'2020-12-01',1360);
INSERT INTO MATERIALES(id_material,nombre,id_marca,id_pais,fecha_vencimiento,cantidad)VALUES(26,'Pasta',17,13,'2024-12-07',2300);




--  ------------------------------------------ INSERT DE INVENTARIO


INSERT INTO INVENTARIOS(id_inventario,id_instrumento,id_tipo_movimiento,fecha,cantidad)VALUES(1,3,2,'2019-5-07',1);
INSERT INTO INVENTARIOS(id_inventario,id_instrumento,id_tipo_movimiento,fecha,cantidad)VALUES(2,6,2,'2022-10-08',1);
INSERT INTO INVENTARIOS(id_inventario,id_instrumento,id_tipo_movimiento,fecha,cantidad)VALUES(3,10,2,'2022-7-05',1);
INSERT INTO INVENTARIOS	(id_inventario,id_instrumento,id_tipo_movimiento,fecha,cantidad)VALUES(4,12,2,'2022-4-21',1);
INSERT INTO INVENTARIOS (id_inventario,id_instrumento,id_tipo_movimiento,fecha,cantidad)VALUES(5,1,1,'2016-3-20',1);
INSERT INTO INVENTARIOS (id_inventario,id_instrumento,id_tipo_movimiento,fecha,cantidad)VALUES(6,2,1,'2017-3-20',1);
INSERT INTO INVENTARIOS (id_inventario,id_instrumento,id_tipo_movimiento,fecha,cantidad)VALUES(7,4,1,'2016-2-15',1);
INSERT INTO INVENTARIOS (id_inventario,id_instrumento,id_tipo_movimiento,fecha,cantidad)VALUES(8,7,1,'2022-10-10',1);
INSERT INTO INVENTARIOS (id_inventario,id_instrumento,id_tipo_movimiento,fecha,cantidad)VALUES(9,8,1,'2016-7-07',1);
INSERT INTO INVENTARIOS (id_inventario,id_instrumento,id_tipo_movimiento,fecha,cantidad)VALUES(10,14,1,'2017-4-20',1);
INSERT INTO INVENTARIOS (id_inventario,id_instrumento,id_tipo_movimiento,fecha,cantidad)VALUES(11,16,1,'2022-9-05',1);
INSERT INTO INVENTARIOS (id_inventario,id_instrumento,id_tipo_movimiento,fecha,cantidad)VALUES(12,9,3,'2023-5-17',1);
INSERT INTO INVENTARIOS (id_inventario,id_instrumento,id_tipo_movimiento,fecha,cantidad)VALUES(13,30,3,'2023-4-10',1);
INSERT INTO INVENTARIOS (id_inventario,id_instrumento,id_tipo_movimiento,fecha,cantidad)VALUES(14,27,3,'2023-5-07',1);
INSERT INTO INVENTARIOS (id_inventario,id_instrumento,id_tipo_movimiento,fecha,cantidad)VALUES(15,24,3,'2023-4-03',1);
INSERT INTO INVENTARIOS (id_inventario,id_material,id_tipo_movimiento,fecha,cantidad)VALUES(16,11,2,'2019-7-11',32);
INSERT INTO INVENTARIOS (id_inventario,id_material,id_tipo_movimiento,fecha,cantidad)VALUES(17,13,2,'2022-9-17',1);
INSERT INTO INVENTARIOS (id_inventario,id_material,id_tipo_movimiento,fecha,cantidad)VALUES(18,5,2,'2022-6-03',2);
INSERT INTO INVENTARIOS (id_inventario,id_material,id_tipo_movimiento,fecha,cantidad)VALUES(19,1,2,'2018-10-05',2);
INSERT INTO INVENTARIOS (id_inventario,id_material,id_tipo_movimiento,fecha,cantidad)VALUES(20,2,1,'2017-3-02',800);
INSERT INTO INVENTARIOS (id_inventario,id_material,id_tipo_movimiento,fecha,cantidad)VALUES(21,3,1,'2019-3-05',200);
INSERT INTO INVENTARIOS (id_inventario,id_material,id_tipo_movimiento,fecha,cantidad)VALUES(22,20,2,'2022-7-20',6);
INSERT INTO INVENTARIOS(id_inventario,id_material,id_tipo_movimiento,fecha,cantidad)VALUES(23,12,1,'2023-5-15',540);
INSERT INTO INVENTARIOS(id_inventario,id_material,id_tipo_movimiento,fecha,cantidad)VALUES(24,15,1,'2021-7-16',900);
INSERT INTO INVENTARIOS(id_inventario,id_material,id_tipo_movimiento,fecha,cantidad)VALUES(25,9,2,'2019-1-01',1);
INSERT INTO INVENTARIOS (id_inventario,id_material,id_tipo_movimiento,fecha,cantidad)VALUES(26,16,2,'2018-4-03',2);
INSERT INTO INVENTARIOS (id_inventario,id_material,id_tipo_movimiento,fecha,cantidad)VALUES(27,26,1,'2017-4-04',2300);
INSERT INTO INVENTARIOS(id_inventario,id_material,id_tipo_movimiento,fecha,cantidad)VALUES(28,25,2,'2017-7-07',2);


--  ------------------------------------------ INSERT DE  PROCEDIMIENTOS INSTRUMENTOS

 
INSERT INTO PROCEDIMIENTOS_X_INSTRUMENTOS(id_proc_instrumento,id_proc_odontologico,id_material,cantidad)VALUES(1,1,11,32);
INSERT INTO PROCEDIMIENTOS_X_INSTRUMENTOS(id_proc_instrumento,id_proc_odontologico,id_material,cantidad)VALUES(2,1,13,1);
INSERT INTO PROCEDIMIENTOS_X_INSTRUMENTOS(id_proc_instrumento,id_proc_odontologico,id_material,cantidad)VALUES(3,1,5,2);
INSERT INTO PROCEDIMIENTOS_X_INSTRUMENTOS(id_proc_instrumento,id_proc_odontologico,id_instrumento)VALUES(4,1,18);
INSERT INTO PROCEDIMIENTOS_X_INSTRUMENTOS(id_proc_instrumento,id_proc_odontologico,id_material,cantidad)VALUES(5,4,1,2);
INSERT INTO PROCEDIMIENTOS_X_INSTRUMENTOS(id_proc_instrumento,id_proc_odontologico,id_material,cantidad)VALUES(6,4,5,2);
INSERT INTO PROCEDIMIENTOS_X_INSTRUMENTOS(id_proc_instrumento,id_proc_odontologico,id_material,cantidad)VALUES(7,4,13,2);
INSERT INTO PROCEDIMIENTOS_X_INSTRUMENTOS(id_proc_instrumento,id_proc_odontologico,id_instrumento)VALUES(8,4,1);
INSERT INTO PROCEDIMIENTOS_X_INSTRUMENTOS(id_proc_instrumento,id_proc_odontologico,id_instrumento)VALUES(9,4,15);
INSERT INTO PROCEDIMIENTOS_X_INSTRUMENTOS(id_proc_instrumento,id_proc_odontologico,id_instrumento)VALUES(10,4,17);
INSERT INTO PROCEDIMIENTOS_X_INSTRUMENTOS(id_proc_instrumento,id_proc_odontologico,id_instrumento)VALUES(11,4,21);
INSERT INTO PROCEDIMIENTOS_X_INSTRUMENTOS(id_proc_instrumento,id_proc_odontologico,id_material,cantidad)VALUES(12,10,20,6);
INSERT INTO PROCEDIMIENTOS_X_INSTRUMENTOS(id_proc_instrumento,id_proc_odontologico,id_instrumento)VALUES(13,10,11);
INSERT INTO PROCEDIMIENTOS_X_INSTRUMENTOS(id_proc_instrumento,id_proc_odontologico,id_material,cantidad)VALUES(14,8,1,3);
INSERT INTO PROCEDIMIENTOS_X_INSTRUMENTOS(id_proc_instrumento,id_proc_odontologico,id_material,cantidad)VALUES(15,8,5,2);
INSERT INTO PROCEDIMIENTOS_X_INSTRUMENTOS(id_proc_instrumento,id_proc_odontologico,id_material,cantidad)VALUES(16,8,9,1);
INSERT INTO PROCEDIMIENTOS_X_INSTRUMENTOS(id_proc_instrumento,id_proc_odontologico,id_material,cantidad)VALUES(17,8,16,2);
INSERT INTO PROCEDIMIENTOS_X_INSTRUMENTOS(id_proc_instrumento,id_proc_odontologico,id_instrumento)VALUES(18,8,2);
INSERT INTO PROCEDIMIENTOS_X_INSTRUMENTOS(id_proc_instrumento,id_proc_odontologico,id_instrumento)VALUES(19,8,1);
INSERT INTO PROCEDIMIENTOS_X_INSTRUMENTOS(id_proc_instrumento,id_proc_odontologico,id_instrumento)VALUES(20,8,4);
INSERT INTO PROCEDIMIENTOS_X_INSTRUMENTOS(id_proc_instrumento,id_proc_odontologico,id_material,cantidad)VALUES(21,7,1,2);
INSERT INTO PROCEDIMIENTOS_X_INSTRUMENTOS(id_proc_instrumento,id_proc_odontologico,id_material,cantidad)VALUES(22,7,25,2);
INSERT INTO PROCEDIMIENTOS_X_INSTRUMENTOS(id_proc_instrumento,id_proc_odontologico,id_instrumento)VALUES(23,7,2);
INSERT INTO PROCEDIMIENTOS_X_INSTRUMENTOS(id_proc_instrumento,id_proc_odontologico,id_instrumento)VALUES(24,7,7);
INSERT INTO PROCEDIMIENTOS_X_INSTRUMENTOS(id_proc_instrumento,id_proc_odontologico,id_instrumento)VALUES(25,7,9);
INSERT INTO PROCEDIMIENTOS_X_INSTRUMENTOS(id_proc_instrumento,id_proc_odontologico,id_instrumento)VALUES(26,7,15);
INSERT INTO PROCEDIMIENTOS_X_INSTRUMENTOS(id_proc_instrumento,id_proc_odontologico,id_instrumento)VALUES(27,7,18);



--  ------------------------------------------ INSERT DE REPARACIONES



INSERT INTO REPARACIONES(id_reparacion,id_instrumento,id_tipo_reparacion,costo)VALUES(1,1,11,1000);
INSERT INTO REPARACIONES(id_reparacion,id_instrumento,id_tipo_reparacion,costo)VALUES(2,2,3,500);
INSERT INTO REPARACIONES(id_reparacion,id_instrumento,id_tipo_reparacion,costo)VALUES(3,3,3,500);
INSERT INTO REPARACIONES(id_reparacion,id_instrumento,id_tipo_reparacion,costo)VALUES(4,5,10,1625);
INSERT INTO REPARACIONES(id_reparacion,id_instrumento,id_tipo_reparacion,costo)VALUES(5,6,10,1625);
INSERT INTO REPARACIONES(id_reparacion,id_instrumento,id_tipo_reparacion,costo)VALUES(6,11,7,4500);
INSERT INTO REPARACIONES(id_reparacion,id_instrumento,id_tipo_reparacion,costo)VALUES(7,15,9,2500);
INSERT INTO REPARACIONES(id_reparacion,id_instrumento,id_tipo_reparacion,costo)VALUES(8,16,9,2500);
INSERT INTO REPARACIONES(id_reparacion,id_instrumento,id_tipo_reparacion,costo)VALUES(9,11,3,2250);
INSERT INTO REPARACIONES(id_reparacion,id_instrumento,id_tipo_reparacion,costo)VALUES(10,17,12,12850);
INSERT INTO REPARACIONES(id_reparacion,id_instrumento,id_tipo_reparacion,costo)VALUES(11,18,1,9200);
INSERT INTO REPARACIONES(id_reparacion,id_instrumento,id_tipo_reparacion,costo)VALUES(12,19,3,2000);
INSERT INTO REPARACIONES(id_reparacion,id_instrumento,id_tipo_reparacion,costo)VALUES(13,27,10,3100);
INSERT INTO REPARACIONES(id_reparacion,id_instrumento,id_tipo_reparacion,costo)VALUES(14,28,10,3100);
INSERT INTO REPARACIONES(id_reparacion,id_instrumento,id_tipo_reparacion,costo)VALUES(15,9,8,2000);
INSERT INTO REPARACIONES(id_reparacion,id_instrumento,id_tipo_reparacion,costo)VALUES(16,30,11,4500);
INSERT INTO REPARACIONES(id_reparacion,id_instrumento,id_tipo_reparacion,costo)VALUES(17,20,6,4780);
INSERT INTO REPARACIONES(id_reparacion,id_instrumento,id_tipo_reparacion,costo)VALUES(18,21,8,2500);
INSERT INTO REPARACIONES(id_reparacion,id_instrumento,id_tipo_reparacion,costo)VALUES(19,22,8,2500);
INSERT INTO REPARACIONES(id_reparacion,id_instrumento,id_tipo_reparacion,costo)VALUES(20,23,1,3100);
INSERT INTO REPARACIONES(id_reparacion,id_instrumento,id_tipo_reparacion,costo)VALUES(21,24,4,3240);
INSERT INTO REPARACIONES(id_reparacion,id_instrumento,id_tipo_reparacion,costo)VALUES(22,14,8,1300);





------VISTAS DE LA BASE DE DATOS-------------------------------------------



Vista -1/ Descripcion 

Se necesita llevar a cabo Un registro de todos los instrumentos utilizados en los distintos consultorios de la Clínica Dental DentisLL, para ellos deberá mostrar los siguientes Datos,
Identificador, Nombre, Nro_Serie, Marca y País de Origen de dichos Instrumentos, también cuando fue que se los Adquirido, ultima resion que tuvieron y cuando se los volverá a chequear,
También Mostar A que Consultorio pertenecen y el Nombre y Apellido del Dentista a cargo de él, como así también su Especialidad dentro de la Clínica. Listar solo aquellos Instrumentos 
que fueron comprados en el año 2016, que no tengas campos vacíos y que en las Especialidades Muestre solo los datos que estén entre la Letra M y Z y Ordenar Alfabéticamente el Nombre de
Dicho Instrumento. Rotular 


TABLAS UTILIZADAS:   
* INSTRUMENTOS_CONSULTORIO
* INSTRUMENTOS 
* MARCAS
* PAISES 
* DENTISTAS
* CONSULTORIOS 
* ESPECIALIDADES 
* CLINICAS



CREATE OR REPLACE VIEW vista_instrumentos AS

SELECT IC.id_instrumento_consultorio AS 'IDENTIFICADOR IC',I.nombre AS 'NOMBRE',I.nro_serie AS 'NRO_SERIE',M.marca AS 'MARCA',P.descripcion AS 'ORIGEN',
C.descripcion AS 'NOMBRE CONSULTORIO',CONCAT(D.apellido, ' ', D.nombre) AS 'DENTISTA',E.descripcion AS 'ESPECIALIDAD',I.fecha_adquisicion AS 'ADQUISICION',
I.fecha_ult_revision AS 'ULT- REVISION',I.fecha_proxima_revision AS 'PROX -REVISION'
FROM INSTRUMENTOS_CONSULTORIOS IC,INSTRUMENTOS I,MARCAS M,PAISES P,DENTISTAS D,CONSULTORIOS C,ESPECIALIDADES E,CLINICAS CL
WHERE IC.id_instrumento = I.id_instrumento
AND IC.nro_dentista = D.nro_dentista
AND IC.id_consultorio = C.id_consultorio
AND I.id_marca = M.id_marca
AND I.id_pais = P.id_pais
AND D.id_especialidad = E.id_especialidad
AND C.id_clinica = CL.id_clinica
AND YEAR(I.fecha_adquisicion) IN (2016)
AND I.fecha_proxima_revision IS NOT NULL
AND E.descripcion BETWEEN 'M' AND 'Z'
ORDER BY I.nombre DESC;


-----------------------------------------------------------------------------------------------------------------------

Vista- 2




“Se quiere saber de la clínica dental: Las facturas con los campos (nro_factura, fecha), el nombre de la clínica,
el nombre completo del dentista en una sola columna y lo mismo con el paciente.
Del paciente también se requieren las formas de contacto y qué procedimiento odontológico se hizo,
el precio en el detalle factura y la forma en que pagó el procedimiento.
Agregar un alias a los campos que sean necesarios.
La fecha de la factura no tiene que ser de los años 
(2020, 2021 y 2022), el precio en el detalle factura tiene que ser inferior a 100000
y la inicial del nombre de los pacientes tienen que estar entre la 'A' y la 'M'.
El orden tiene que ser por las fechas más recientes y por apellido del paciente. y un tope máximo de 15 pacientes.”


TABLAS UTILIZADAS:
* FACTURAS
* CLINICAS
* PACIENTES 
* DENTISTAS
* DETALLES_FACTURAS
* PROCEDIMIENTOS_ODONTOLOGICOS
* FACTURAS_FORMAS_PAGOS
* FORMAS_DE_PAGOS



CREATE OR REPLACE VIEW vista_facturas AS
SELECT 
    F.NRO_FACTURA,F.FECHA,C.nombre AS CLINICA,CONCAT(D.apellido, ', ', D.nombre) AS DENTISTA,
    CONCAT(P.apellido, ', ', P.nombre) AS PACIENTES,P.NRO_TELEFONO,P.EMAIL,PO.nombre AS PROCEDIMIENTO,
    DF.PRECIO,FP.descripcion AS FORMA_PAGO
FROM 
    FACTURAS F
    INNER JOIN CLINICAS C ON F.id_clinica = C.id_clinica
    INNER JOIN PACIENTES P ON F.id_paciente = P.id_paciente
    INNER JOIN DENTISTAS D ON F.nro_dentista = D.nro_dentista
    INNER JOIN DETALLE_FACTURAS DF ON DF.nro_factura = F.nro_factura
    INNER JOIN PROCEDIMIENTOS_ODONTOLOGICOS PO ON DF.id_proc_odontologico = PO.id_proc_odontologico
    INNER JOIN FACTURAS_FORMAS_PAGOS FFP ON FFP.nro_factura = F.nro_factura
    INNER JOIN FORMAS_DE_PAGOS FP ON FFP.id_forma_pago = FP.id_forma_pago
WHERE 
    YEAR(F.fecha) NOT IN (2020, 2021, 2022)
    AND DF.precio < 100000
    AND P.nombre BETWEEN 'A' AND 'O'
ORDER BY 
    F.fecha DESC
LIMIT 15;

------------------------------------------------------------------------------------------------------------------

FUNCIONES:


A través de la siguiente función vamos a poder determinar con el ingreso de un  numero,
quien fue el paciente que se atendió y cual fue su dentista de cabecera, 
esto nos permitirá brindar un mejor seguimiento para poder brindarle al paciente un diagnostico  completo. 
Con el tratamiento que realizo y cual fue su dentista a cargo del mismo.
Estaremos Implementando la Tabla de (Facturas Pacientes  y Dentistas)  de  esta manera estaremos uniendo ,
 tablas mediante un JOIN  el cual nos permitirá obtener una función  de acuerdo a lo realizado. 


CREATE DEFINER=`root`@`localhost` FUNCTION `obtener_paciente_y_dentista`(nro_factura_param INT) RETURNS varchar(255) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE paciente_dentista VARCHAR(255);

    SELECT CONCAT('Paciente: ', p.nombre, ' ', p.apellido, ', Dentista: ', d.nombre, ' ', d.apellido)
    INTO paciente_dentista
    FROM facturas f
    JOIN pacientes p ON f.id_paciente = p.id_paciente
    JOIN dentistas d ON f.nro_dentista = d.nro_dentista
    WHERE f.nro_factura = nro_factura_param;

    RETURN paciente_dentista;
END



-----------------------------------------------------------------------------------------------------------------------------



STORED PROCEDURE:




Mediante el siguiente Stored Procedure vamos a poder llevar un control mas registrado de todos los procedimientos que se practican o que se llevan a cabo en la Clínica DENTISLL. Esto nos traerá muchos beneficios ya que podremos evaluar el precio de dichos procedimientos y llevar un control y modificar en caso que el tratamiento aumente su valor, de todas formas, también llevar a cabo promociones a nuestros clientes para que puedan beneficiarse y realizarse mas de un tratamiento.
Esto va a incrementar el trabajo de los dentistas y por en de vamos a obtener un mejor trabajo  mas practicidad y satisfacción de nuestros pacientes. Y lograr que en un futuro, aumente la capacidad de clientes y expandir la clínica.
Se trabajo sobre la Tabla de Procedimientos_Odontologicos que tiene los campos de (Id_procedimiento , Nombre , Precio ).



CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_procedimientos`(IN precio_minimo DECIMAL(10,2), IN precio_maximo DECIMAL(10,2))
BEGIN
    SELECT 
        id_proc_odontologico AS ID_PROCEDIMIENTO,
        nombre AS NOMBRE,
        precio AS PRECIO
    FROM
        procedimientos_odontologicos
    WHERE
        precio BETWEEN precio_minimo AND precio_maximo
    ORDER BY
        nombre ASC;
END


call centro_odontologico.sp_get_procedimientos(50000, 180000);


-----------------------------------------------------------------------------------------------------------------------------------------

TRIGGERS:


Este trigger, llamado Tr_Insertar_Facturas, se activará después de insertar una fila en la tabla Productos. Su objetivo es insertar una nueva fila en la tabla FACTURAS con los siguientes valores:

nro_factura: El valor de nro_factura de la fila recién insertada en Facturas
fecha: La fecha actual obtenida mediante la función CURDATE().
id_clinica: El valor de id_clinica de la fila recién insertada en Facturas.
id_paciente: El valor de id_paciente de la fila recién insertada en Facturas.
nro_dentista: El valor de nro_dentista de la fila recién insertada en Facturas.
En resumen, cada vez que se inserta un nuevo producto, este trigger asegura que se registre automáticamente una nueva factura en la tabla FACTURAS con la información correspondiente.
Asi se mantendrá Actualizada la BD garantizando  automatización , que ahorrara tiempo  y mantendra la seguridad e integridad de los Datos que se almacenan en la BD Centro_Odontologico.






DELIMITER //

CREATE TRIGGER Tr_Insertar_Facturas AFTER INSERT ON Facturas
FOR EACH ROW
BEGIN
    INSERT INTO FACTURAS (nro_factura, fecha, id_clinica, id_paciente, nro_dentista)
    VALUES (NEW.nro_factura, CURDATE(), NEW.id_clinica, NEW.id_paciente, NEW.nro_dentista);
END//

DELIMITER ;













































