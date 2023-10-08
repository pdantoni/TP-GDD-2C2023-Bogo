
------------ Creación del esquema ---------------
------------------------------------------------
CREATE SCHEMA BOGO;
GO

------------ Definicion de datos ---------------
------------------------------------------------

CREATE TABLE BOGO.Sucursal
( 
	codigo_sucursal INT PRIMARY KEY IDENTITY(1,1), 
    telefono VARCHAR(20), 
    direccion VARCHAR(150),
    nombre VARCHAR(150),
)

CREATE TABLE BOGO.Pago_por_venta
( 
	codigo_pago_por_venta INT PRIMARY KEY IDENTITY(1,1), 
    importe_del_pago FLOAT, 
    cotizacion FLOAT,
)

CREATE TABLE BOGO.Comprador
( 
	codigo_comrpador INT PRIMARY KEY IDENTITY(1,1), 
    nombre VARCHAR(150),
	apellido VARCHAR(150),
	numero_de_DNI VARCHAR(150),
	direccion VARCHAR(150),
	telefono VARCHAR(150),
	fecha_de_nacimiento DATETIME,
	mail VARCHAR(150),
)  

CREATE TABLE BOGO.Localidad
( 
	codigo_localidad INT PRIMARY KEY IDENTITY(1,1), 
    nombre VARCHAR(150),
)  

CREATE TABLE BOGO.Provincia
( 
	codigo_provincia INT PRIMARY KEY IDENTITY(1,1), 
    nombre VARCHAR(150),
)  

CREATE TABLE BOGO.Caracteristica
( 
	codigo_caracteristica INT PRIMARY KEY IDENTITY(1,1), 
    nombre VARCHAR(150),
)  

CREATE TABLE BOGO.Inmueble
(
    numero_de_inmueble INT PRIMARY KEY IDENTITY (1,1),
    descripcion VARCHAR(150),
    direccion VARCHAR(150),
    ambientes INT,
    superficie FLOAT,
    fecha_de_construccion DATETIME,
    expensas FLOAT,
    nombre VARCHAR(150),
)

CREATE TABLE BOGO.Tipo_periodo
( 
    codigo_tipo_periodo INT PRIMARY KEY IDENTITY (1,1), 
    descripcion VARCHAR(150), 
)

CREATE TABLE BOGO.Estado_anuncio
( 
    codigo_estado INT PRIMARY KEY IDENTITY (1,1), 
    descripcion VARCHAR(150), 
)

CREATE TABLE BOGO.Alquiler
( 
    codigo_alquiler INT PRIMARY KEY IDENTITY (1,1), 
    fecha_de_inicio DATETIME,
    fecha_de_fin DATETIME,
    duracion INT,
    deposito FLOAT,
    comision FLOAT,
    gastos_de_averiguaciones FLOAT,
)

CREATE TABLE BOGO.Tipo_Inmueble
( 
    codigo_tipo_inmueble INT PRIMARY KEY IDENTITY (1,1), 
    nombre VARCHAR(150), 
)

--20
CREATE TABLE BOGO.Disposicion
( 
    codigo_disposicion INT PRIMARY KEY IDENTITY(1,1),
    descripcion VARCHAR(150), 
)

--21
CREATE TABLE BOGO.Orientacion
( 
    codigo_orientacion INT PRIMARY KEY IDENTITY(1,1), 
    descripcion VARCHAR(150), 
)

--22
CREATE TABLE BOGO.Estado
( 
    codigo_estado INT PRIMARY KEY IDENTITY(1,1), 
    descripcion VARCHAR(150), 
)

--23
CREATE TABLE BOGO.PagoDeAlquiler
( 
    codigo_pago_de_alquiler INT PRIMARY KEY IDENTITY(1,1),
    alquiler INT,
    fecha_de_pago datetime,
    numero_de_periodo_de_pago INT,
    descripcion VARCHAR(150),
    fecha_de_inicio_periodo_de_pago datetime,
    fecha_de_fin_periodo_de_pago datetime,
    importe FLOAT,
    medio_de_pago INT
)

--24
CREATE TABLE BOGO.Periodo
( 
    codigo_periodo INT PRIMARY KEY IDENTITY(1,1), 
    numero_periodo_de_inicio INT,
    numero_periodo_de_fin INT,
    precio FLOAT
)

--25
CREATE TABLE BOGO.Inquilino
( 
    codigo_inquilino INT PRIMARY KEY IDENTITY(1,1), 
    nombre VARCHAR(150),
    apellido VARCHAR(150),
    numero_de_dni VARCHAR(150),
    direccion VARCHAR(150),
    localidad INT,
    telefono VARCHAR(150),
    fecha_de_nacimiento datetime,
    mail VARCHAR(150) 
)

--26
CREATE TABLE BOGO.EstadoAlquiler
( 
    codigo_estado_alquiler INT PRIMARY KEY IDENTITY(1,1), 
    descripcion VARCHAR(150), 
)

--27
CREATE TABLE BOGO.MedioDePAgo
( 
    codigo_medio_de_pago INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(150), 
)

create table BOGO.Agente_Inmobiliario(
codigo_agente int PRIMARY KEY identity(1,1),
nombre Varchar(30),
apellido Varchar(30),
sucursal int,
dni Varchar(30),
direccion Varchar(30),
localidad int,
telefono Varchar(30),
fecha_nacimiento Datetime,
mail varchar
)
go

Create table BOGO.Moneda(
codigo_moneda int Primary key Identity(1,1),
descripcion Varchar(30)
)
go

create table BOGO.Venta(
codigo_de_venta int Primary key  Identity(1,1,
anuncio int,
comprador int,
fecha_de_venta Datetime,
precio_venta float,
moneda int,
comision_inmobiliaria float
)
go

create table BOGO.Propietario(
codigo_propietario int Primary key Identity(1,1),
nombre Varchar(30),
apellido Varchar(30),
dni int,
direccion Varchar(30),
localidad int,
telefono Varchar(30),
fecha_nacimiento Datetime,
mail Varchar(30)
)
go

create table BOGO.Barrio(
codigo_barrio int Primary key identity(1,1),
nombre varchar(30),
localidad int 
)
go

create table BOGO.Operacion(
codigo_operacion int Primary Key identity(1,1),
nombre Varchar(30)
)

create table BOGO.Anuncio(
	numero_anuncio int primary key identity(1,1),
	fecha_publicacion datetime,
	agente_inmobiliario int,
	tipo_operacion int,
	inmueble int,
	precio_inmueble float,
	moneda int,
	tipo_periodo int,
	estado_anuncio int,
	fecha_finalizacion datetime,
	costo_publicacion float
)
go

------------ Creacion de FK

ALTER TABLE BOGO.sucursal
	ADD FOREIGN KEY (localidad) REFERENCES BOGO.localidad(codigo_localidad);
GO

ALTER TABLE BOGO.Pago_por_venta
	ADD FOREIGN KEY(venta) REFERENCES BOGO.venta(codigo_de_venta),
		FOREIGN KEY(moneda) REFERENCES BOGO.moneda(codigo_moneda),
		FOREIGN KEY(medio_de_pago) REFERENCES BOGO.medio_de_pago(codigo_medio_de_pago);
GO

ALTER TABLE BOGO.Comprador
	ADD FOREIGN KEY(localidad) REFERENCES BOGO.localidad(codiog_localidad);
GO

ALTER TABLE BOGO.Localidad
	ADD FOREIGN KEY(provincia) REFERENCES BOGO.Barrio(codigo_barrio);
GO

-- 23 FK
ALTER TABLE BOGO.PagoDeAlquiler
    ADD FOREIGN KEY(alquiler) REFERENCES BOGO.Alquiler(codigo_alquiler),
    FOREIGN KEY(medio_de_pago) REFERENCES BOGO.MedioDePago(codigo_medio_de_pago);
GO

-- 24 FK
ALTER TABLE BOGO.Periodo
    ADD FOREIGN KEY(alquiler) REFERENCES BOGO.Alquiler(codigo_alquiler);
GO

-- 25 FK
ALTER TABLE BOGO.PagoDeAlquiler
    ADD FOREIGN KEY(localidad) REFERENCES BOGO.Localidad(codigo_localidad);
GO
