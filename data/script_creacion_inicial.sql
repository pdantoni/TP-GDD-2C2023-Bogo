USE [GD2C2023]

-- PARTE 1: borrado de tablas, funciones, procedures, vistas y esquema
-- PARTE 2: creación de esquema, tablas y fk
-- PARTE 3: creación de funciones
-- PARTE 4: creación de procedures
-- PARTE 5: creación de triggers
-- PARTE 6: creación de índices
-- PARTE 7: ejecución de los procedures para migrar los datos
-- PARTE 8: creación de vistas


---------------------------------------------------------------------------------------------------
--                                            Parte 1                                            --
---------------------------------------------------------------------------------------------------

-- BORRADO DE TABLAS
IF OBJECT_ID('BOGO.Provincia', 'U') IS NOT NULL 
	DROP TABLE BOGO.Provincia

IF OBJECT_ID('BOGO.Caracteristica', 'U') IS NOT NULL 
	DROP TABLE BOGO.Caracteristica

IF OBJECT_ID('BOGO.Localidad', 'U') IS NOT NULL 
	DROP TABLE BOGO.Localidad

IF OBJECT_ID('BOGO.Barrio', 'U') IS NOT NULL 
	DROP TABLE BOGO.Barrio

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

IF OBJECT_ID('BOGO.Tipo_operacion', 'U') IS NOT NULL 
	DROP TABLE BOGO.Tipo_operacion

IF OBJECT_ID('BOGO.Tipo_periodo', 'U') IS NOT NULL 
	DROP TABLE BOGO.Tipo_periodo

IF OBJECT_ID('BOGO.Estado_anuncio', 'U') IS NOT NULL 
	DROP TABLE BOGO.Estado_anuncio

IF OBJECT_ID('BOGO.Moneda', 'U') IS NOT NULL 
	DROP TABLE BOGO.Moneda

IF OBJECT_ID('BOGO.Caracteristica_por_inmueble', 'U') IS NOT NULL 
	DROP TABLE BOGO.Caracteristica_por_inmueble

IF OBJECT_ID('BOGO.Sucursal', 'U') IS NOT NULL 
	DROP TABLE BOGO.Sucursal

IF OBJECT_ID('BOGO.Propietario', 'U') IS NOT NULL 
	DROP TABLE BOGO.Propietario

IF OBJECT_ID('BOGO.Comprador', 'U') IS NOT NULL 
	DROP TABLE BOGO.Comprador

IF OBJECT_ID('BOGO.Agente_inmobiliario', 'U') IS NOT NULL 
	DROP TABLE BOGO.Agente_inmobiliario

IF OBJECT_ID('BOGO.Inquilino', 'U') IS NOT NULL 
	DROP TABLE BOGO.Inquilino

IF OBJECT_ID('BOGO.Pago_por_venta', 'U') IS NOT NULL 
	DROP TABLE BOGO.Pago_por_venta

IF OBJECT_ID('BOGO.Inmueble', 'U') IS NOT NULL 
	DROP TABLE BOGO.inmueble

IF OBJECT_ID('BOGO.Anuncio', 'U') IS NOT NULL 
	DROP TABLE BOGO.anuncio

IF OBJECT_ID('BOGO.Venta', 'U') IS NOT NULL 
	DROP TABLE BOGO.Venta

IF OBJECT_ID('BOGO.Alquiler', 'U') IS NOT NULL 
	DROP TABLE BOGO.Alquiler

IF OBJECT_ID('BOGO.Periodo', 'U') IS NOT NULL 
	DROP TABLE BOGO.Periodo

IF OBJECT_ID('BOGO.Pago_alquiler', 'U') IS NOT NULL 
	DROP TABLE BOGO.Pago_alquiler


-- BORRADO DE FUNCIONES


-- BORRADO DE PROCEDURES


-- BORRADO DE TRIGGERS


-- BORRADO DE VISTAS


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
--1
CREATE TABLE BOGO.Provincia
( 
	codigo_provincia INT PRIMARY KEY IDENTITY(1,1), 
    nombre VARCHAR(150)
)

--2
CREATE TABLE BOGO.Caracteristica
( 
	codigo_caracteristica INT PRIMARY KEY IDENTITY(1,1), 
	nombre VARCHAR(150)
)

--3
CREATE TABLE BOGO.Localidad
( 
	codigo_localidad INT PRIMARY KEY IDENTITY(1,1), 
    nombre VARCHAR(150),
	provincia INT --fk
)

--4
CREATE TABLE BOGO.Barrio(
	codigo_barrio INT PRIMARY KEY IDENTITY(1,1),
	nombre varchar(150),
	localidad INT --fk
)

--5
CREATE TABLE BOGO.Tipo_Inmueble
( 
    codigo_tipo_inmueble INT PRIMARY KEY IDENTITY (1,1), 
    nombre VARCHAR(150), 
)

--6
CREATE TABLE BOGO.Disposicion
( 
    codigo_disposicion INT PRIMARY KEY IDENTITY(1,1),
    descripcion VARCHAR(150)
)

--7
CREATE TABLE BOGO.Orientacion
( 
    codigo_orientacion INT PRIMARY KEY IDENTITY(1,1), 
    descripcion VARCHAR(150)
)

--8
CREATE TABLE BOGO.Estado
( 
    codigo_estado INT PRIMARY KEY IDENTITY(1,1), 
    descripcion VARCHAR(150)
)

--9
CREATE TABLE BOGO.Estado_alquiler
( 
    codigo_estado_alquiler INT PRIMARY KEY IDENTITY(1,1), 
    descripcion VARCHAR(150)
)

--10
CREATE TABLE BOGO.Medio_de_pago
( 
    codigo_medio_de_pago INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(150) 
)

--11
CREATE TABLE BOGO.Tipo_operacion(
	codigo_tipo_operacion INT PRIMARY KEY IDENTITY(1,1),
	nombre VARCHAR(150)
)

--12
CREATE TABLE BOGO.Tipo_periodo
( 
    codigo_tipo_periodo INT PRIMARY KEY IDENTITY (1,1), 
    descripcion VARCHAR(150)
)

--13
CREATE TABLE BOGO.Estado_anuncio
( 
    codigo_estado INT PRIMARY KEY IDENTITY(1,1), 
    descripcion VARCHAR(150)
)

--14
CREATE TABLE BOGO.Moneda(
	codigo_moneda INT PRIMARY KEY IDENTITY(1,1),
	descripcion VARCHAR(150)
)

--15
CREATE TABLE BOGO.Caracteristica_por_inmueble
(
	codigo_caracteristica INT,
	numero_de_inmueble INT,
	PRIMARY KEY (codigo_caracteristica, numero_de_inmueble)
)

--16
CREATE TABLE BOGO.Sucursal
( 
	codigo_sucursal INT PRIMARY KEY IDENTITY(1,1), 
    direccion VARCHAR(150),
	localidad INT, -- fk
	nombre VARCHAR(150),
	provincia INT, --fk
	telefono VARCHAR(150) 
)

--17
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

--18
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

--19
CREATE TABLE BOGO.Agente_inmobiliario(
	codigo_agente INT PRIMARY KEY IDENTITY(1,1),
	nombre varchar(150),
	apellido varchar(150),
	-- TODO sucursal INT, --fk
	dni varchar(150),
	telefono varchar(150),
	fecha_nacimiento DATETIME,
	mail VARCHAR,
	fecha_registro DATETIME
)

--20
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

--21
CREATE TABLE BOGO.Pago_por_venta
( 
	codigo_pago_por_venta INT PRIMARY KEY IDENTITY(1,1), 
    importe_del_pago FLOAT, 
    cotizacion FLOAT,
	-- TODO venta INT, --fk
	moneda INT, --fk
	medio_de_pago INT --fk
)

--22
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
	-- TODO propietario INT, --fk
	barrio INT, --fk
	localidad INT, --fk
	provincia INT, --fk
	disposicion INT, --fk
	orientacion INT, --fk
	estado INT, --fk
	caracteristicas_por_inmueble INT --fk
)

--23
CREATE TABLE BOGO.Anuncio(
	numero_anuncio INT PRIMARY KEY IDENTITY(1,1),
	fecha_publicacion DATETIME,
	fecha_finalizacion DATETIME,
	costo_anuncio FLOAT,
	estado_anuncio INT, --fk
	-- TODO agente_inmobiliario INT, --fk
	tipo_operacion INT, --fk
	tipo_periodo INT, --fk
	precio_inmueble FLOAT,
	moneda INT --fk
	-- TODO inmueble INT, --fk
)

--24
CREATE TABLE BOGO.Venta(
	codigo_venta INT PRIMARY KEY IDENTITY(1,1),
	comision_inmobiliaria FLOAT,
	fecha_de_venta DATETIME,
	precio_venta FLOAT,
	moneda INT, --fk
	-- TODO anuncio INT, --fk
	-- TODO comprador INT, --fk
)

--25
CREATE TABLE BOGO.Alquiler
( 
    codigo_alquiler INT PRIMARY KEY IDENTITY (1,1), 
    fecha_de_inicio DATETIME,
    fecha_de_fin DATETIME,
    periodos INT,
    deposito FLOAT,
	comision FLOAT,
	gastos_de_averiguaciones FLOAT,
	-- TODO anuncio INT, --fk
	-- TODO inquilino INT, --fk
	estado_alquiler INT --fk
)

--26
CREATE TABLE BOGO.Periodo
( 
    codigo_periodo INT PRIMARY KEY IDENTITY(1,1), 
    numero_periodo_de_inicio INT,
    numero_periodo_de_fin INT,
    precio FLOAT,
	-- TODO alquiler INT --fk
)

--27
CREATE TABLE BOGO.Pago_alquiler
( 
    codigo_pago_alquiler INT PRIMARY KEY IDENTITY(1,1),
    -- TODO alquiler INT, --fk
    fecha_de_pago DATETIME,
	fecha_de_vencimiento DATETIME,
    numero_de_periodo_de_pago INT,
    descripcion VARCHAR(150),
    fecha_de_inicio_periodo_de_pago DATETIME,
    fecha_de_fin_periodo_de_pago DATETIME,
    importe FLOAT,
    medio_de_pago INT --fk
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

-- TODO 
ALTER TABLE BOGO.Agente_Inmobiliario
	ADD FOREIGN KEY (sucursal) REFERENCES BOGO.Sucursal(codigo_sucursal);
GO

ALTER TABLE BOGO.Pago_por_venta
	ADD -- TODO FOREIGN KEY(venta) REFERENCES BOGO.venta(codigo_venta),
		FOREIGN KEY(moneda) REFERENCES BOGO.moneda(codigo_moneda),
		FOREIGN KEY(medio_de_pago) REFERENCES BOGO.medio_de_pago(codigo_medio_de_pago);
GO

ALTER TABLE BOGO.Inmueble
	ADD FOREIGN KEY(tipo_inmueble) REFERENCES BOGO.Tipo_Inmueble(codigo_tipo_inmueble),
		-- TODO FOREIGN KEY(propietario) REFERENCES BOGO.Propietario(codigo_propietario),
		FOREIGN KEY(barrio) REFERENCES BOGO.Barrio(codigo_barrio),
		FOREIGN KEY(disposicion) REFERENCES BOGO.Disposicion(codigo_disposicion),
		FOREIGN KEY(orientacion) REFERENCES BOGO.Orientacion(codigo_orientacion),
		FOREIGN KEY(localidad) REFERENCES BOGO.Localidad(codigo_localidad),
		FOREIGN KEY(provincia) REFERENCES BOGO.Provincia(codigo_provincia),
		FOREIGN KEY(caracteristicas_por_inmueble) REFERENCES BOGO.Caracteristicas_por_inmueble(codigo_caracteristica),
		FOREIGN KEY(estado) REFERENCES BOGO.Estado(codigo_estado);
GO

ALTER TABLE BOGO.Anuncio
	ADD -- TODO FOREIGN KEY(agente_inmobiliario) REFERENCES BOGO.Agente_Inmobiliario(codigo_agente),
		FOREIGN KEY(tipo_operacion) REFERENCES BOGO.Tipo_operacion(codigo_tipo_operacion),
		-- TODO FOREIGN KEY(inmueble) REFERENCES BOGO.Inmueble(numero_de_inmueble),
		FOREIGN KEY(moneda) REFERENCES BOGO.Moneda(codigo_moneda),
		FOREIGN KEY(tipo_periodo) REFERENCES BOGO.Tipo_periodo(codigo_tipo_periodo),
		FOREIGN KEY(estado_anuncio) REFERENCES BOGO.Estado_anuncio(codigo_estado);
GO

ALTER TABLE BOGO.Venta
	ADD --TODO FOREIGN KEY(anuncio) REFERENCES BOGO.Anuncio(numero_anuncio),
		-- TODO FOREIGN KEY(comprador) REFERENCES BOGO.Comprador(codigo_comprador),
		FOREIGN KEY(moneda) REFERENCES BOGO.Moneda(codigo_moneda)
GO

ALTER TABLE BOGO.Alquiler
	ADD -- TODO FOREIGN KEY(anuncio) REFERENCES BOGO.Anuncio(numero_anuncio),
		-- TODO FOREIGN KEY(inquilino) REFERENCES BOGO.Inquilino(codigo_inquilino),
		FOREIGN KEY(estado_alquiler) REFERENCES BOGO.Estado_alquiler(codigo_estado_alquiler);
GO

-- TODO
ALTER TABLE BOGO.Periodo
	ADD FOREIGN KEY(alquiler) REFERENCES BOGO.Alquiler(codigo_alquiler);
GO

ALTER TABLE BOGO.Pago_alquiler
	ADD -- TODO FOREIGN KEY(alquiler) REFERENCES BOGO.Alquiler(codigo_alquiler),
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

CREATE FUNCTION BOGO.OBTENER_ID_Moneda(@nombre NVARCHAR(255)) RETURNS DECIMAL (18,0) AS
BEGIN
	DECLARE @id_moneda DECIMAL(18,0);
	SELECT @id_moneda = codigo_moneda FROM BOGO.Moneda WHERE descripcion = @nombre;
	RETURN @id_moneda;
END
GO

CREATE FUNCTION BOGO.OBTENER_ID_Medio_de_pago(@nombre NVARCHAR(255)) RETURNS DECIMAL (18,0) AS
BEGIN
	DECLARE @id_Medio_de_pago DECIMAL(18,0);
	SELECT @id_Medio_de_pago = codigo_Medio_de_pago FROM BOGO.Medio_de_pago WHERE nombre = @nombre;
	RETURN @id_Medio_de_pago;
END
GO

CREATE FUNCTION BOGO.OBTENER_ID_Tipo_operacion(@nombre NVARCHAR(255)) RETURNS DECIMAL (18,0) AS
BEGIN
	DECLARE @id_tipo_operacion DECIMAL(18,0);
	SELECT @id_tipo_operacion = codigo_tipo_operacion FROM BOGO.Tipo_operacion WHERE nombre = @nombre;
	RETURN @id_tipo_operacion;
END
GO

CREATE FUNCTION BOGO.OBTENER_ID_Tipo_periodo(@nombre NVARCHAR(255)) RETURNS DECIMAL (18,0) AS
BEGIN
	DECLARE @id_tipo_periodo DECIMAL(18,0);
	SELECT @id_tipo_periodo = codigo_tipo_periodo FROM BOGO.Tipo_periodo WHERE descripcion = @nombre;
	RETURN @id_tipo_periodo;
END
GO

CREATE FUNCTION BOGO.OBTENER_ID_Estado_anuncio(@nombre NVARCHAR(255)) RETURNS DECIMAL (18,0) AS
BEGIN
	DECLARE @id_estado_anuncio DECIMAL(18,0);
	SELECT @id_estado_anuncio = codigo_estado FROM BOGO.Estado_anuncio WHERE descripcion = @nombre;
	RETURN @id_estado_anuncio;
END
GO

CREATE FUNCTION BOGO.OBTENER_ID_Estado_alquiler(@nombre NVARCHAR(255)) RETURNS DECIMAL (18,0) AS
BEGIN
	DECLARE @id_estado_alquiler DECIMAL(18,0);
	SELECT @id_estado_alquiler = codigo_estado_alquiler FROM BOGO.Estado_alquiler WHERE descripcion = @nombre;
	RETURN @id_estado_alquiler;
END
GO


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

-- PROCEDURE CARACTERISTICA
-- preguntar, es todo null en INMUEBLE_CARACTERISTICA_CABLE, INMUEBLE_CARACTERISTICA_CALEFACCION, INMUEBLE_CARACTERISTICA_GAS, INMUEBLE_CARACTERISTICA_WIFI

-- PROCEDURE LOCALIDAD ok
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

CREATE PROCEDURE BOGO.Migrar_Disposicion AS
BEGIN
	INSERT INTO BOGO.Disposicion (descripcion)
		SELECT DISTINCT	INMUEBLE_DISPOSICION FROM gd_esquema.Maestra WHERE inmueble_disposicion IS NOT NULL
END
GO

CREATE PROCEDURE BOGO.Migrar_Orientacion AS
BEGIN
	INSERT INTO BOGO.Orientacion (descripcion)
		SELECT DISTINCT	INMUEBLE_ORIENTACION FROM gd_esquema.Maestra WHERE inmueble_orientacion IS NOT NULL
END
GO

CREATE PROCEDURE BOGO.Migrar_Estado AS
BEGIN
	INSERT INTO BOGO.Estado (descripcion)
		SELECT DISTINCT	INMUEBLE_ESTADO FROM gd_esquema.Maestra WHERE inmueble_estado IS NOT NULL
END
GO

CREATE PROCEDURE BOGO.Migrar_Estado_alquiler AS
BEGIN
	INSERT INTO BOGO.Estado_alquiler (descripcion)
		SELECT DISTINCT	ALQUILER_ESTADO FROM gd_esquema.Maestra WHERE ALQUILER_ESTADO IS NOT NULL
END
GO

CREATE PROCEDURE BOGO.Migrar_Medio_de_pago AS
BEGIN
	INSERT INTO BOGO.Medio_de_pago (nombre)
		SELECT DISTINCT	PAGO_ALQUILER_MEDIO_PAGO FROM gd_esquema.Maestra WHERE PAGO_ALQUILER_MEDIO_PAGO IS NOT NULL
		UNION
		SELECT DISTINCT PAGO_VENTA_MEDIO_PAGO FROM gd_esquema.Maestra WHERE PAGO_VENTA_MEDIO_PAGO IS NOT NULL
END
GO

CREATE PROCEDURE BOGO.Migrar_Tipo_operacion AS
BEGIN
	INSERT INTO BOGO.Tipo_operacion (nombre)
		SELECT DISTINCT	ANUNCIO_TIPO_OPERACION FROM gd_esquema.Maestra WHERE ANUNCIO_TIPO_OPERACION IS NOT NULL
END
GO

CREATE PROCEDURE BOGO.Migrar_Tipo_periodo AS
BEGIN
	INSERT INTO BOGO.Tipo_periodo (descripcion)
		SELECT DISTINCT	ANUNCIO_TIPO_PERIODO FROM gd_esquema.Maestra WHERE ANUNCIO_TIPO_PERIODO IS NOT NULL
END
GO

CREATE PROCEDURE BOGO.Migrar_Estado_anuncio AS
BEGIN
	INSERT INTO BOGO.Estado_anuncio (descripcion)
		SELECT DISTINCT	ANUNCIO_ESTADO FROM gd_esquema.Maestra WHERE ANUNCIO_ESTADO IS NOT NULL
END
GO

CREATE PROCEDURE BOGO.Migrar_Moneda AS
BEGIN
	INSERT INTO BOGO.Moneda (descripcion)
		SELECT DISTINCT	ANUNCIO_MONEDA FROM gd_esquema.Maestra WHERE ANUNCIO_MONEDA IS NOT NULL
		UNION
		SELECT DISTINCT	PAGO_VENTA_MONEDA FROM gd_esquema.Maestra WHERE PAGO_VENTA_MONEDA IS NOT NULL
		UNION
		SELECT DISTINCT	VENTA_MONEDA FROM gd_esquema.Maestra WHERE VENTA_MONEDA IS NOT NULL
END
GO

-- CREATE PROCEDURE BOGO.Caracteristica_por_inmueble AS

CREATE PROCEDURE BOGO.Migrar_Sucursal AS
BEGIN
	INSERT INTO BOGO.Sucursal (telefono, direccion, nombre, localidad)
		SELECT DISTINCT	SUCURSAL_TELEFONO, SUCURSAL_DIRECCION, SUCURSAL_NOMBRE, BOGO.OBTENER_ID_LOCALIDAD(sucursal_localidad) FROM gd_esquema.Maestra 
			WHERE SUCURSAL_NOMBRE IS NOT NULL
END
GO

CREATE PROCEDURE BOGO.Migrar_Propietario AS
BEGIN
	INSERT INTO BOGO.Propietario (nombre, apellido, dni, telefono, fecha_nacimiento, mail, fecha_registro)
		SELECT DISTINCT	PROPIETARIO_NOMBRE, PROPIETARIO_APELLIDO, PROPIETARIO_DNI, PROPIETARIO_TELEFONO, PROPIETARIO_FECHA_NAC, PROPIETARIO_MAIL, PROPIETARIO_FECHA_REGISTRO FROM gd_esquema.Maestra 
			WHERE PROPIETARIO_NOMBRE IS NOT NULL
END
GO

CREATE PROCEDURE BOGO.Migrar_Comprador AS
BEGIN
	INSERT INTO BOGO.Comprador (nombre, apellido, dni, telefono, fecha_nacimiento, mail, fecha_registro)
		SELECT DISTINCT	COMPRADOR_NOMBRE, COMPRADOR_APELLIDO, COMPRADOR_DNI, COMPRADOR_TELEFONO, COMPRADOR_FECHA_NAC, COMPRADOR_MAIL, COMPRADOR_FECHA_REGISTRO FROM gd_esquema.Maestra 
			WHERE COMPRADOR_NOMBRE IS NOT NULL
END
GO

CREATE PROCEDURE BOGO.Migrar_Agente_inmobiliario AS
BEGIN
	INSERT INTO BOGO.Agente_inmobiliario (nombre, apellido, dni, telefono, fecha_nacimiento, mail, fecha_registro)
		SELECT DISTINCT	AGENTE_NOMBRE, AGENTE_APELLIDO, AGENTE_DNI, AGENTE_TELEFONO, AGENTE_FECHA_NAC, AGENTE_MAIL, AGENTE_FECHA_REGISTRO FROM gd_esquema.Maestra 
			WHERE AGENTE_NOMBRE IS NOT NULL
END
GO

CREATE PROCEDURE BOGO.Migrar_Inquilino AS
BEGIN
	INSERT INTO BOGO.Inquilino (nombre, apellido, dni, telefono, fecha_nacimiento, mail, fecha_registro)
		SELECT DISTINCT	INQUILINO_NOMBRE, INQUILINO_APELLIDO, INQUILINO_DNI, INQUILINO_TELEFONO, INQUILINO_FECHA_NAC, INQUILINO_MAIL, INQUILINO_FECHA_REGISTRO FROM gd_esquema.Maestra 
			WHERE INQUILINO_NOMBRE IS NOT NULL
END
GO

CREATE PROCEDURE BOGO.Migrar_Pago_por_venta AS
BEGIN
	INSERT INTO BOGO.Pago_por_venta (importe_del_pago, cotizacion, moneda, medio_de_pago)
		SELECT DISTINCT	PAGO_VENTA_IMPORTE, PAGO_VENTA_COTIZACION, BOGO.OBTENER_ID_Moneda(PAGO_VENTA_MONEDA), BOGO.OBTENER_ID_Medio_de_pago(PAGO_VENTA_MEDIO_PAGO) FROM gd_esquema.Maestra 
			WHERE PAGO_VENTA_IMPORTE IS NOT NULL
END
GO

CREATE PROCEDURE BOGO.Migrar_Inmueble AS
BEGIN
	INSERT INTO BOGO.Inmueble (descripcion, direccion, ambientes, superficie, fecha_de_construccion, expensas, nombre, tipo_inmueble, barrio, disposicion, orientacion, estado, provincia)
		SELECT DISTINCT	
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
			BOGO.OBTENER_ID_PROVINCIA(inmueble_provincia)
			FROM gd_esquema.Maestra 
			WHERE INMUEBLE_NOMBRE IS NOT NULL
END
GO

CREATE PROCEDURE BOGO.Migrar_Anuncio AS
BEGIN
	INSERT INTO BOGO.Anuncio (fecha_publicacion, tipo_operacion, precio_inmueble, moneda, tipo_periodo, estado_anuncio, fecha_finalizacion, costo_anuncio)
		SELECT DISTINCT	
			ANUNCIO_FECHA_PUBLICACION, 
			BOGO.OBTENER_ID_Tipo_operacion(ANUNCIO_TIPO_OPERACION), 
			ANUNCIO_PRECIO_PUBLICADO, 
			BOGO.OBTENER_ID_MONEDA(ANUNCIO_MONEDA),
			ANUNCIO_TIPO_PERIODO,
			BOGO.OBTENER_ID_Estado_anuncio(ANUNCIO_ESTADO),
			ANUNCIO_FECHA_FINALIZACION,
			ANUNCIO_COSTO_ANUNCIO
			FROM gd_esquema.Maestra 
			WHERE ANUNCIO_FECHA_PUBLICACION IS NOT NULL
END
GO

CREATE PROCEDURE BOGO.Migrar_Alquiler AS
BEGIN
	INSERT INTO BOGO.Alquiler (fecha_de_inicio, fecha_de_fin, deposito, comision, gastos_de_averiguaciones, estado_alquiler)
		SELECT DISTINCT	
			ALQUILER_FECHA_INICIO, 
			ALQUILER_FECHA_FIN, 
			ALQUILER_DEPOSITO, 
			ALQUILER_COMISION,
			ALQUILER_GASTOS_AVERIGUA,
			BOGO.OBTENER_ID_Estado_alquiler(ALQUILER_ESTADO)
			FROM gd_esquema.Maestra 
			WHERE ALQUILER_FECHA_INICIO IS NOT NULL
END
GO

-- REVISAR
CREATE PROCEDURE BOGO.Migrar_Periodo AS
BEGIN
	INSERT INTO BOGO.Periodo (numero_periodo_de_inicio, numero_periodo_de_fin, precio, alquiler)
		SELECT DISTINCT	DETALLE_ALQ_NRO_PERIODO_INI, DETALLE_ALQ_NRO_PERIODO_FIN FROM gd_esquema.Maestra 
			WHERE INMUEBLE_NOMBRE IS NOT NULL
END
GO

CREATE PROCEDURE BOGO.Migrar_Pago_alquiler AS
BEGIN
	INSERT INTO BOGO.Pago_alquiler (alquiler, fecha_De_pago, numero_de_periodo_de_pago, descripcion, fecha_de_inicio_periodo_de_pago, fecha_de_fin_periodo_de_pago, importe, medio_de_pago)
		SELECT DISTINCT	PAGO_ALQUILER_CODIGO, 
		PAGO_ALQUILER_FECHA,
		PAGO_ALQUILER_NRO_PERIODO,
		PAGO_ALQUILER_DESC,
		PAGO_ALQUILER_FEC_INI,
		PAGO_ALQUILER_FEC_FIN,
		PAGO_ALQUILER_IMPORTE,
		BOGO.OBTENER_ID_Medio_de_pago(PAGO_ALQUILER_MEDIO_PAGO)
		FROM gd_esquema.Maestra 
		WHERE PAGO_ALQUILER_CODIGO IS NOT NULL
END
GO


---------------------------------------------------------------------------------------------------
--                                            Parte 5                                            --
---------------------------------------------------------------------------------------------------

-- CREACIÓN DE TRIGGERS
select * from bogo.TIPO_OPERACION

---------------------------------------------------------------------------------------------------
--                                            Parte 6                                            --
---------------------------------------------------------------------------------------------------

-- CREACIÓN DE ÍNDICES
-- sobre fks (chequear)


---------------------------------------------------------------------------------------------------
--                                            Parte 7                                            --
---------------------------------------------------------------------------------------------------

--  EJECUCIÓN DE LOS PROCEDURES PARA MIGRAR LOS DATOS
EXEC BOGO.migrar_Provincia;
GO
EXEC BOGO.migrar_Localidad;
GO
EXEC BOGO.migrar_Barrio;
GO
EXEC BOGO.migrar_Tipo_inmueble
GO
EXEC BOGO.Migrar_disposicion
GO
EXEC BOGO.Migrar_Orientacion
GO
EXEC BOGO.Migrar_Estado
GO
EXEC BOGO.Migrar_Estado_alquiler
GO
EXEC BOGO.Migrar_Medio_de_pago
GO
EXEC BOGO.Migrar_Tipo_operacion
GO
EXEC BOGO.Migrar_Tipo_periodo
GO
EXEC BOGO.Migrar_Estado_anuncio
GO
EXEC BOGO.Migrar_Moneda
GO
EXEC BOGO.Migrar_Sucursal
GO
EXEC BOGO.Migrar_Propietario
GO
EXEC BOGO.Migrar_Comprador
GO
EXEC BOGO.Migrar_Agente_inmobiliario 
GO
EXEC BOGO.Migrar_Inquilino
GO
EXEC BOGO.Migrar_Pago_por_venta
GO
EXEC BOGO.Migrar_Inmueble
GO
EXEC BOGO.Migrar_Anuncio
GO
EXEC BOGO.Migrar_Alquiler
GO
EXEC BOGO.Migrar_periodo
GO
EXEC BOGO.Migrar_Pago_alquiler
GO


---------------------------------------------------------------------------------------------------
--                                            Parte 8                                            --
---------------------------------------------------------------------------------------------------

--  CREACION DE VISTAS  




--------------------------------------------------------------------
--------------------------------------------------------------------
-- SCRIPT DE UNIONES DE TABLAS EJEMPLO
--Script de union de monedas en todas las tablas--
Select distinct INMUEBLE_CARACTERISTICA_CABLE from gd_esquema.Maestra
UNION 
Select distinct INMUEBLE_CARACTERISTICA_CALEFACCION from gd_esquema.Maestra
UNION 
Select distinct INMUEBLE_CARACTERISTICA_GAS from gd_esquema.Maestra


--------------------------------------------------------------------
-- TABLA MAESTRA
Use GD2C2023
select * FROM gd_esquema.Maestra
where SUCURSAL_LOCALIDAD is not null



SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'gd_esquema'
