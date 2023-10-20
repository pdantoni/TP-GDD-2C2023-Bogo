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
CREATE SCHEMA BOGO
GO

-- CREACION DE TABLAS
--1
CREATE TABLE BOGO.Provincia
( 
	codigo_provincia INT PRIMARY KEY IDENTITY(1,1), 
    nombre VARCHAR(150),
)GO

--2
CREATE TABLE BOGO.Caracteristica
( 
	codigo_caracteristica INT PRIMARY KEY IDENTITY(1,1), 
    nombre VARCHAR(150),
)GO

--3
CREATE TABLE BOGO.Localidad
( 
	codigo_localidad INT PRIMARY KEY IDENTITY(1,1), 
    nombre VARCHAR(150),
	provincia INT, --fk
)GO

--4
CREATE TABLE BOGO.Barrio(
	codigo_barrio int Primary key identity(1,1),
	nombre varchar(30),
	localidad int --fk
)GO

--5
CREATE TABLE BOGO.Tipo_Inmueble
( 
    codigo_tipo_inmueble INT PRIMARY KEY IDENTITY (1,1), 
    nombre VARCHAR(150), 
)GO

--6
CREATE TABLE BOGO.Disposicion
( 
    codigo_disposicion INT PRIMARY KEY IDENTITY(1,1),
    descripcion VARCHAR(150), 
)GO

--7
CREATE TABLE BOGO.Orientacion
( 
    codigo_orientacion INT PRIMARY KEY IDENTITY(1,1), 
    descripcion VARCHAR(150), 
)GO

--8
CREATE TABLE BOGO.Estado
( 
    codigo_estado INT PRIMARY KEY IDENTITY(1,1), 
    descripcion VARCHAR(150), 
)GO

--9
CREATE TABLE BOGO.Estado_alquiler
( 
    codigo_estado_alquiler INT PRIMARY KEY IDENTITY(1,1), 
    descripcion VARCHAR(150), 
)GO

--10
CREATE TABLE BOGO.Medio_de_pago
( 
    codigo_medio_de_pago INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(150), 
)GO

--11
CREATE TABLE BOGO.Tipo_operacion(
	codigo_tipo_operacion INT PRIMARY KEY IDENTITY(1,1),
	nombre VARCHAR(30)
)GO

--12
CREATE TABLE BOGO.Tipo_periodo
( 
    codigo_tipo_periodo INT PRIMARY KEY IDENTITY (1,1), 
    descripcion VARCHAR(150), 
)GO

--13
CREATE TABLE BOGO.Estado_anuncio
( 
    codigo_estado INT PRIMARY KEY IDENTITY(1,1), 
    descripcion VARCHAR(150), 
)GO

--14
CREATE TABLE BOGO.Moneda(
	codigo_moneda INT PRIMARY KEY IDENTITY(1,1),
	descripcion VARCHAR(30)
)GO

--15
CREATE TABLE BOGO.Caracteristica_por_inmueble
(
	codigo_caracteristica INT,
	numero_de_inmueble INT,
	PRIMARY KEY (codigo_caracteristica, numero_de_inmueble)
)GO

--16
CREATE TABLE BOGO.Sucursal
( 
	codigo_sucursal INT PRIMARY KEY IDENTITY(1,1), 
    telefono VARCHAR(20), 
    direccion VARCHAR(150),
    nombre VARCHAR(150),
	localidad INT, -- fk
)GO

--17
CREATE TABLE BOGO.Propietario(
	codigo_propietario INT PRIMARY KEY IDENTITY(1,1),
	nombre VARCHAR(30),
	apellido VARCHAR(30),
	dni INT,
	direccion VARCHAR(30),
	localidad INT, --fk
	telefono VARCHAR(30),
	fecha_nacimiento DATETIME,
	mail VARCHAR(30)
)GO

--18
CREATE TABLE BOGO.Comprador
( 
	codigo_comprador INT PRIMARY KEY IDENTITY(1,1), 
    nombre VARCHAR(150),
	apellido VARCHAR(150),
	dni VARCHAR(150),
	direccion VARCHAR(150),
	localidad INT, --fk
	telefono VARCHAR(30),
	fecha_nacimiento DATETIME,
	mail VARCHAR(30)
)GO

--19
CREATE TABLE BOGO.Agente_inmobiliario(
	codigo_agente INT PRIMARY KEY IDENTITY(1,1),
	nombre VARCHAR(30),
	apellido VARCHAR(30),
	sucursal INT, --fk
	dni VARCHAR(30),
	direccion VARCHAR(30),
	localidad INT, --fk
	telefono VARCHAR(30),
	fecha_nacimiento DATETIME,
	mail VARCHAR
)GO

--20
CREATE TABLE BOGO.Inquilino
( 
    codigo_inquilino INT PRIMARY KEY IDENTITY(1,1), 
    nombre VARCHAR(150),
    apellido VARCHAR(150),
    dni VARCHAR(150),
    direccion VARCHAR(150),
    localidad INT, --fk
    telefono VARCHAR(150),
    fecha_nacimiento datetime,
    mail VARCHAR(150) 
)GO

--21
CREATE TABLE BOGO.Pago_por_venta
( 
	codigo_pago_por_venta INT PRIMARY KEY IDENTITY(1,1), 
    importe_del_pago FLOAT, 
    cotizacion FLOAT,
	venta INT, --fk
	moneda INT, --fk
	medio_de_pago INT, --fk
)GO

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
	propietario INT, --fk
	barrio INT, --fk
	disposicion INT, --fk
	orientacion INT, --fk
	estado INT, --fk
)GO

--23
CREATE TABLE BOGO.Anuncio(
	numero_anuncio INT PRIMARY KEY IDENTITY(1,1),
	fecha_publicacion DATETIME,
	agente_inmobiliario INT, --fk
	tipo_operacion INT, --fk
	inmueble INT, --fk
	precio_inmueble FLOAT,
	moneda INT, --fk
	tipo_periodo INT, --fk
	estado_anuncio INT, --fk
	fecha_finalizacion DATETIME,
	costo_publicacion FLOAT
)GO

--24
CREATE TABLE BOGO.Venta(
	codigo_venta INT PRIMARY KEY IDENTITY(1,1),
	anuncio INT, --fk
	comprador INT, --fk
	fecha_de_venta DATETIME,
	precio_venta FLOAT,
	moneda INT, --fk
	comision_inmobiliaria FLOAT
)GO

--25
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
)GO

--26
CREATE TABLE BOGO.Periodo
( 
    codigo_periodo INT PRIMARY KEY IDENTITY(1,1), 
    numero_periodo_de_inicio INT,
    numero_periodo_de_fin INT,
    precio FLOAT,
	alquiler INT --fk
)GO

--27
CREATE TABLE BOGO.Pago_alquiler
( 
    codigo_pago_alquiler INT PRIMARY KEY IDENTITY(1,1),
    alquiler INT, --fk
    fecha_de_pago datetime,
    numero_de_periodo_de_pago INT,
    descripcion VARCHAR(150),
    fecha_de_inicio_periodo_de_pago datetime,
    fecha_de_fin_periodo_de_pago datetime,
    importe FLOAT,
    medio_de_pago INT --fk
)GO

-- CREACION DE PKs COMPUESTAS
ALTER TABLE BOGO.Localidad
	ADD FOREIGN KEY(provincia) REFERENCES BOGO.Provincia(codigo_provincia);
GO

ALTER TABLE BOGO.Barrio
    ADD FOREIGN KEY(localidad) REFERENCES BOGO.Localidad(codigo_localidad);
GO

ALTER TABLE BOGO.sucursal
	ADD FOREIGN KEY(localidad) REFERENCES BOGO.Localidad(codigo_localidad);
GO

Alter Table BOGO.Propietario 
	ADD FOREIGN KEY(localidad) REFERENCES BOGO.Localidad(codigo_localidad);
GO

ALTER TABLE BOGO.Comprador
	ADD FOREIGN KEY(localidad) REFERENCES BOGO.localidad(codigo_localidad);
GO

ALTER TABLE BOGO.Agente_Inmobiliario
    ADD FOREIGN KEY (sucursal) REFERENCES BOGO.Sucursal(codigo_sucursal),
    FOREIGN KEY(localidad) REFERENCES BOGO.Localidad(codigo_localidad);
GO

ALTER TABLE BOGO.Inquilino
    ADD FOREIGN KEY(localidad) REFERENCES BOGO.Localidad(codigo_localidad);
GO

ALTER TABLE BOGO.Pago_por_venta
	ADD FOREIGN KEY(venta) REFERENCES BOGO.venta(codigo_de_venta),
		FOREIGN KEY(moneda) REFERENCES BOGO.moneda(codigo_moneda),
		FOREIGN KEY(medio_de_pago) REFERENCES BOGO.medio_de_pago(codigo_medio_de_pago);
GO

ALTER TABLE BOGO.Inmueble
    ADD FOREIGN KEY(tipo_inmueble) REFERENCES BOGO.Tipo_Inmueble(codigo_tipo_inmueble),
        FOREIGN KEY(propietario) REFERENCES BOGO.Propietario(codigo_propietario),
        FOREIGN KEY(barrio) REFERENCES BOGO.Barrio(codigo_barrio),
        FOREIGN KEY(disposicion) REFERENCES BOGO.Disposicion(codigo_disposicion),
        FOREIGN KEY(orientacion) REFERENCES BOGO.Orientacion(codigo_orientacion),
        FOREIGN KEY(estado) REFERENCES BOGO.Estado(codigo_estado);
GO

ALTER TABLE BOGO.Anuncio
    ADD FOREIGN KEY(agente_inmobiliario) REFERENCES BOGO.Agente_Inmobiliario(codigo_agente),
    FOREIGN KEY(tipo_operacion) REFERENCES BOGO.Operacion(codigo_operacion),
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

ALTER TABLE BOGO.Pago_de_alquiler
    ADD FOREIGN KEY(alquiler) REFERENCES BOGO.Alquiler(codigo_alquiler),
		FOREIGN KEY(medio_de_pago) REFERENCES BOGO.Medio_de_pago(codigo_medio_de_pago);
GO


---------------------------------------------------------------------------------------------------
--                                            Parte 3                                            --
---------------------------------------------------------------------------------------------------

--  CREACION DE FUNCIONES 
ALTER FUNCTION BOGO.OBTENER_ID_PROVINCIA(@nombre NVARCHAR(255)) RETURNS DECIMAL (18,0) AS
BEGIN
	DECLARE @id_provincia DECIMAL(18,0);
	SELECT @id_provincia = codigo_provincia FROM BOGO.provincia WHERE nombre = @nombre;
	RETURN @id_provincia;
END
GO
exec BOGO.OBTENER_ID_PROVINCIA 'Salta';
go

---------------------------------------------------------------------------------------------------
--                                            Parte 4                                            --
---------------------------------------------------------------------------------------------------

--  CREACION DE PROCEDURES 
CREATE PROCEDURE BOGO.migrar_Provincia AS
BEGIN
	INSERT INTO BOGO.Provincia (nombre)
		SELECT DISTINCT SUCURSAL_PROVINCIA FROM gd_esquema.Maestra
		WHERE sucursal_provincia IS NOT NULL
END
GO
EXEC BOGO.migrar_Provincia;
GO

-- PROCEDURE CARACTERISTICA
-- preguntar, es todo null en INMUEBLE_CARACTERISTICA_CABLE, INMUEBLE_CARACTERISTICA_CALEFACCION, INMUEBLE_CARACTERISTICA_GAS, INMUEBLE_CARACTERISTICA_WIFI

-- PROCEDURE LOCALIDAD ok
-- revisar codigo que empeiza en 3
CREATE PROCEDURE BOGO.migrar_Localidad AS
BEGIN
	INSERT INTO BOGO.Localidad (nombre, provincia)
		SELECT DISTINCT SUCURSAL_LOCALIDAD, BOGO.OBTENER_ID_PROVINCIA(sucursal_provincia) FROM gd_esquema.Maestra
		WHERE sucursal_localidad IS NOT NULL
END
GO
EXEC BOGO.migrar_Localidad;
GO


---------------------------------------------------------------------------------------------------
--                                            Parte 5                                            --
---------------------------------------------------------------------------------------------------

-- CREACIÓN DE TRIGGERS


---------------------------------------------------------------------------------------------------
--                                            Parte 6                                            --
---------------------------------------------------------------------------------------------------

-- CREACIÓN DE ÍNDICES


---------------------------------------------------------------------------------------------------
--                                            Parte 7                                            --
---------------------------------------------------------------------------------------------------

--  EJECUCIÓN DE LOS PROCEDURES PARA MIGRAR LOS DATOS
EXEC BOGO.Migrar_ ;



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
select SUCURSAL_PROVINCIA, SUCURSAL_LOCALIDAD FROM gd_esquema.Maestra
where SUCURSAL_LOCALIDAD is not null



