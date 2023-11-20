
USE [GD2C2023]

-- PARTE 1: borrado de tablas, funciones, procedures, vistas y esquema
-- PARTE 2: creaci�n de esquema, tablas y fk
-- PARTE 3: creaci�n de funciones
-- PARTE 4: creaci�n de procedures
-- PARTE 5: ejecuci�n de los procedures para migrar los datos

---------------------------------------------------------------------------------------------------
--                                            Parte 1                                            --
---------------------------------------------------------------------------------------------------

-- BORRADO DE TABLAS

IF OBJECT_ID('BOGO.Pago_alquiler', 'U') IS NOT NULL 
	DROP TABLE BOGO.Pago_alquiler

IF OBJECT_ID('BOGO.Periodo', 'U') IS NOT NULL 
	DROP TABLE BOGO.Periodo

IF OBJECT_ID('BOGO.Alquiler', 'U') IS NOT NULL 
	DROP TABLE BOGO.Alquiler

IF OBJECT_ID('BOGO.Pago_por_venta', 'U') IS NOT NULL 
	DROP TABLE BOGO.Pago_por_venta

IF OBJECT_ID('BOGO.Venta', 'U') IS NOT NULL 
	DROP TABLE BOGO.Venta

IF OBJECT_ID('BOGO.Anuncio', 'U') IS NOT NULL 
	DROP TABLE BOGO.anuncio

IF OBJECT_ID('BOGO.Caracteristica_por_inmueble', 'U') IS NOT NULL 
	DROP TABLE BOGO.Caracteristica_por_inmueble

IF OBJECT_ID('BOGO.Inmueble', 'U') IS NOT NULL 
	DROP TABLE BOGO.inmueble

IF OBJECT_ID('BOGO.Inquilino', 'U') IS NOT NULL 
	DROP TABLE BOGO.Inquilino

IF OBJECT_ID('BOGO.Agente_inmobiliario', 'U') IS NOT NULL 
	DROP TABLE BOGO.Agente_inmobiliario

IF OBJECT_ID('BOGO.Propietario', 'U') IS NOT NULL 
	DROP TABLE BOGO.Propietario

IF OBJECT_ID('BOGO.Comprador', 'U') IS NOT NULL 
	DROP TABLE BOGO.Comprador

IF OBJECT_ID('BOGO.Sucursal', 'U') IS NOT NULL 
	DROP TABLE BOGO.Sucursal



IF OBJECT_ID('BOGO.Moneda', 'U') IS NOT NULL 
	DROP TABLE BOGO.Moneda

IF OBJECT_ID('BOGO.Tipo_operacion', 'U') IS NOT NULL 
	DROP TABLE BOGO.Tipo_operacion

IF OBJECT_ID('BOGO.Tipo_periodo', 'U') IS NOT NULL 
	DROP TABLE BOGO.Tipo_periodo

IF OBJECT_ID('BOGO.Tipo_inmueble', 'U') IS NOT NULL 
	DROP TABLE BOGO.Tipo_inmueble

IF OBJECT_ID('BOGO.Disposicion', 'U') IS NOT NULL 
	DROP TABLE BOGO.Disposicion

IF OBJECT_ID('BOGO.Orientacion', 'U') IS NOT NULL 
	DROP TABLE BOGO.Orientacion

IF OBJECT_ID('BOGO.Estado', 'U') IS NOT NULL 
	DROP TABLE BOGO.Estado

IF OBJECT_ID('BOGO.Estado_alquiler', 'U') IS NOT NULL 
	DROP TABLE BOGO.Estado_alquiler

IF OBJECT_ID('BOGO.Medio_de_pago', 'U') IS NOT NULL 
	DROP TABLE BOGO.Medio_de_pago

IF OBJECT_ID('BOGO.Barrio', 'U') IS NOT NULL 
	DROP TABLE BOGO.Barrio

IF OBJECT_ID('BOGO.Caracteristica', 'U') IS NOT NULL 
	DROP TABLE BOGO.Caracteristica

IF OBJECT_ID('BOGO.Localidad', 'U') IS NOT NULL 
	DROP TABLE BOGO.Localidad

IF OBJECT_ID('BOGO.Provincia', 'U') IS NOT NULL 
	DROP TABLE BOGO.Provincia


-- BORRADO DE FUNCIONES
IF OBJECT_ID('BOGO.OBTENER_ID_PROVINCIA') IS NOT NULL 
	DROP FUNCTION BOGO.OBTENER_ID_PROVINCIA

IF OBJECT_ID('BOGO.OBTENER_ID_LOCALIDAD') IS NOT NULL 
	DROP FUNCTION BOGO.OBTENER_ID_LOCALIDAD

IF OBJECT_ID('BOGO.OBTENER_ID_BARRIO') IS NOT NULL 
	DROP FUNCTION BOGO.OBTENER_ID_BARRIO

IF OBJECT_ID('BOGO.OBTENER_ID_DISPOSICION') IS NOT NULL 
	DROP FUNCTION BOGO.OBTENER_ID_DISPOSICION

IF OBJECT_ID('BOGO.OBTENER_ID_ORIENTACION') IS NOT NULL 
	DROP FUNCTION BOGO.OBTENER_ID_ORIENTACION

IF OBJECT_ID('BOGO.OBTENER_ID_ESTADO') IS NOT NULL 
	DROP FUNCTION BOGO.OBTENER_ID_ESTADO

IF OBJECT_ID('BOGO.OBTENER_ID_TIPO_INMUEBLE') IS NOT NULL 
	DROP FUNCTION BOGO.OBTENER_ID_TIPO_INMUEBLE

IF OBJECT_ID('BOGO.OBTENER_ID_MONEDA') IS NOT NULL 
	DROP FUNCTION BOGO.OBTENER_ID_MONEDA

IF OBJECT_ID('BOGO.OBTENER_ID_MEDIO_DE_PAGO') IS NOT NULL 
	DROP FUNCTION BOGO.OBTENER_ID_MEDIO_DE_PAGO

IF OBJECT_ID('BOGO.OBTENER_ID_TIPO_OPERACION') IS NOT NULL 
	DROP FUNCTION BOGO.OBTENER_ID_TIPO_OPERACION

IF OBJECT_ID('BOGO.OBTENER_ID_TIPO_PERIODO') IS NOT NULL 
	DROP FUNCTION BOGO.OBTENER_ID_TIPO_PERIODO

IF OBJECT_ID('BOGO.OBTENER_ID_ESTADO_ANUNCIO') IS NOT NULL 
	DROP FUNCTION BOGO.OBTENER_ID_ESTADO_ANUNCIO

IF OBJECT_ID('BOGO.OBTENER_ID_ESTADO_ALQUILER') IS NOT NULL 
	DROP FUNCTION BOGO.OBTENER_ID_ESTADO_ALQUILER

IF OBJECT_ID('BOGO.OBTENER_INMUEBLE_CABLE') IS NOT NULL 
	DROP FUNCTION BOGO.OBTENER_INMUEBLE_CABLE


-- BORRADO DE PROCEDURES
IF OBJECT_ID('BOGO.migrar_Provincia') IS NOT NULL 
	DROP PROCEDURE BOGO.migrar_Provincia

IF OBJECT_ID('BOGO.migrar_Caracteristica') IS NOT NULL 
	DROP PROCEDURE BOGO.migrar_Caracteristica

IF OBJECT_ID('BOGO.migrar_Localidad') IS NOT NULL 
	DROP PROCEDURE BOGO.migrar_Localidad

IF OBJECT_ID('BOGO.migrar_Barrio') IS NOT NULL 
	DROP PROCEDURE BOGO.migrar_Barrio

IF OBJECT_ID('BOGO.migrar_Tipo_inmueble') IS NOT NULL 
	DROP PROCEDURE BOGO.migrar_Tipo_inmueble

IF OBJECT_ID('BOGO.migrar_Disposicion') IS NOT NULL 
	DROP PROCEDURE BOGO.migrar_Disposicion

IF OBJECT_ID('BOGO.migrar_Orientacion') IS NOT NULL 
	DROP PROCEDURE BOGO.migrar_Orientacion

IF OBJECT_ID('BOGO.migrar_Estado') IS NOT NULL 
	DROP PROCEDURE BOGO.migrar_Estado

IF OBJECT_ID('BOGO.migrar_Estado_alquiler') IS NOT NULL 
	DROP PROCEDURE BOGO.migrar_Estado_alquiler

IF OBJECT_ID('BOGO.migrar_Medio_de_pago') IS NOT NULL 
	DROP PROCEDURE BOGO.migrar_Medio_de_pago

IF OBJECT_ID('BOGO.migrar_Tipo_operacion') IS NOT NULL 
	DROP PROCEDURE BOGO.migrar_Tipo_operacion

IF OBJECT_ID('BOGO.migrar_Tipo_periodo') IS NOT NULL 
	DROP PROCEDURE BOGO.migrar_Tipo_periodo

IF OBJECT_ID('BOGO.migrar_Estado_anuncio') IS NOT NULL 
	DROP PROCEDURE BOGO.migrar_Estado_anuncio

IF OBJECT_ID('BOGO.migrar_Moneda') IS NOT NULL 
	DROP PROCEDURE BOGO.migrar_Moneda

IF OBJECT_ID('BOGO.migrar_Sucursal') IS NOT NULL 
	DROP PROCEDURE BOGO.migrar_Sucursal

IF OBJECT_ID('BOGO.migrar_Propietario') IS NOT NULL 
	DROP PROCEDURE BOGO.migrar_Propietario

IF OBJECT_ID('BOGO.migrar_Comprador') IS NOT NULL 
	DROP PROCEDURE BOGO.migrar_Comprador

IF OBJECT_ID('BOGO.migrar_Agente_inmobiliario') IS NOT NULL 
	DROP PROCEDURE BOGO.migrar_Agente_inmobiliario

IF OBJECT_ID('BOGO.migrar_Inquilino') IS NOT NULL 
	DROP PROCEDURE BOGO.migrar_Inquilino

IF OBJECT_ID('BOGO.migrar_Pago_por_venta') IS NOT NULL 
	DROP PROCEDURE BOGO.migrar_Pago_por_venta

IF OBJECT_ID('BOGO.migrar_Inmueble') IS NOT NULL 
	DROP PROCEDURE BOGO.migrar_Inmueble

IF OBJECT_ID('BOGO.migrar_Caracteristicas_por_inmueble') IS NOT NULL 
	DROP PROCEDURE BOGO.migrar_Caracteristicas_por_inmueble

IF OBJECT_ID('BOGO.migrar_Anuncio') IS NOT NULL 
	DROP PROCEDURE BOGO.migrar_Anuncio

IF OBJECT_ID('BOGO.migrar_Venta') IS NOT NULL 
	DROP PROCEDURE BOGO.migrar_Venta

IF OBJECT_ID('BOGO.migrar_Alquiler') IS NOT NULL 
	DROP PROCEDURE BOGO.migrar_Alquiler

IF OBJECT_ID('BOGO.migrar_Periodo') IS NOT NULL 
	DROP PROCEDURE BOGO.migrar_Periodo

IF OBJECT_ID('BOGO.migrar_Pago_alquiler') IS NOT NULL 
	DROP PROCEDURE BOGO.migrar_Pago_alquiler
GO

-- BORRADO DE ESQUEMA
IF EXISTS (SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'BOGO')
  DROP SCHEMA BOGO
GO


---------------------------------------------------------------------------------------------------
--                                            Parte 2                                            --
---------------------------------------------------------------------------------------------------

-- CREACION DEL ESQUEMA
CREATE SCHEMA BOGO;
GO

-- CREACION DE TABLAS
CREATE TABLE BOGO.Provincia
( 
	codigo_provincia INT PRIMARY KEY IDENTITY(1,1), 
    nombre VARCHAR(150)
)

CREATE TABLE BOGO.Caracteristica
( 
	codigo_caracteristica INT PRIMARY KEY IDENTITY(1,1), 
	nombre VARCHAR(150)
)

CREATE TABLE BOGO.Localidad
( 
	codigo_localidad INT PRIMARY KEY IDENTITY(1,1), 
    nombre VARCHAR(150),
	provincia INT --fk
)

CREATE TABLE BOGO.Barrio(
	codigo_barrio INT PRIMARY KEY IDENTITY(1,1),
	nombre varchar(150),
	localidad INT --fk
)

CREATE TABLE BOGO.Tipo_Inmueble
( 
    codigo_tipo_inmueble INT PRIMARY KEY IDENTITY (1,1), 
    nombre VARCHAR(150), 
)

CREATE TABLE BOGO.Disposicion
( 
    codigo_disposicion INT PRIMARY KEY IDENTITY(1,1),
    descripcion VARCHAR(150)
)

CREATE TABLE BOGO.Orientacion
( 
    codigo_orientacion INT PRIMARY KEY IDENTITY(1,1), 
    descripcion VARCHAR(150)
)

CREATE TABLE BOGO.Estado
( 
    codigo_estado INT PRIMARY KEY IDENTITY(1,1), 
    descripcion VARCHAR(150)
)

CREATE TABLE BOGO.Estado_alquiler
( 
    codigo_estado_alquiler INT PRIMARY KEY IDENTITY(1,1), 
    descripcion VARCHAR(150)
)

CREATE TABLE BOGO.Medio_de_pago
( 
    codigo_medio_de_pago INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(150) 
)

CREATE TABLE BOGO.Tipo_operacion(
	codigo_tipo_operacion INT PRIMARY KEY IDENTITY(1,1),
	nombre VARCHAR(150)
)

CREATE TABLE BOGO.Tipo_periodo
( 
    codigo_tipo_periodo INT PRIMARY KEY IDENTITY (1,1), 
    descripcion VARCHAR(150)
)

CREATE TABLE BOGO.Estado_anuncio
( 
    codigo_estado INT PRIMARY KEY IDENTITY(1,1), 
    descripcion VARCHAR(150)
)

CREATE TABLE BOGO.Moneda(
	codigo_moneda INT PRIMARY KEY IDENTITY(1,1),
	descripcion VARCHAR(150)
)

CREATE TABLE BOGO.Caracteristica_por_inmueble
(
	codigo_caracteristica INT,
	numero_de_inmueble INT,
	PRIMARY KEY (codigo_caracteristica, numero_de_inmueble)
)

CREATE TABLE BOGO.Sucursal
( 
	codigo_sucursal INT PRIMARY KEY IDENTITY(1,1), 
    direccion VARCHAR(150),
	localidad INT, -- fk
	nombre VARCHAR(150),
	provincia INT, --fk
	telefono VARCHAR(150) 
)

CREATE TABLE BOGO.Propietario(
	codigo_propietario INT PRIMARY KEY IDENTITY(1,1),
	nombre varchar(150),
	apellido varchar(150),
	dni INT,
	fecha_nacimiento DATETIME,
	fecha_registro DATETIME,
	mail varchar(150),
	telefono varchar(150),
)

CREATE TABLE BOGO.Comprador
( 
	codigo_comprador INT PRIMARY KEY IDENTITY(1,1), 
    nombre VARCHAR(150),
	apellido VARCHAR(150),
	dni VARCHAR(150),
	telefono varchar(150),
	fecha_nacimiento DATETIME,
	mail varchar(150),
	fecha_registro DATETIME
)

CREATE TABLE BOGO.Agente_inmobiliario(
	codigo_agente INT PRIMARY KEY IDENTITY(1,1),
	nombre varchar(150),
	apellido varchar(150),
	sucursal INT, --fk
	dni varchar(150),
	telefono varchar(150),
	fecha_nacimiento DATETIME,
	mail VARCHAR(150),
	fecha_registro DATETIME
)

CREATE TABLE BOGO.Inquilino
( 
    codigo_inquilino INT PRIMARY KEY IDENTITY(1,1), 
    nombre VARCHAR(150),
    apellido VARCHAR(150),
    dni VARCHAR(150),
    telefono VARCHAR(150),
    fecha_nacimiento datetime,
    mail VARCHAR(150),
	fecha_registro DATETIME
)

CREATE TABLE BOGO.Pago_por_venta
( 
	codigo_pago_por_venta INT PRIMARY KEY IDENTITY(1,1), 
    importe_del_pago FLOAT, 
    cotizacion FLOAT,
	venta INT, --fk
	moneda INT, --fk
	medio_de_pago INT --fk
)

CREATE TABLE BOGO.Inmueble
(
    numero_de_inmueble INT PRIMARY KEY IDENTITY (1,1),
    descripcion VARCHAR(150),
    direccion VARCHAR(150),
    ambientes VARCHAR(150),
    superficie FLOAT,
    fecha_de_construccion DATETIME,
    expensas FLOAT,
    nombre VARCHAR(150),
	tipo_inmueble INT, --fk
	propietario INT, --fk
	barrio INT, --fk
	localidad INT, --fk
	provincia INT, --fk
	disposicion INT, --fk
	orientacion INT, --fk
	estado INT --fk
)

CREATE TABLE BOGO.Anuncio(
	numero_anuncio INT PRIMARY KEY IDENTITY(1,1),
	fecha_publicacion DATETIME,
	fecha_finalizacion DATETIME,
	costo_anuncio FLOAT,
	estado_anuncio INT, --fk
	agente_inmobiliario INT, --fk
	tipo_operacion INT, --fk
	tipo_periodo INT, --fk
	precio_inmueble FLOAT,
	moneda INT, --fk
	inmueble INT, --fk
)

CREATE TABLE BOGO.Venta(
	codigo_venta INT PRIMARY KEY IDENTITY(1,1),
	comision_inmobiliaria FLOAT,
	fecha_de_venta DATETIME,
	precio_venta FLOAT,
	moneda INT, --fk
	anuncio INT, --fk
	comprador INT, --fk
)

CREATE TABLE BOGO.Alquiler
( 
    codigo_alquiler INT PRIMARY KEY IDENTITY (1,1), 
    fecha_de_inicio DATETIME,
    fecha_de_fin DATETIME,
    periodos INT,
    deposito FLOAT,
	comision FLOAT,
	gastos_de_averiguaciones FLOAT,
	anuncio INT, --fk
	inquilino INT, --fk
	estado_alquiler INT --fk
)

CREATE TABLE BOGO.Periodo
( 
    codigo_periodo INT PRIMARY KEY IDENTITY(1,1), 
    numero_periodo_de_inicio INT,
    numero_periodo_de_fin INT,
    precio FLOAT,
	alquiler INT --fk
)

CREATE TABLE BOGO.Pago_alquiler
( 
    codigo_pago_alquiler INT PRIMARY KEY IDENTITY(1,1),
    alquiler INT, --fk
    fecha_de_pago DATETIME,
	fecha_de_vencimiento DATETIME,
    numero_de_periodo_de_pago INT,
    descripcion VARCHAR(150),
    fecha_de_inicio_periodo_de_pago DATETIME,
    fecha_de_fin_periodo_de_pago DATETIME,
    importe FLOAT,
    medio_de_pago INT --fk
)

CREATE TABLE BOGO.rangosm2(
	codigo_m2 INT PRIMARY KEY IDENTITY(1,1),
	rango VARCHAR(150)
)



-- CREACION DE PKs COMPUESTAS
ALTER TABLE BOGO.Localidad
	ADD FOREIGN KEY(provincia) REFERENCES BOGO.Provincia(codigo_provincia);
GO

ALTER TABLE BOGO.Barrio
	ADD FOREIGN KEY(localidad) REFERENCES BOGO.Localidad(codigo_localidad);
GO

ALTER TABLE BOGO.sucursal
	ADD FOREIGN KEY(localidad) REFERENCES BOGO.Localidad(codigo_localidad),
		FOREIGN KEY(provincia) REFERENCES BOGO.Provincia(codigo_provincia);
GO

ALTER TABLE BOGO.Agente_Inmobiliario
	ADD FOREIGN KEY (sucursal) REFERENCES BOGO.Sucursal(codigo_sucursal);
GO

ALTER TABLE BOGO.Pago_por_venta
	ADD FOREIGN KEY(venta) REFERENCES BOGO.venta(codigo_venta),
		FOREIGN KEY(moneda) REFERENCES BOGO.moneda(codigo_moneda),
		FOREIGN KEY(medio_de_pago) REFERENCES BOGO.medio_de_pago(codigo_medio_de_pago);
GO

ALTER TABLE BOGO.Inmueble
	ADD FOREIGN KEY(tipo_inmueble) REFERENCES BOGO.Tipo_Inmueble(codigo_tipo_inmueble),
		FOREIGN KEY(propietario) REFERENCES BOGO.Propietario(codigo_propietario),
		FOREIGN KEY(barrio) REFERENCES BOGO.Barrio(codigo_barrio),
		FOREIGN KEY(disposicion) REFERENCES BOGO.Disposicion(codigo_disposicion),
		FOREIGN KEY(orientacion) REFERENCES BOGO.Orientacion(codigo_orientacion),
		FOREIGN KEY(localidad) REFERENCES BOGO.Localidad(codigo_localidad),
		FOREIGN KEY(provincia) REFERENCES BOGO.Provincia(codigo_provincia),
		FOREIGN KEY(estado) REFERENCES BOGO.Estado(codigo_estado);
GO

ALTER TABLE BOGO.Anuncio
	ADD FOREIGN KEY(agente_inmobiliario) REFERENCES BOGO.Agente_Inmobiliario(codigo_agente),
		FOREIGN KEY(tipo_operacion) REFERENCES BOGO.Tipo_operacion(codigo_tipo_operacion),
		FOREIGN KEY(inmueble) REFERENCES BOGO.Inmueble(numero_de_inmueble),
		FOREIGN KEY(moneda) REFERENCES BOGO.Moneda(codigo_moneda),
		FOREIGN KEY(tipo_periodo) REFERENCES BOGO.Tipo_periodo(codigo_tipo_periodo),
		FOREIGN KEY(estado_anuncio) REFERENCES BOGO.Estado_anuncio(codigo_estado);
GO

ALTER TABLE BOGO.Venta
	ADD FOREIGN KEY(anuncio) REFERENCES BOGO.Anuncio(numero_anuncio),
		FOREIGN KEY(comprador) REFERENCES BOGO.Comprador(codigo_comprador),
		FOREIGN KEY(moneda) REFERENCES BOGO.Moneda(codigo_moneda)
GO

ALTER TABLE BOGO.Alquiler
	ADD FOREIGN KEY(anuncio) REFERENCES BOGO.Anuncio(numero_anuncio),
		FOREIGN KEY(inquilino) REFERENCES BOGO.Inquilino(codigo_inquilino),
		FOREIGN KEY(estado_alquiler) REFERENCES BOGO.Estado_alquiler(codigo_estado_alquiler);
GO

ALTER TABLE BOGO.Periodo
	ADD FOREIGN KEY(alquiler) REFERENCES BOGO.Alquiler(codigo_alquiler);
GO

ALTER TABLE BOGO.Pago_alquiler
	ADD FOREIGN KEY(alquiler) REFERENCES BOGO.Alquiler(codigo_alquiler),
		FOREIGN KEY(medio_de_pago) REFERENCES BOGO.Medio_de_pago(codigo_medio_de_pago);
GO


---------------------------------------------------------------------------------------------------
--                                            Parte 3                                            --
---------------------------------------------------------------------------------------------------

--  CREACION DE FUNCIONES 
CREATE FUNCTION BOGO.OBTENER_ID_PROVINCIA(@nombre NVARCHAR(255)) RETURNS DECIMAL (18,0) AS
BEGIN
	DECLARE @id_provincia DECIMAL(18,0);
	SELECT @id_provincia = codigo_provincia FROM BOGO.provincia WHERE nombre = @nombre;
	RETURN @id_provincia;
END
GO

CREATE FUNCTION BOGO.OBTENER_ID_LOCALIDAD(@nombre NVARCHAR(255)) RETURNS DECIMAL (18,0) AS
BEGIN
	DECLARE @id_localidad DECIMAL(18,0);
	SELECT @id_localidad = codigo_localidad FROM BOGO.localidad WHERE nombre = @nombre;
	RETURN @id_localidad;
END
GO

CREATE FUNCTION BOGO.OBTENER_ID_BARRIO(@nombre NVARCHAR(255)) RETURNS DECIMAL (18,0) AS
BEGIN
	DECLARE @id_barrio DECIMAL(18,0);
	SELECT @id_barrio = codigo_barrio FROM BOGO.barrio WHERE nombre = @nombre;
	RETURN @id_barrio;
END
GO

CREATE FUNCTION BOGO.OBTENER_ID_DISPOSICION(@nombre NVARCHAR(255)) RETURNS DECIMAL (18,0) AS
BEGIN
	DECLARE @id_disposicion DECIMAL(18,0);
	SELECT @id_disposicion = codigo_disposicion FROM BOGO.Disposicion WHERE Descripcion = @nombre;
	RETURN @id_disposicion;
END
GO

CREATE FUNCTION BOGO.OBTENER_ID_ORIENTACION(@nombre NVARCHAR(255)) RETURNS DECIMAL (18,0) AS
BEGIN
	DECLARE @id_orientacion DECIMAL(18,0);
	SELECT @id_orientacion = codigo_orientacion FROM BOGO.Orientacion WHERE Descripcion = @nombre;
	RETURN @id_orientacion;
END
GO

CREATE FUNCTION BOGO.OBTENER_ID_ESTADO(@nombre NVARCHAR(255)) RETURNS DECIMAL (18,0) AS
BEGIN
	DECLARE @id_estado DECIMAL(18,0);
	SELECT @id_estado = codigo_estado FROM BOGO.Estado WHERE descripcion = @nombre;
	RETURN @id_estado;
END
GO

CREATE FUNCTION BOGO.OBTENER_ID_TIPO_INMUEBLE(@nombre NVARCHAR(255)) RETURNS DECIMAL (18,0) AS
BEGIN
	DECLARE @id_tipo_inmueble DECIMAL(18,0);
	SELECT @id_tipo_inmueble = codigo_tipo_inmueble FROM BOGO.Tipo_inmueble WHERE nombre = @nombre;
	RETURN @id_tipo_inmueble;
END
GO

CREATE FUNCTION BOGO.OBTENER_ID_MONEDA(@nombre NVARCHAR(255)) RETURNS DECIMAL (18,0) AS
BEGIN
	DECLARE @id_moneda DECIMAL(18,0);
	SELECT @id_moneda = codigo_moneda FROM BOGO.Moneda WHERE descripcion = @nombre;
	RETURN @id_moneda;
END
GO

CREATE FUNCTION BOGO.OBTENER_ID_MEDIO_DE_PAGO(@nombre NVARCHAR(255)) RETURNS DECIMAL (18,0) AS
BEGIN
	DECLARE @id_Medio_de_pago DECIMAL(18,0);
	SELECT @id_Medio_de_pago = codigo_Medio_de_pago FROM BOGO.Medio_de_pago WHERE nombre = @nombre;
	RETURN @id_Medio_de_pago;
END
GO

CREATE FUNCTION BOGO.OBTENER_ID_TIPO_OPERACION(@nombre NVARCHAR(255)) RETURNS DECIMAL (18,0) AS
BEGIN
	DECLARE @id_tipo_operacion DECIMAL(18,0);
	SELECT @id_tipo_operacion = codigo_tipo_operacion FROM BOGO.Tipo_operacion WHERE nombre = @nombre;
	RETURN @id_tipo_operacion;
END
GO

CREATE FUNCTION BOGO.OBTENER_ID_TIPO_PERIODO(@nombre NVARCHAR(255)) RETURNS DECIMAL (18,0) AS
BEGIN
	DECLARE @id_tipo_periodo DECIMAL(18,0);
	SELECT @id_tipo_periodo = codigo_tipo_periodo FROM BOGO.Tipo_periodo WHERE descripcion = @nombre;
	RETURN @id_tipo_periodo;
END
GO

CREATE FUNCTION BOGO.OBTENER_ID_ESTADO_ANUNCIO(@nombre NVARCHAR(255)) RETURNS DECIMAL (18,0) AS
BEGIN
	DECLARE @id_estado_anuncio DECIMAL(18,0);
	SELECT @id_estado_anuncio = codigo_estado FROM BOGO.Estado_anuncio WHERE descripcion = @nombre;
	RETURN @id_estado_anuncio;
END
GO

CREATE FUNCTION BOGO.OBTENER_ID_ESTADO_ALQUILER(@nombre NVARCHAR(255)) RETURNS DECIMAL (18,0) AS
BEGIN
	DECLARE @id_estado_alquiler DECIMAL(18,0);
	SELECT @id_estado_alquiler = codigo_estado_alquiler FROM BOGO.Estado_alquiler WHERE descripcion = @nombre;
	RETURN @id_estado_alquiler;
END
GO

CREATE FUNCTION BOGO.OBTENER_INMUEBLE_CABLE(@codigo NVARCHAR(255), @caract_cable INT) RETURNS DECIMAL (18,0) AS
BEGIN
	DECLARE @id_inmueble DECIMAL (18,0);
	SELECT @id_inmueble = numero_de_inmueble FROM BOGO.Inmueble WHERE @caract_cable = '1';
	RETURN @id_inmueble;
END
GO

CREATE FUNCTION BOGO.OBTENER_ID_INMUEBLE(@id NUMERIC(18,0)) RETURNS DECIMAL (18,0) AS
BEGIN
	DECLARE @id_inmueble DECIMAL(18,0);
	SELECT @id_inmueble = i.numero_de_inmueble  FROM BOGO.Inmueble i WHERE numero_de_inmueble = @id;
	RETURN @id_inmueble;
END
GO

Create FUNCTION BOGO.OBTENER_ID_Anuncio(@id numeric (19,0)) returns Decimal(18,0) as
BEGIN 
	DECLARE @id_anuncio decimal(18,0)
	Select @id_anuncio =  a.numero_anuncio from BOGO.Anuncio a where a.numero_anuncio = @id
	RETURN @id_anuncio;
END 
GO

CREATE FUNCTION BOGO.OBTENER_ID_Inquilino(@id NUMERIC(18,0)) RETURNS DECIMAL (18,0) AS
BEGIN
	DECLARE @id_inquilino DECIMAL(18,0);
	SELECT @id_inquilino = i.codigo_inquilino  FROM Bogo.Inquilino i WHERE i.dni = @id;
	RETURN @id_inquilino;
END
GO

Create Function BOGO.OBTENER_ID_AGENTE(@id numeric (18,0)) returns decimal(18,0) as
Begin
	Declare @id_agente decimal (18,0)
	select @id_agente = ag.codigo_agente from Bogo.Agente_inmobiliario ag where ag.dni = @id
	return @id_agente
end 

---------------------------------------------------------------------------------------------------
--                                            Parte 4                                            --
---------------------------------------------------------------------------------------------------

--  CREACION DE PROCEDURES 
CREATE PROCEDURE BOGO.migrar_Provincia AS
BEGIN
	INSERT INTO BOGO.Provincia (nombre)
		SELECT DISTINCT SUCURSAL_PROVINCIA FROM gd_esquema.Maestra WHERE sucursal_provincia IS NOT NULL
		UNION
		SELECT DISTINCT INMUEBLE_PROVINCIA FROM gd_esquema.Maestra WHERE inmueble_provincia IS NOT NULL
END
GO

CREATE PROCEDURE BOGO.migrar_Caracteristica AS
BEGIN
	INSERT INTO BOGO.Caracteristica (nombre) VALUES ('Cable')
	INSERT INTO BOGO.Caracteristica (nombre) VALUES ('WIFI')
	INSERT INTO BOGO.Caracteristica (nombre) VALUES ('Calefacci�n')
	INSERT INTO BOGO.Caracteristica (nombre) VALUES ('Gas')
		
END
GO

CREATE PROCEDURE BOGO.migrar_Localidad AS
BEGIN
	INSERT INTO BOGO.Localidad (nombre, provincia)
		SELECT DISTINCT SUCURSAL_LOCALIDAD, BOGO.OBTENER_ID_PROVINCIA(sucursal_provincia) FROM gd_esquema.Maestra WHERE sucursal_localidad IS NOT NULL
		UNION
		SELECT DISTINCT INMUEBLE_LOCALIDAD, BOGO.OBTENER_ID_PROVINCIA(inmueble_provincia) FROM gd_esquema.Maestra WHERE inmueble_localidad IS NOT NULL
END
GO

CREATE PROCEDURE BOGO.migrar_Barrio AS
BEGIN
	INSERT INTO BOGO.Barrio (nombre, localidad)
		SELECT DISTINCT INMUEBLE_BARRIO, BOGO.OBTENER_ID_LOCALIDAD(inmueble_localidad) FROM gd_esquema.Maestra WHERE inmueble_localidad IS NOT NULL
END
GO

CREATE PROCEDURE BOGO.migrar_Tipo_inmueble AS
BEGIN
	INSERT INTO BOGO.Tipo_inmueble (nombre)
		SELECT DISTINCT INMUEBLE_TIPO_INMUEBLE FROM gd_esquema.Maestra WHERE inmueble_tipo_inmueble IS NOT NULL
END
GO

CREATE PROCEDURE BOGO.migrar_Disposicion AS
BEGIN
	INSERT INTO BOGO.Disposicion (descripcion)
		SELECT DISTINCT	INMUEBLE_DISPOSICION FROM gd_esquema.Maestra WHERE inmueble_disposicion IS NOT NULL
END
GO

CREATE PROCEDURE BOGO.migrar_Orientacion AS
BEGIN
	INSERT INTO BOGO.Orientacion (descripcion)
		SELECT DISTINCT	INMUEBLE_ORIENTACION FROM gd_esquema.Maestra WHERE inmueble_orientacion IS NOT NULL
END
GO

CREATE PROCEDURE BOGO.migrar_Estado AS
BEGIN
	INSERT INTO BOGO.Estado (descripcion)
		SELECT DISTINCT	INMUEBLE_ESTADO FROM gd_esquema.Maestra WHERE inmueble_estado IS NOT NULL
END
GO

CREATE PROCEDURE BOGO.migrar_Estado_alquiler AS
BEGIN
	INSERT INTO BOGO.Estado_alquiler (descripcion)
		SELECT DISTINCT	ALQUILER_ESTADO FROM gd_esquema.Maestra WHERE ALQUILER_ESTADO IS NOT NULL
END
GO

CREATE PROCEDURE BOGO.migrar_Medio_de_pago AS
BEGIN
	INSERT INTO BOGO.Medio_de_pago (nombre)
		SELECT DISTINCT	PAGO_ALQUILER_MEDIO_PAGO FROM gd_esquema.Maestra WHERE PAGO_ALQUILER_MEDIO_PAGO IS NOT NULL
		UNION
		SELECT DISTINCT PAGO_VENTA_MEDIO_PAGO FROM gd_esquema.Maestra WHERE PAGO_VENTA_MEDIO_PAGO IS NOT NULL
END
GO

CREATE PROCEDURE BOGO.migrar_Tipo_operacion AS
BEGIN
	INSERT INTO BOGO.Tipo_operacion (nombre)
		SELECT DISTINCT	ANUNCIO_TIPO_OPERACION FROM gd_esquema.Maestra WHERE ANUNCIO_TIPO_OPERACION IS NOT NULL
END
GO

CREATE PROCEDURE BOGO.migrar_Tipo_periodo AS
BEGIN
	INSERT INTO BOGO.Tipo_periodo (descripcion)
		SELECT DISTINCT	ANUNCIO_TIPO_PERIODO FROM gd_esquema.Maestra WHERE ANUNCIO_TIPO_PERIODO IS NOT NULL
END
GO

CREATE PROCEDURE BOGO.migrar_Estado_anuncio AS
BEGIN
	INSERT INTO BOGO.Estado_anuncio (descripcion)
		SELECT DISTINCT	ANUNCIO_ESTADO FROM gd_esquema.Maestra WHERE ANUNCIO_CODIGO IS NOT NULL
END
GO

CREATE PROCEDURE BOGO.migrar_Moneda AS
BEGIN
	INSERT INTO BOGO.Moneda (descripcion)
		SELECT DISTINCT	ANUNCIO_MONEDA FROM gd_esquema.Maestra WHERE ANUNCIO_MONEDA IS NOT NULL
		UNION
		SELECT DISTINCT	PAGO_VENTA_MONEDA FROM gd_esquema.Maestra WHERE PAGO_VENTA_MONEDA IS NOT NULL
		UNION
		SELECT DISTINCT	VENTA_MONEDA FROM gd_esquema.Maestra WHERE VENTA_MONEDA IS NOT NULL
END
GO

CREATE PROCEDURE BOGO.migrar_Sucursal AS
BEGIN
	INSERT INTO BOGO.Sucursal (telefono, direccion, nombre, localidad, provincia)
		SELECT DISTINCT	SUCURSAL_TELEFONO, SUCURSAL_DIRECCION, SUCURSAL_NOMBRE, BOGO.OBTENER_ID_LOCALIDAD(sucursal_localidad), BOGO.OBTENER_ID_PROVINCIA(sucursal_provincia) FROM gd_esquema.Maestra 
			WHERE SUCURSAL_NOMBRE IS NOT NULL
END
GO

CREATE PROCEDURE BOGO.migrar_Propietario AS
BEGIN
	INSERT INTO BOGO.Propietario (nombre, apellido, dni, telefono, fecha_nacimiento, mail, fecha_registro)
		SELECT DISTINCT	PROPIETARIO_NOMBRE, PROPIETARIO_APELLIDO, PROPIETARIO_DNI, PROPIETARIO_TELEFONO, PROPIETARIO_FECHA_NAC, PROPIETARIO_MAIL, PROPIETARIO_FECHA_REGISTRO FROM gd_esquema.Maestra 
			WHERE PROPIETARIO_NOMBRE IS NOT NULL
END
GO

CREATE PROCEDURE BOGO.migrar_Comprador AS
BEGIN
	INSERT INTO BOGO.Comprador (nombre, apellido, dni, telefono, fecha_nacimiento, mail, fecha_registro)
		SELECT DISTINCT	COMPRADOR_NOMBRE, COMPRADOR_APELLIDO, COMPRADOR_DNI, COMPRADOR_TELEFONO, COMPRADOR_FECHA_NAC, COMPRADOR_MAIL, COMPRADOR_FECHA_REGISTRO FROM gd_esquema.Maestra 
			WHERE COMPRADOR_NOMBRE IS NOT NULL
END
GO

CREATE PROCEDURE BOGO.migrar_Agente_inmobiliario AS
BEGIN
	INSERT INTO BOGO.Agente_inmobiliario (nombre, apellido, dni, telefono, fecha_nacimiento, mail, fecha_registro)
		SELECT DISTINCT	AGENTE_NOMBRE, AGENTE_APELLIDO, AGENTE_DNI, AGENTE_TELEFONO, AGENTE_FECHA_NAC, AGENTE_MAIL, AGENTE_FECHA_REGISTRO FROM gd_esquema.Maestra 
			WHERE AGENTE_NOMBRE IS NOT NULL
END
GO

CREATE PROCEDURE BOGO.migrar_Inquilino AS
BEGIN
	INSERT INTO BOGO.Inquilino (nombre, apellido, dni, telefono, fecha_nacimiento, mail, fecha_registro)
		SELECT DISTINCT	INQUILINO_NOMBRE, INQUILINO_APELLIDO, INQUILINO_DNI, INQUILINO_TELEFONO, INQUILINO_FECHA_NAC, INQUILINO_MAIL, INQUILINO_FECHA_REGISTRO FROM gd_esquema.Maestra 
			WHERE INQUILINO_NOMBRE IS NOT NULL
END
GO

CREATE PROCEDURE BOGO.migrar_Pago_por_venta AS
BEGIN
	INSERT INTO BOGO.Pago_por_venta (importe_del_pago, cotizacion, moneda, medio_de_pago)
		SELECT DISTINCT	PAGO_VENTA_IMPORTE, PAGO_VENTA_COTIZACION, BOGO.OBTENER_ID_Moneda(PAGO_VENTA_MONEDA), BOGO.OBTENER_ID_Medio_de_pago(PAGO_VENTA_MEDIO_PAGO) FROM gd_esquema.Maestra 
			WHERE PAGO_VENTA_IMPORTE IS NOT NULL
END
GO

CREATE PROCEDURE BOGO.migrar_Inmueble AS
BEGIN
	SET IDENTITY_INSERT BOGO.Inmueble ON
	INSERT INTO BOGO.Inmueble (numero_de_inmueble, descripcion, direccion, ambientes, superficie, fecha_de_construccion, expensas, nombre, tipo_inmueble, barrio, disposicion, orientacion, estado, provincia, localidad)
		SELECT DISTINCT	
			INMUEBLE_CODIGO,
			INMUEBLE_DESCRIPCION, 
			INMUEBLE_DIRECCION, 
			INMUEBLE_CANT_AMBIENTES, 
			INMUEBLE_SUPERFICIETOTAL,
			INMUEBLE_ANTIGUEDAD,
			INMUEBLE_EXPESAS,
			INMUEBLE_NOMBRE,
			BOGO.OBTENER_ID_TIPO_INMUEBLE(INMUEBLE_TIPO_INMUEBLE),
			BOGO.OBTENER_ID_BARRIO(INMUEBLE_BARRIO),
			BOGO.OBTENER_ID_DISPOSICION(INMUEBLE_DISPOSICION),
			BOGO.OBTENER_ID_ORIENTACION(INMUEBLE_ORIENTACION),
			BOGO.OBTENER_ID_ESTADO(INMUEBLE_ESTADO),
			BOGO.OBTENER_ID_PROVINCIA(inmueble_provincia),
			BOGO.OBTENER_ID_LOCALIDAD(inmueble_localidad)
			FROM gd_esquema.Maestra 
			WHERE INMUEBLE_NOMBRE IS NOT NULL
	SET IDENTITY_INSERT BOGO.Inmueble OFF
END
GO

CREATE PROCEDURE BOGO.migrar_Caracteristicas_por_inmueble AS
BEGIN
	INSERT INTO BOGO.Caracteristica_por_inmueble (numero_de_inmueble, codigo_caracteristica)
		SELECT DISTINCT BOGO.Inmueble.numero_de_inmueble , '1' FROM gd_esquema.Maestra INNER JOIN BOGO.Inmueble on INMUEBLE_CODIGO = BOGO.Inmueble.numero_de_inmueble
		WHERE INMUEBLE_CARACTERISTICA_CABLE = 1 
	UNION
		SELECT DISTINCT BOGO.Inmueble.numero_de_inmueble , '2' FROM gd_esquema.Maestra INNER JOIN BOGO.Inmueble on INMUEBLE_CODIGO = BOGO.Inmueble.numero_de_inmueble
		WHERE INMUEBLE_CARACTERISTICA_WIFI = 1 
	UNION
		SELECT DISTINCT BOGO.Inmueble.numero_de_inmueble , '3' FROM gd_esquema.Maestra INNER JOIN BOGO.Inmueble on INMUEBLE_CODIGO = BOGO.Inmueble.numero_de_inmueble
		WHERE INMUEBLE_CARACTERISTICA_CALEFACCION = 1 
	UNION
		SELECT DISTINCT BOGO.Inmueble.numero_de_inmueble , '4' FROM gd_esquema.Maestra INNER JOIN BOGO.Inmueble on INMUEBLE_CODIGO = BOGO.Inmueble.numero_de_inmueble
		WHERE INMUEBLE_CARACTERISTICA_GAS = 1 
END
GO

alter PROCEDURE BOGO.migrar_Anuncio AS
BEGIN
	SET IDENTITY_INSERT BOGO.Anuncio ON
	INSERT INTO BOGO.Anuncio (numero_anuncio,fecha_publicacion, tipo_operacion, precio_inmueble, moneda, tipo_periodo, estado_anuncio, fecha_finalizacion, costo_anuncio,inmueble,agente_inmobiliario)
		SELECT DISTINCT
			ANUNCIO_CODIGO,
			ANUNCIO_FECHA_PUBLICACION, 
			BOGO.OBTENER_ID_Tipo_operacion(ANUNCIO_TIPO_OPERACION), 
			ANUNCIO_PRECIO_PUBLICADO, 
			BOGO.OBTENER_ID_MONEDA(ANUNCIO_MONEDA),
			BOGO.OBTENER_ID_TIPO_PERIODO(ANUNCIO_TIPO_PERIODO),
			BOGO.OBTENER_ID_Estado_anuncio(ANUNCIO_ESTADO),
			ANUNCIO_FECHA_FINALIZACION,
			ANUNCIO_COSTO_ANUNCIO,
			BOGO.OBTENER_ID_INMUEBLE(INMUEBLE_CODIGO),
			BOGO.OBTENER_ID_AGENTE(AGENTE_DNI)
			FROM gd_esquema.Maestra 
			WHERE ANUNCIO_FECHA_PUBLICACION IS NOT NULL and Bogo.OBTENER_ID_INMUEBLE(INMUEBLE_CODIGO) IS NOT NULL
		SET IDENTITY_INSERT BOGO.Anuncio OFF
END
GO

CREATE PROCEDURE BOGO.migrar_Venta AS
BEGIN
	SET IDENTITY_INSERT BOGO.Venta ON
	INSERT INTO BOGO.Venta (codigo_venta, comision_inmobiliaria, fecha_de_venta, precio_venta, moneda)
		SELECT DISTINCT	
			VENTA_CODIGO, 
			VENTA_COMISION, 
			VENTA_FECHA, 
			VENTA_PRECIO_VENTA,
			BOGO.OBTENER_ID_MONEDA(VENTA_MONEDA)
			FROM gd_esquema.Maestra 
			WHERE VENTA_CODIGO IS NOT NULL
	SET IDENTITY_INSERT BOGO.Venta OFF
END
GO


Alter PROCEDURE BOGO.migrar_Alquiler AS
BEGIN
	SET IDENTITY_INSERT BOGO.Alquiler ON
	INSERT INTO BOGO.Alquiler (codigo_alquiler, fecha_de_inicio, fecha_de_fin, periodos, deposito, comision, gastos_de_averiguaciones, estado_alquiler,inquilino,anuncio)
		SELECT DISTINCT	
			ALQUILER_CODIGO,
			ALQUILER_FECHA_INICIO, 
			ALQUILER_FECHA_FIN, 
			ALQUILER_CANT_PERIODOS,
			ALQUILER_DEPOSITO, 
			ALQUILER_COMISION,
			ALQUILER_GASTOS_AVERIGUA,
			BOGO.OBTENER_ID_Estado_alquiler(ALQUILER_ESTADO),
			BOGO.OBTENER_ID_Inquilino(INQUILINO_DNI),
			BOGO.OBTENER_ID_Anuncio(ANUNCIO_CODIGO)
			FROM gd_esquema.Maestra 
			WHERE ALQUILER_FECHA_INICIO IS NOT NULL
	SET IDENTITY_INSERT BOGO.Alquiler OFF
END
GO

CREATE PROCEDURE BOGO.migrar_Periodo AS
BEGIN
	INSERT INTO BOGO.Periodo (numero_periodo_de_inicio, numero_periodo_de_fin, precio)
		SELECT DISTINCT	DETALLE_ALQ_NRO_PERIODO_INI, DETALLE_ALQ_NRO_PERIODO_FIN, DETALLE_ALQ_PRECIO FROM gd_esquema.Maestra 
			WHERE INMUEBLE_NOMBRE IS NOT NULL
END
GO

CREATE PROCEDURE BOGO.migrar_Pago_alquiler AS
BEGIN
	SET IDENTITY_INSERT BOGO.Pago_alquiler ON
	INSERT INTO BOGO.Pago_alquiler (codigo_pago_alquiler, fecha_De_pago, numero_de_periodo_de_pago, descripcion, fecha_de_inicio_periodo_de_pago, fecha_de_fin_periodo_de_pago, importe, medio_de_pago, fecha_de_vencimiento)
		SELECT DISTINCT	
		PAGO_ALQUILER_CODIGO, 
		PAGO_ALQUILER_FECHA,
		PAGO_ALQUILER_NRO_PERIODO,
		PAGO_ALQUILER_DESC,
		PAGO_ALQUILER_FEC_INI,
		PAGO_ALQUILER_FEC_FIN,
		PAGO_ALQUILER_IMPORTE,
		BOGO.OBTENER_ID_Medio_de_pago(PAGO_ALQUILER_MEDIO_PAGO),
		PAGO_ALQUILER_FECHA_VENCIMIENTO
		FROM gd_esquema.Maestra 
		WHERE PAGO_ALQUILER_CODIGO IS NOT NULL
	SET IDENTITY_INSERT BOGO.Pago_alquiler OFF
END
GO

Create PROCEDURE BOGO.migrar_rangosm2 AS
BEGIN
    INSERT INTO BOGO.rangosm2 (rango)
        VALUES ('<35 m2'), ('35-55 m2'), ('55-75 m2'), ('75-100 m2'), ('>100 m2')
END
GO

---------------------------------------------------------------------------------------------------
--                                            Parte 5                                            --
---------------------------------------------------------------------------------------------------

--  EJECUCI�N DE LOS PROCEDURES PARA MIGRAR LOS DATOS
EXEC BOGO.migrar_Provincia;
GO
EXEC BOGO.migrar_Caracteristica;
GO
EXEC BOGO.migrar_Localidad;
GO
EXEC BOGO.migrar_Barrio;
GO
EXEC BOGO.migrar_Tipo_inmueble;
GO
EXEC BOGO.Migrar_Disposicion;
GO
EXEC BOGO.Migrar_Orientacion;
GO
EXEC BOGO.Migrar_Estado;
GO
EXEC BOGO.Migrar_Estado_alquiler;
GO
EXEC BOGO.Migrar_Medio_de_pago;
GO
EXEC BOGO.Migrar_Tipo_operacion;
GO
EXEC BOGO.Migrar_Tipo_periodo;
GO
EXEC BOGO.Migrar_Estado_anuncio;
GO
EXEC BOGO.Migrar_Moneda;
GO
EXEC BOGO.Migrar_Sucursal;
GO
EXEC BOGO.Migrar_Propietario;
GO
EXEC BOGO.Migrar_Comprador;
GO
EXEC BOGO.Migrar_Agente_inmobiliario;
GO
EXEC BOGO.Migrar_Inquilino;
GO
EXEC BOGO.Migrar_Pago_por_venta;
GO
EXEC BOGO.Migrar_Inmueble;
GO
EXEC BOGO.Migrar_Caracteristicas_por_inmueble;
GO
EXEC BOGO.Migrar_Anuncio;
GO
EXEC BOGO.Migrar_Venta;
GO
EXEC BOGO.Migrar_Alquiler;
GO
EXEC BOGO.Migrar_Periodo;
GO
EXEC BOGO.Migrar_Pago_alquiler;
GO

Delete from Bogo.Alquiler

Select * from Bogo.Alquiler

Create TABLE BOGO.Ambientes(
	codigo_ambientes INT PRIMARY KEY IDENTITY(1,1),
	cantidad VARCHAR(150)
)

Select distinct a.numero_anuncio  from BOGO.Anuncio a

Select distinct m.ANUNCIO_CODIGO from gd_esquema.Maestra m

CREATE PROCEDURE BOGO.migrar_ambientes AS
BEGIN
    INSERT INTO BOGO.Ambientes (cantidad)
        SELECT DISTINCT ambientes FROM BOGO.Inmueble
		ORDER BY ambientes ASC
END
GO

exec BOGO.migrar_ambientes

Select * from Bogo.Ambientes

Select * from Bogo.Anuncio

Select * from Bogo.Alquiler

DELETE FROM BOGO.Anuncio

Delete from Bogo.Alquiler

--crear inserts 

Select * from BOGO.Estado_anuncio

Select * from BOGO.Agente_inmobiliario

Select * from BOGO.Tipo_periodo

Select * from BOGO.Tipo_operacion

Select * from BOGO.Anuncio

Select * from Bogo.Inmueble

Select * from BOGO.Moneda

insert into BOGO.Anuncio values (cast('2024-01-01' as datetime),cast('2024-27-02' as datetime),4200,3,1,1,4,100000,2,142576)

insert into BOGO.Anuncio values (cast('2024-20-05' as datetime),cast('2024-07-08' as datetime),4200,3,1,1,4,250000,2,142578)

insert into BOGO.Anuncio values (cast('2024-20-05' as datetime),cast('2024-02-02' as datetime),4200,3,1,1,4,250000,2,142578)

insert into BOGO.Anuncio values (cast('2024-15-03' as datetime),cast('2024-10-01' as datetime),4200,3,1,1,4,400000,2,142677)

insert into BOGO.Anuncio values (cast('2024-15-03' as datetime),cast('2024-10-01' as datetime),4200,3,1,1,4,400000,2,142677)


insert into BOGO.Anuncio values (cast('2024-15-03' as datetime),cast('2024-10-01' as datetime),4200,3,1,1,4,400000,2,142677)

Select * from  Bogo.Anuncio

Select Month(a.fecha_publicacion) as "Mes de publicacion",Month(a.fecha_finalizacion) as "Mes de finalizacion" from BOGO.Anuncio a where a.numero_anuncio in ('22371','22372')

Delete from Bogo.Anuncio where numero_anuncio = '22371'






create view duracion_promedio_anuncios as select distinct
tio.nombre as "Nombre de tipo Operacion",ba.nombre as "Nombre de barrio",am.cantidad as "Cantidad de ambientes",Year(a.fecha_publicacion) as "Anio",DATEPART(QUARTER, a.fecha_publicacion) as "Cuatrimestre",avg(DATEDIFF(DAY,a.fecha_publicacion,a.fecha_finalizacion)) as "Duracion promedio en dias" from Bogo.Anuncio a
inner join Bogo.Inmueble i on a.inmueble = i.numero_de_inmueble
inner join Bogo.Ambientes am on am.cantidad = i.ambientes
inner join BOGO.Tipo_operacion tio on a.tipo_operacion = tio.codigo_tipo_operacion
inner join  Bogo.Barrio ba on ba.codigo_barrio = i.barrio
group by tio.nombre,ba.nombre,am.cantidad,Year(a.fecha_publicacion),DATEPART(QUARTER, a.fecha_publicacion)

select distinct tio.nombre,
t_inm.nombre,
mo.descripcion,
Year(a.fecha_publicacion) as "anio",
DATEPART(QUARTER,a.fecha_publicacion) as "cuatrimestre",
CASE WHEN i.superficie < 35 THEN '<35 m2'
WHEN i.superficie > 35 AND i.superficie <= 55 THEN '35-55 m2'
WHEN i.superficie > 55 AND i.superficie <= 75 THEN '55-75 m2'
WHEN i.superficie > 75 and i.superficie <= 100 THEN '75-100 m2'
WHEN i.superficie > 100 THEN '>100 m2'
END as "superficie",
avg(a.precio_inmueble) as "Precio promedio inmueble"
from Bogo.Anuncio a
inner join Bogo.Inmueble i on a.inmueble = i.numero_de_inmueble
inner join Bogo.Ambientes am on am.cantidad = i.ambientes
inner join BOGO.Tipo_operacion tio on a.tipo_operacion = tio.codigo_tipo_operacion
inner join Bogo.Tipo_Inmueble t_inm on t_inm.codigo_tipo_inmueble = i.tipo_inmueble
inner join Bogo.Moneda mo on a.moneda = mo.codigo_moneda
group by tio.nombre,
t_inm.nombre,
mo.descripcion,
Year(a.fecha_publicacion),
DATEPART(QUARTER,a.fecha_publicacion),
superficie





Select i.numero_de_inmueble,i.numero_de_inmueble,i.descripcion,m.INMUEBLE_CODIGO,m.INMUEBLE_DESCRIPCION from Bogo.Inmueble i 
inner join gd_esquema.Maestra m on m.INMUEBLE_CODIGO = i.numero_de_inmueble

/*3. Los 5 barrios m�s elegidos para alquilar en funci�n del rango etario de los
inquilinos para cada cuatrimestre/a�o. Se calcula en funci�n de los alquileres
dados de alta en dicho periodo. */

Select * from Bogo.Alquiler

Select a.numero_anuncio,m.ANUNCIO_CODIGO,a.inmueble,a.precio_inmueble,a.fecha_publicacion from Bogo.Anuncio a
inner join gd_esquema.Maestra m on m.ANUNCIO_CODIGO = a.

Select TOP 5 bar.nombre,
Year(a.fecha_de_inicio) as "anio", 
DATEPART(QUARTER,a.fecha_de_inicio) as "cuatrimestre"
from Bogo.Alquiler a
inner join Bogo.Anuncio ba on a.anuncio = ba.numero_anuncio
inner join Bogo.Inmueble inm on ba.inmueble = inm.numero_de_inmueble
inner join Bogo.Barrio bar on bar.codigo_barrio = inm.barrio
inner join Bogo.Agente_inmobiliario ai on ba.agente_inmobiliario = ai.codigo_agente
group by bar.nombre ,Year(a.fecha_de_inicio), 
DATEPART(QUARTER,a.fecha_de_inicio)
order by count(a.codigo_alquiler) desc