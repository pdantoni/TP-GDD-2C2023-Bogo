
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
	localidad INT, -- fk
)

CREATE TABLE BOGO.Pago_por_venta
( 
	codigo_pago_por_venta INT PRIMARY KEY IDENTITY(1,1), 
    importe_del_pago FLOAT, 
    cotizacion FLOAT,
	venta INT, --fk
	moneda INT, --fk
	medio_de_pago INT, --fk
)

CREATE TABLE BOGO.Comprador
( 
	codigo_comprador INT PRIMARY KEY IDENTITY(1,1), 
    nombre VARCHAR(150),
	apellido VARCHAR(150),
	numero_de_DNI VARCHAR(150),
	direccion VARCHAR(150),
	telefono VARCHAR(150),
	fecha_de_nacimiento DATETIME,
	mail VARCHAR(150),
	localidad INT, --fk
)  

CREATE TABLE BOGO.Localidad
( 
	codigo_localidad INT PRIMARY KEY IDENTITY(1,1), 
    nombre VARCHAR(150),
	provincia INT, --fk
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
	tipo_inmueble INT, --fk
	propietario INT, --fk
	barrio INT, --fk
	disposicion INT, --fk
	orientacion INT, --fk
	estado INT, --fk
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
	anuncio INT, --fk
	inquilino INT, --fk
)

drop table bogo.alquiler

ALTER TABLE BOGO.Alquiler
	ADD estado_alquiler INT

CREATE TABLE BOGO.Tipo_Inmueble
( 
    codigo_tipo_inmueble INT PRIMARY KEY IDENTITY (1,1), 
    nombre VARCHAR(150), 
)

CREATE TABLE BOGO.Disposicion
( 
    codigo_disposicion INT PRIMARY KEY IDENTITY(1,1),
    descripcion VARCHAR(150), 
)

CREATE TABLE BOGO.Orientacion
( 
    codigo_orientacion INT PRIMARY KEY IDENTITY(1,1), 
    descripcion VARCHAR(150), 
)

CREATE TABLE BOGO.Estado
( 
    codigo_estado INT PRIMARY KEY IDENTITY(1,1), 
    descripcion VARCHAR(150), 
)

CREATE TABLE BOGO.Pago_de_alquiler
( 
    codigo_pago_de_alquiler INT PRIMARY KEY IDENTITY(1,1),
    alquiler INT, --fk
    fecha_de_pago datetime,
    numero_de_periodo_de_pago INT,
    descripcion VARCHAR(150),
    fecha_de_inicio_periodo_de_pago datetime,
    fecha_de_fin_periodo_de_pago datetime,
    importe FLOAT,
    medio_de_pago INT --fk
)

CREATE TABLE BOGO.Periodo
( 
    codigo_periodo INT PRIMARY KEY IDENTITY(1,1), 
    numero_periodo_de_inicio INT,
    numero_periodo_de_fin INT,
    precio FLOAT,
	alquiler INT --fk
)

CREATE TABLE BOGO.Inquilino
( 
    codigo_inquilino INT PRIMARY KEY IDENTITY(1,1), 
    nombre VARCHAR(150),
    apellido VARCHAR(150),
    numero_de_dni VARCHAR(150),
    direccion VARCHAR(150),
    localidad INT, --fk
    telefono VARCHAR(150),
    fecha_de_nacimiento datetime,
    mail VARCHAR(150) 
)

CREATE TABLE BOGO.Estado_alquiler
( 
    codigo_estado_alquiler INT PRIMARY KEY IDENTITY(1,1), 
    descripcion VARCHAR(150), 
)

CREATE TABLE BOGO.Medio_de_pago
( 
    codigo_medio_de_pago INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(150), 
)

CREATE TABLE BOGO.Agente_inmobiliario(
	codigo_agente int PRIMARY KEY identity(1,1),
	nombre Varchar(30),
	apellido Varchar(30),
	sucursal int, --fk
	dni Varchar(30),
	direccion Varchar(30),
	localidad int, --fk
	telefono Varchar(30),
	fecha_nacimiento Datetime,
	mail varchar
)
go

CREATE TABLE BOGO.Moneda(
	codigo_moneda int Primary key Identity(1,1),
	descripcion Varchar(30)
)
go

CREATE TABLE BOGO.Venta(
	codigo_de_venta int Primary key Identity(1,1),
	anuncio int, --fk
	comprador int, --fk
	fecha_de_venta Datetime,
	precio_venta float,
	moneda int, --fk
	comision_inmobiliaria float
)
go

CREATE TABLE BOGO.Propietario(
	codigo_propietario int Primary key Identity(1,1),
	nombre Varchar(30),
	apellido Varchar(30),
	dni int,
	direccion Varchar(30),
	localidad int, --fk
	telefono Varchar(30),
	fecha_nacimiento Datetime,
	mail Varchar(30)
)
go

CREATE TABLE BOGO.Barrio(
	codigo_barrio int Primary key identity(1,1),
	nombre varchar(30),
	localidad int --fk
)
go

CREATE TABLE BOGO.Operacion(
	codigo_operacion int Primary Key identity(1,1),
	nombre Varchar(30)
)

CREATE TABLE BOGO.Anuncio(
	numero_anuncio int primary key identity(1,1),
	fecha_publicacion datetime,
	agente_inmobiliario int, --fk
	tipo_operacion int, --fk
	inmueble int, --fk
	precio_inmueble float,
	moneda int, --fk
	tipo_periodo int, --fk
	estado_anuncio int, --fk
	fecha_finalizacion datetime,
	costo_publicacion float
)
go

CREATE TABLE BOGO.Caracteristica_por_inmueble
(
	codigo_caracteristica INT,
	Numero_de_inmueble INT,
	PRIMARY KEY (codigo_caracteristica, Numero_de_inmueble)
)

------------ Creacion de FK
----------------------------------------------
ALTER TABLE BOGO.sucursal
	ADD FOREIGN KEY(localidad) REFERENCES BOGO.Localidad(codigo_localidad);
GO

ALTER TABLE BOGO.Pago_por_venta
	ADD FOREIGN KEY(venta) REFERENCES BOGO.venta(codigo_de_venta),
		FOREIGN KEY(moneda) REFERENCES BOGO.moneda(codigo_moneda),
		FOREIGN KEY(medio_de_pago) REFERENCES BOGO.medio_de_pago(codigo_medio_de_pago);
GO

ALTER TABLE BOGO.Comprador
	ADD FOREIGN KEY(localidad) REFERENCES BOGO.localidad(codigo_localidad);
GO

ALTER TABLE BOGO.Localidad
	ADD FOREIGN KEY(provincia) REFERENCES BOGO.Provincia(codigo_provincia);
GO

-- 23 FK 
ALTER TABLE BOGO.Pago_de_alquiler
    ADD FOREIGN KEY(alquiler) REFERENCES BOGO.Alquiler(codigo_alquiler),
		FOREIGN KEY(medio_de_pago) REFERENCES BOGO.Medio_de_pago(codigo_medio_de_pago);
GO

-- 24 FK
ALTER TABLE BOGO.Periodo
    ADD FOREIGN KEY(alquiler) REFERENCES BOGO.Alquiler(codigo_alquiler);
GO

-- 25 FK 
ALTER TABLE BOGO.Inquilino
    ADD FOREIGN KEY(localidad) REFERENCES BOGO.Localidad(codigo_localidad);
GO

ALTER TABLE BOGO.Inmueble
    ADD FOREIGN KEY(tipo_inmueble) REFERENCES BOGO.Tipo_Inmueble(codigo_tipo_inmueble),
        FOREIGN KEY(propietario) REFERENCES BOGO.Propietario(codigo_propietario),
        FOREIGN KEY(barrio) REFERENCES BOGO.Barrio(codigo_barrio),
        FOREIGN KEY(disposicion) REFERENCES BOGO.Disposicion(codigo_disposicion),
        FOREIGN KEY(orientacion) REFERENCES BOGO.Orientacion(codigo_orientacion),
        FOREIGN KEY(estado) REFERENCES BOGO.Estado(codigo_estado);
GO

ALTER TABLE BOGO.Alquiler
    ADD FOREIGN KEY(anuncio) REFERENCES BOGO.Anuncio(numero_anuncio),
        FOREIGN KEY(inquilino) REFERENCES BOGO.Inquilino(codigo_inquilino),
        FOREIGN KEY(estado_alquiler) REFERENCES BOGO.Estado_alquiler(codigo_estado_alquiler);
GO

Alter Table BOGO.Agente_Inmobiliario
    ADD FOREIGN KEY (sucursal) REFERENCES BOGO.Sucursal(codigo_sucursal),
    FOREIGN KEY(localidad) REFERENCES BOGO.Localidad(codigo_localidad);
go

Alter Table BOGO.Venta
    Add Foreign Key (anuncio) References BOGO.Anuncio(numero_anuncio),
    Foreign key (comprador) References BOGO.Comprador(codigo_comprador),
    Foreign key(moneda) References BOGO.Moneda(codigo_moneda)
go

Alter Table BOGO.Propietario 
  Add Foreign Key(localidad) References BOGO.Localidad(codigo_localidad);
  go

Alter Table BOGO.Barrio
    Add Foreign Key(localidad) References BOGO.Localidad(codigo_localidad);
go

Alter Table BOGO.Anuncio
    Add Foreign Key(agente_inmobiliario) References BOGO.Agente_Inmobiliario(codigo_agente),
    Foreign key(tipo_operacion) References BOGO.Operacion(codigo_operacion),
    Foreign key(inmueble) References BOGO.Inmueble(numero_de_inmueble),
    Foreign key(moneda) References BOGO.Moneda(codigo_moneda),
    Foreign key(tipo_periodo) References BOGO.Tipo_periodo(codigo_tipo_periodo),
    Foreign key(estado_anuncio) References BOGO.Estado_anuncio(codigo_estado);
go



