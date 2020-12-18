

Create database EjerciciosHotel;
go

use EjerciciosHotel;

CREATE TABLE  Tipo_Servicio  (
  NombreServicio  char(10) NOT NULL,
  PRIMARY KEY  ( NombreServicio )
) ;

 

INSERT INTO  Tipo_Servicio  VALUES ('Comedor');
INSERT INTO  Tipo_Servicio  VALUES ('Lavandería');


CREATE TABLE  Paises  (
  País  char(20) NOT NULL,
  PRIMARY KEY  ( País )
) ;

 
INSERT INTO  Paises  VALUES ('Alemania');
INSERT INTO  Paises  VALUES ('España');
INSERT INTO  Paises  VALUES ('Francia');
INSERT INTO  Paises  VALUES ('Portugal');



CREATE TABLE Clientes (
   ID_Cliente  char(12) NOT NULL,
   País  char(20) NOT NULL,
   Nombre  char(12) NOT NULL,
   Apellido1  char(12) NOT NULL,
   Apellido2  char(12) ,
   Direccion  char(30) NOT NULL,
   Telefono  char(12) NOT NULL,
   Observaciones  char(50) ,
  PRIMARY KEY  ( ID_Cliente ),
  FOREIGN KEY  (País) references paises (País) );

 

INSERT INTO  Clientes  VALUES ('12345', 'España', 'Felipe', 'Iglesias', 'López', 'Avda Los Castros, 44', '942344444', 'Buen cliente');
INSERT INTO  Clientes  VALUES ('44444', 'España', 'Luis', 'García', 'García', 'Calle Mayor, 67 ', '942456444', null);
INSERT INTO  Clientes  VALUES ('456789', 'Francia', 'Ludovic', 'Giuly', 'Bourquin', '18 avenue Alsacen Cour', '37890194', null);



CREATE TABLE  Tipo_Hab  (
   Categoria   int NOT NULL ,
   Camas  int  NOT NULL,
   Exterior  char(2) NOT NULL check (Exterior in ('SI', 'NO')),
   Salon  char(2) NOT NULL check (Salon in ('SI', 'NO')),
   Terraza  char(2) NOT NULL check (Terraza in ('SI', 'NO')),
  PRIMARY KEY  ( Categoria )
) ;

 


INSERT INTO  Tipo_Hab  VALUES (1, 1, 'SI', 'NO', 'NO');
INSERT INTO  Tipo_Hab  VALUES (2, 2, 'SI', 'NO', 'NO');
INSERT INTO  Tipo_Hab  VALUES (3, 3, 'SI', 'NO', 'NO');
INSERT INTO  Tipo_Hab  VALUES (4, 1, 'SI', 'SI', 'NO');

 

CREATE TABLE  Habitaciones  (
  NumHABITACION  int  NOT NULL,
  Tipo_Hab  int NOT NULL,
  PRIMARY KEY  ( NumHABITACION ),
  Foreign key (Tipo_Hab) references Tipo_Hab ( Categoria )
) ;

 
 

INSERT INTO  Habitaciones  VALUES (101, 1);
INSERT INTO  Habitaciones  VALUES (102, 1);
INSERT INTO  Habitaciones  VALUES (103, 1);
INSERT INTO  Habitaciones  VALUES (104, 2);
INSERT INTO  Habitaciones  VALUES (105, 2);
INSERT INTO  Habitaciones  VALUES (106, 3);
INSERT INTO  Habitaciones  VALUES (107, 4);


CREATE TABLE  Servicios  (
   ID_Servicios  int NOT NULL ,
   NombreSERVICIO  char(10) NOT NULL,
   Descripcion  char(30) NOT NULL,
   Precio  money NOT NULL,
   IVA  numeric (5,2) NOT NULL,
   Fecha  date NOT NULL,
  PRIMARY KEY  ( ID_Servicios ),
  foreign key (nombreServicio) references tipo_servicio ( NombreSERVICIO )
) ;

 set dateformat ymd;

INSERT INTO  Servicios  VALUES (1, 'Comedor', '1 menu del Dia', 10, 7, '2009-01-01');
INSERT INTO  Servicios  VALUES (2, 'Lavandería', 'Lavado de Camisa', 2, 7, '2009-01-01');
INSERT INTO  Servicios  VALUES (3, 'Lavandería', 'Lavado de pantalon', 1, 7, '2009-01-01');

  

CREATE TABLE  Temporada  (
   TEMPORADA  int NOT NULL ,
   FechaINICIO  date NOT NULL,
   FechaFINAL  date NOT NULL,
   Tipo  char(1) not null check (tipo in ('B','M','A')) ,
  PRIMARY KEY  ( TEMPORADA )
) ;

 set dateformat ymd
INSERT INTO  Temporada  VALUES (1, '2009-01-01', '2009-03-31', 'B');
INSERT INTO  Temporada  VALUES (2, '2009-04-01', '2009-05-31', 'M');
INSERT INTO  Temporada  VALUES (3, '2009-06-01', '2009-08-31', 'A');
INSERT INTO  Temporada  VALUES (4, '2009-09-01', '2009-10-31', 'M');
INSERT INTO  Temporada  VALUES (5, '2009-11-01', '2009-12-31', 'B');




CREATE TABLE  Precio_Hab  (
   ID_Precio  int NOT NULL ,
   Precio  money NOT NULL,
   TEMPORADA int NOT NULL,
   TIPO_HABITACION  int NOT NULL,
  PRIMARY KEY  ( ID_Precio ),
  foreign key (temporada) references temporada(temporada),
  foreign key (tipo_habitacion) references Tipo_Hab(categoria )
) ;

 
INSERT INTO  Precio_Hab  VALUES (1, 30, 1, 1);
INSERT INTO  Precio_Hab  VALUES (2, 35, 2, 1);
INSERT INTO  Precio_Hab  VALUES (3, 40, 3, 1);
INSERT INTO  Precio_Hab  VALUES (4, 35, 4, 1);
INSERT INTO  Precio_Hab  VALUES (5, 30, 5, 1);
INSERT INTO  Precio_Hab  VALUES (6, 35, 1, 2);
INSERT INTO  Precio_Hab  VALUES (7, 40, 2, 2);
INSERT INTO  Precio_Hab  VALUES (8, 45, 3, 2);
INSERT INTO  Precio_Hab  VALUES (9, 40, 4, 2);
INSERT INTO  Precio_Hab  VALUES (10, 35, 5, 2);
INSERT INTO  Precio_Hab  VALUES (11, 40, 1, 3);
INSERT INTO  Precio_Hab  VALUES (12, 45, 2, 3);
INSERT INTO  Precio_Hab  VALUES (13, 50, 3, 3);
INSERT INTO  Precio_Hab  VALUES (14, 45, 4, 3);
INSERT INTO  Precio_Hab  VALUES (15, 40, 5, 3);
INSERT INTO  Precio_Hab  VALUES (16, 50, 1, 4);
INSERT INTO  Precio_Hab  VALUES (17, 55, 2, 4);
INSERT INTO  Precio_Hab  VALUES (18, 60, 3, 4);
INSERT INTO  Precio_Hab  VALUES (19, 55, 4, 4);
INSERT INTO  Precio_Hab  VALUES (20, 50, 5, 4);


CREATE TABLE  Reserva  (
   ID_Reserva  numeric identity(1,1) NOT NULL ,
   FechaENTRADA  date NOT NULL,
   FechaSALIDA  date NOT NULL,
   IVA  numeric(5,2) NOT NULL,
   Nº_Hab  int NOT NULL,
   CLIENTE  char(12) NOT NULL,
   PRIMARY KEY  ( ID_Reserva )  ,
   foreign KEY  (cliente) references CLIENTES (ID_Cliente ),
  foreign key (Nº_Hab) references Habitaciones (NumHABITACION )
) ;

INSERT INTO  Reserva   (FechaENTRADA , FechaSALIDA  , IVA , Nº_Hab  , CLIENTE)
VALUES ( '2009-03-15', '2009-03-25', 0.07,101, '12345');
INSERT INTO  Reserva (FechaENTRADA , FechaSALIDA  , IVA , Nº_Hab  , CLIENTE)
 VALUES ( '2009-03-15', '2009-03-25', 0.07, 102, '12345');
INSERT INTO  Reserva (FechaENTRADA , FechaSALIDA  , IVA , Nº_Hab  , CLIENTE)
 VALUES ( '2009-02-16', '2009-02-21', 0.07,103, '12345');
INSERT INTO  Reserva  (FechaENTRADA , FechaSALIDA  , IVA , Nº_Hab  , CLIENTE)
VALUES ( '2009-03-16', '2009-03-21', 0.07,104, '44444');
INSERT INTO  Reserva (FechaENTRADA , FechaSALIDA  , IVA , Nº_Hab  , CLIENTE)
 VALUES ( '2009-03-16', '2009-03-21', 0.07,105, '44444');
INSERT INTO  Reserva  (FechaENTRADA , FechaSALIDA  , IVA , Nº_Hab  , CLIENTE)
VALUES ( '2009-03-16', '2009-03-21', 0.07,106, '44444');
INSERT INTO  Reserva (FechaENTRADA , FechaSALIDA  , IVA , Nº_Hab  , CLIENTE)
 VALUES ( '2009-03-16', '2009-03-21', 0.07,107, '44444');



CREATE TABLE  Gastos  (
   ID_Gastos  int identity NOT NULL ,
   ID_Reserva  numeric NOT NULL,
   ID_Servicios  int NOT NULL,
   Fecha  datetime NOT NULL,
   Cantidad  int NOT NULL, 
   Precio money  not null,
  PRIMARY KEY  ( ID_Gastos ),
  foreign KEY  (ID_Reserva) references Reserva  (ID_Reserva ),
  foreign key (ID_Servicios ) references SERVICIOS (ID_Servicios )
)  ;

set IDENTITY_INSERT dbo.gastos on

INSERT INTO  Gastos  ( ID_Gastos,ID_Reserva  , ID_Servicios  ,Fecha ,Cantidad ,Precio)
VALUES ( 1,1,1, '2009-03-15 12:00', 1,10);
INSERT INTO  Gastos  ( ID_Gastos,ID_Reserva  , ID_Servicios  ,Fecha ,Cantidad ,Precio)
VALUES (2, 1,1,  '2009-03-15 11:00', 1,10);
INSERT INTO  Gastos  (ID_Gastos, ID_Reserva  , ID_Servicios  ,Fecha ,Cantidad ,Precio)
VALUES (3, 4, 2, '2009-03-15 09:30', 1,2);

set IDENTITY_INSERT dbo.Gastos off


 


