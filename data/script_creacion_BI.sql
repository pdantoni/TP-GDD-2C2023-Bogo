USE [GD2C2023]

-- PARTE 1: borrado de tablas, funciones, procedures y esquema
-- PARTE 2: creación de esquema, tablas y fk
-- PARTE 3: creación de funciones
-- PARTE 4: creación de procedures
-- PARTE 5: ejecución de los procedures para migrar los datos

---------------------------------------------------------------------------------------------------
--                                            Parte 1                                            --
---------------------------------------------------------------------------------------------------

-- BORRADO DE TABLAS
IF OBJECT_ID('BOGO.BI_Tipo_Inmueble', 'U') IS NOT NULL DROP TABLE BOGO.BI_Tipo_Inmueble
IF OBJECT_ID('BOGO.BI_Tipo_operacion', 'U') IS NOT NULL DROP TABLE BOGO.BI_Tipo_operacion
IF OBJECT_ID('BOGO.BI_Tiempo', 'U') IS NOT NULL DROP TABLE BOGO.BI_Tiempo
IF OBJECT_ID('BOGO.BI_Moneda', 'U') IS NOT NULL DROP TABLE BOGO.BI_Moneda
IF OBJECT_ID('BOGO.BI_rangos_superficie', 'U') IS NOT NULL DROP TABLE BOGO.BI_rangos_superficie
IF OBJECT_ID('BOGO.BI_Ambientes', 'U') IS NOT NULL DROP TABLE BOGO.BI_Ambientes
IF OBJECT_ID('BOGO.BI_Ubicacion', 'U') IS NOT NULL DROP TABLE BOGO.BI_Ubicacion
IF OBJECT_ID('BOGO.BI_Anuncios', 'U') IS NOT NULL DROP TABLE BOGO.BI_Anuncios
IF OBJECT_ID('BOGO.BI_Fecha_publicacion', 'U') IS NOT NULL DROP TABLE BOGO.BI_Fecha_publicacion
IF OBJECT_ID('BOGO.BI_Fecha_finalizacion', 'U') IS NOT NULL DROP TABLE BOGO.BI_Fecha_finalizacion
IF OBJECT_ID('BOGO.BI_Barrio', 'U') IS NOT NULL DROP TABLE BOGO.BI_Barrio
IF OBJECT_ID('BOGO.BI_Edad', 'U') IS NOT NULL DROP TABLE BOGO.BI_Edad
IF OBJECT_ID('BOGO.BI_Alquiler', 'U') IS NOT NULL DROP TABLE BOGO.BI_Alquiler
IF OBJECT_ID('BOGO.BI_estado_Alquiler', 'U') IS NOT NULL DROP TABLE BOGO.BI_estado_Alquiler
IF OBJECT_ID('BOGO.BI_pago_alquiler', 'U') IS NOT NULL DROP TABLE BOGO.BI_pago_alquiler
IF OBJECT_ID('BOGO.BI_venta', 'U') IS NOT NULL DROP TABLE BOGO.BI_venta
IF OBJECT_ID('BOGO.BI_inmueble', 'U') IS NOT NULL DROP TABLE BOGO.BI_inmueble
IF OBJECT_ID('BOGO.BI_estado_inmueble', 'U') IS NOT NULL DROP TABLE BOGO.BI_estado_inmueble
IF OBJECT_ID('BOGO.BI_localidad', 'U') IS NOT NULL DROP TABLE BOGO.BI_localidad
-- IF OBJECT_ID('BOGO.BI_operaciones', 'U') IS NOT NULL DROP TABLE BOGO.BI_operaciones

-- BORRADO DE FUNCIONES
IF OBJECT_ID('BOGO.OBTENER_ID_RANGO') IS NOT NULL DROP FUNCTION BOGO.OBTENER_ID_RANGO
IF OBJECT_ID('BOGO.OBTENER_RANGO_EDAD') IS NOT NULL DROP FUNCTION BOGO.OBTENER_RANGO_EDAD
IF OBJECT_ID('BOGO.OBTENER_CUATRIMESTRE') IS NOT NULL DROP FUNCTION BOGO.OBTENER_CUATRIMESTRE

-- BORRADO DE PROCEDURES
IF OBJECT_ID('BOGO.BI_cargar_edad') IS NOT NULL DROP PROCEDURE BOGO.BI_cargar_edad
IF OBJECT_ID('BOGO.BI_migrar_tiempo') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_tiempo
IF OBJECT_ID('BOGO.BI_migrar_tipo_operacion') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_tipo_operacion
IF OBJECT_ID('BOGO.BI_migrar_tipo_inmueble') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_tipo_inmueble
IF OBJECT_ID('BOGO.BI_migrar_moneda') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_moneda
IF OBJECT_ID('BOGO.BI_migrar_rangos_superficie') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_rangos_superficie
IF OBJECT_ID('BOGO.BI_migrar_ambientes') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_ambientes
IF OBJECT_ID('BOGO.BI_migrar_ubicacion') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_ubicacion
IF OBJECT_ID('BOGO.BI_migrar_barrios') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_barrios
IF OBJECT_ID('BOGO.BI_migrar_fecha_publicacion') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_fecha_publicacion
IF OBJECT_ID('BOGO.BI_migrar_fecha_finalizacion') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_fecha_finalizacion
IF OBJECT_ID('BOGO.BI_migrar_anuncios') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_anuncios
IF OBJECT_ID('BOGO.BI_migrar_barrios') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_barrios
IF OBJECT_ID('BOGO.BI_migrar_Edad') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_Edad
IF OBJECT_ID('BOGO.BI_migrar_alquiler') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_alquiler
IF OBJECT_ID('BOGO.BI_migrar_estado_alquiler') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_estado_alquiler
IF OBJECT_ID('BOGO.BI_migrar_pago_alquiler') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_pago_alquiler
IF OBJECT_ID('BOGO.BI_migrar_localidad') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_localidad
IF OBJECT_ID('BOGO.BI_migrar_venta') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_venta
IF OBJECT_ID('BOGO.BI_migrar_estado_inmueble') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_estado_inmueble

-- BORRADO DE VISTAS
IF OBJECT_ID('BOGO.v_duracion_promedio_dias_anuncio') IS NOT NULL DROP VIEW BOGO.v_duracion_promedio_dias_anuncio
IF OBJECT_ID('BOGO.v_promedio_precio_anuncio') IS NOT NULL DROP VIEW BOGO.v_promedio_precio_anuncio
IF OBJECT_ID('BOGO.v_5_barrios_mas_elegidos_rango_etario') IS NOT NULL DROP VIEW BOGO.v_5_barrios_mas_elegidos_rango_etario
IF OBJECT_ID('BOGO.v_porcentaje_incumplimiento_de_pagos') IS NOT NULL DROP VIEW BOGO.v_porcentaje_incumplimiento_de_pagos
IF OBJECT_ID('BOGO.v_promedio_de_incremento_del_valor_de_los_alquileres') IS NOT NULL DROP VIEW BOGO.v_promedio_de_incremento_del_valor_de_los_alquileres
IF OBJECT_ID('BOGO.v_precio_promedio_m2_ventas') IS NOT NULL DROP VIEW BOGO.v_precio_promedio_m2_ventas


---------------------------------------------------------------------------------------------------
--                                            Parte 2                                            --
---------------------------------------------------------------------------------------------------

-- CREACION DE TABLAS
CREATE TABLE BOGO.BI_Tipo_Inmueble( 
    codigo_tipo_inmueble INT PRIMARY KEY IDENTITY (1,1), 
    nombre VARCHAR(150), 
)

CREATE TABLE BOGO.BI_Tipo_operacion(
	codigo_tipo_operacion INT PRIMARY KEY IDENTITY(1,1),
	nombre VARCHAR(150)
)

CREATE TABLE BOGO.BI_Tiempo(
	codigo_tiempo INT PRIMARY KEY IDENTITY(1,1),
	anio INT,
	cuatrimestre INT check(cuatrimestre >= 1 and cuatrimestre <= 3),
	mes INT
)

CREATE TABLE BOGO.BI_Moneda(
	codigo_moneda INT PRIMARY KEY IDENTITY(1,1),
	descripcion VARCHAR(150)
)

CREATE TABLE BOGO.BI_rangos_superficie(
	codigo_m2 INT PRIMARY KEY IDENTITY(1,1),
	limite_inferior int,
	limite_superior int,
	descipcion_rango VARCHAR(150)
)

CREATE TABLE BOGO.BI_Ambientes(
	codigo_ambientes INT PRIMARY KEY IDENTITY(1,1),
	cantidad VARCHAR(150)
)

CREATE TABLE BOGO.BI_Ubicacion(
	codigo_ubicacion INT PRIMARY KEY IDENTITY(1,1),
	codigo_provincia INT,
	codigo_localidad INT,
	codigo_barrio INT,
	nombre_provincia VARCHAR(250),
	nombre_localidad VARCHAR(250),
	nombre_barrio VARCHAR(250)
)

CREATE TABLE BOGO.BI_Barrio(
	cod_barrio INT PRIMARY KEY IDENTITY(1,1),
	descripcion varchar(250)
)

CREATE TABLE BOGO.BI_Localidad(
	cod_localidad INT PRIMARY KEY IDENTITY(1,1),
	descripcion varchar(250)
)

CREATE TABLE BOGO.BI_Edad(
	id_edad INT PRIMARY KEY IDENTITY(1,1),
	edad_inferior int,
	edad_superior int,
	rango NVARCHAR(50) NOT NULL
)

CREATE TABLE BOGO.BI_Fecha_publicacion(
	codigo INT PRIMARY KEY IDENTITY(1,1),
	fecha_publicacion DATE
)

CREATE TABLE BOGO.BI_Fecha_finalizacion(
	codigo INT PRIMARY KEY IDENTITY(1,1),
	fecha_finalizacion DATE
)

CREATE TABLE BOGO.BI_estado_Alquiler(
	estado_alquiler INT PRIMARY KEY IDENTITY (1,1),
	nombre NVARCHAR(150) NULL
)

CREATE TABLE BOGO.BI_estado_inmueble(
	estado_inmueble INT PRIMARY KEY IDENTITY (1,1),
	nombre NVARCHAR(150) NULL
)

-------------------------------------------------------
-- TABLAS DE HECHOS
CREATE TABLE BOGO.BI_Anuncios(
	codigo_anuncio int,
	codigo_tiempo INT,
	codigo_fecha_alta int,
	codigo_fecha_baja int,
	codigo_tipo_operacion INT,
	codigo_tipo_inmueble INT,
	codigo_moneda INT,
	codigo_rango_superficie INT, 
	codigo_ambientes INT, 
	codigo_ubicacion INT, 
	duracion_promedio DECIMAL(12,2),  -- renombrar a precio_anuncio
	precio_promedio DECIMAL(12,2),
	inmueble INT,
	PRIMARY KEY (codigo_anuncio, codigo_fecha_alta, codigo_fecha_baja,  codigo_tiempo, codigo_tipo_operacion, codigo_tipo_inmueble, codigo_moneda, codigo_rango_superficie, codigo_ambientes, codigo_ubicacion)
)


CREATE TABLE BOGO.BI_Inmueble(
    codigo_inmueble INT PRIMARY KEY IDENTITY (1,1),
    descripcion VARCHAR(150),
    direccion VARCHAR(150),
    superficie FLOAT,
    tipo_inmueble INT,
    barrio INT,
    localidad INT,
    provincia INT
)

CREATE TABLE BOGO.BI_Alquiler(
	codigo_alquiler INT,
	codigo_tiempo INT, 
	codigo_edad INT,  
	codigo_barrio INT,
	fecha_de_inicio DATE,
	estado_alquiler INT,
	PRIMARY KEY(codigo_alquiler, codigo_tiempo, codigo_edad, codigo_barrio)
)

CREATE TABLE BOGO.BI_Venta(
    codigo_venta INT,
	codigo_tiempo INT,
	codigo_localidad INT,
	codigo_estado_inmueble INT,
	precio_venta INT, 
	superficie_inmueble INT,
	precio_m2 DECIMAL(12,2),
	PRIMARY KEY (codigo_venta, codigo_tiempo, codigo_localidad, codigo_estado_inmueble)
)

CREATE TABLE BOGO.BI_pago_alquiler(
	codigo_pago_alquiler INT, 
	alquiler INT,
	codigo_tiempo INT,
	codigo_estado_alquiler INT,
    fecha_de_pago DATE,
	fecha_de_vencimiento DATE,
    importe FLOAT,
	pago_a_tiempo BIT,
	PRIMARY KEY (codigo_pago_alquiler, alquiler, codigo_tiempo, codigo_estado_alquiler)
)

-- VER
/*
CREATE TABLE BOGO.BI_operaciones
	codigo_operacion INT,
	codigo_tipo_operacion INT,
	codigo_sucursal INT,
	codigo_empleado INT, -- no se si este sería el agente inmobiliario y solo referenciar este o si sumar la sucursal como codigo tambien (lo q esta arriba)
	codigo_edad INT, -- rango etario
	codigo_anuncio INT, -- esto sería porque pide en funcion de los anuncios publicados,
	codigo_moneda INT, -- y este sería para distinguir el tipo de moneda en la vista 9
	PRIMARY KEY ()
*/

-------------------------------------------------------
-- CREACION DE PKs COMPUESTAS
ALTER TABLE BOGO.BI_Alquiler
	ADD FOREIGN KEY (codigo_tiempo) REFERENCES BOGO.BI_Tiempo(codigo_tiempo),
		FOREIGN KEY (codigo_edad) REFERENCES BOGO.BI_Edad(id_Edad),
		FOREIGN KEY (codigo_barrio) REFERENCES BOGO.BI_barrio(cod_barrio)
		--FOREIGN KEY (fecha_de_inicio) REFERENCES BOGO.alquiler(fecha_inicio)
GO

ALTER TABLE BOGO.BI_Ubicacion
	ADD	FOREIGN KEY (codigo_provincia) REFERENCES BOGO.provincia(codigo_provincia), 
		FOREIGN KEY (codigo_localidad) REFERENCES BOGO.localidad(codigo_localidad),
		FOREIGN KEY (codigo_barrio) REFERENCES BOGO.barrio(codigo_barrio)
GO 

ALTER TABLE BOGO.BI_Anuncios
	ADD FOREIGN KEY (codigo_tiempo) REFERENCES BOGO.BI_Tiempo(codigo_tiempo),
		FOREIGN KEY (codigo_tipo_operacion) REFERENCES BOGO.Tipo_operacion(codigo_tipo_operacion),
		FOREIGN KEY (codigo_tipo_inmueble) REFERENCES BOGO.Tipo_Inmueble(codigo_tipo_inmueble),
		FOREIGN KEY (codigo_moneda) REFERENCES BOGO.BI_Moneda(codigo_moneda),
		FOREIGN KEY (codigo_rango_superficie) REFERENCES BOGO.BI_rangos_superficie(codigo_m2),
		FOREIGN KEY (codigo_ambientes) REFERENCES BOGO.BI_Ambientes(codigo_ambientes),
		FOREIGN KEY (codigo_ubicacion) REFERENCES BOGO.BI_Ubicacion(codigo_ubicacion),
		FOREIGN KEY (codigo_fecha_alta) REFERENCES BOGO.BI_Fecha_publicacion(codigo),
		FOREIGN KEY (codigo_fecha_baja) REFERENCES BOGO.BI_Fecha_finalizacion(codigo),
		FOREIGN KEY (inmueble) REFERENCES BOGO.inmueble(numero_de_inmueble)
GO

ALTER TABLE BOGO.BI_pago_alquiler
	ADD FOREIGN KEY (codigo_pago_alquiler) REFERENCES BOGO.Pago_alquiler(codigo_pago_alquiler),
		FOREIGN KEY (alquiler) REFERENCES BOGO.Alquiler(codigo_alquiler),
		FOREIGN KEY (codigo_tiempo) REFERENCES BOGO.BI_Tiempo(codigo_tiempo),
		FOREIGN KEY (codigo_estado_alquiler) REFERENCES BOGO.BI_Estado_Alquiler(estado_alquiler)
GO

ALTER TABLE BOGO.BI_venta
	ADD FOREIGN KEY (codigo_venta) REFERENCES BOGO.venta(codigo_venta),	
		FOREIGN KEY (codigo_tiempo) REFERENCES BOGO.BI_Tiempo(codigo_tiempo),	
		FOREIGN KEY (codigo_localidad) REFERENCES BOGO.BI_localidad(cod_localidad),
		FOREIGN KEY (codigo_estado_inmueble) REFERENCES BOGO.BI_Estado_inmueble(estado_inmueble)
GO


---------------------------------------------------------------------------------------------------
--                                            Parte 3                                            --
---------------------------------------------------------------------------------------------------

--  CREACION DE FUNCIONES 
CREATE FUNCTION BOGO.OBTENER_ID_RANGO(@rango FLOAT) RETURNS INT
AS
BEGIN
	DECLARE @id INT
		IF(@rango < 35) SET @id = 1
		IF(@rango >= 35 and @rango < 55) SET @id = 2
		IF(@rango >= 55 and @rango < 75) SET @id = 3
		IF(@rango >= 75 and @rango < 100) SET @id = 4
		IF(@rango >= 100) SET @id = 5
	RETURN @id
END
GO

CREATE FUNCTION BOGO.OBTENER_RANGO_EDAD(@FECHA_NACIMIENTO DATE) RETURNS DECIMAL(18) AS
BEGIN
	DECLARE @id_edad DECIMAL(18);
	DECLARE @HOY DATE;
	DECLARE @EDAD INT;
	SET @HOY = GETDATE();
	SET @EDAD = (DATEDIFF(DAY, @FECHA_NACIMIENTO, @HOY) / 365)

	IF @EDAD < 25
		SELECT @id_edad = id_edad FROM BOGO.BI_edad WHERE edad_inferior = 25
	ELSE IF @EDAD BETWEEN 25 AND 35
		SELECT @id_edad = id_edad FROM BOGO.BI_edad WHERE edad_superior = 35
	ELSE IF @EDAD BETWEEN 36 AND 50
		SELECT @id_edad = id_edad FROM BOGO.BI_edad WHERE edad_superior = 50
	ELSE
		SELECT @id_edad = id_edad FROM BOGO.BI_edad WHERE edad_inferior = 50

	RETURN @id_edad;
END
GO

CREATE FUNCTION BOGO.OBTENER_CUATRIMESTRE(@mes INT) RETURNS INT AS
BEGIN
	DECLARE @valor INT

	IF (@mes >= 1 and @mes <= 4) 
		SET @valor = 1 
	IF (@mes > 4 and @mes <= 8) 
		SET @valor = 2 
	IF (@mes > 8 and @mes <= 12) 
		SET @valor = 3

	RETURN @valor;
END
GO
-- Devuelve el ID para un año y mes específico
/*
CREATE FUNCTION BOGO.ID_TIEMPO(@fecha DATE) RETURNS DECIMAL(18) AS
BEGIN
	DECLARE @anio DECIMAL(4),
			@mes DECIMAL(2),
			@id_tiempo DECIMAL(18)

	SET @anio = DATEPART(YEAR, @fecha)
	SET @mes = DATEPART(MONTH, @fecha)

	SELECT @id_tiempo = id_tiempo FROM BOGO.BI_tiempo WHERE anio = @anio AND mes = @mes

	RETURN @id_tiempo
END
GO
*/


---------------------------------------------------------------------------------------------------
--                                            Parte 4                                            --
---------------------------------------------------------------------------------------------------

--  CREACION DE PROCEDURES 
CREATE PROCEDURE BOGO.BI_migrar_tiempo AS
BEGIN
    INSERT INTO BOGO.BI_tiempo (anio, cuatrimestre, mes) 
        SELECT DISTINCT YEAR(AN.fecha_publicacion) as "Anio", BOGO.OBTENER_CUATRIMESTRE(MONTH(AN.fecha_publicacion)) as "Cuatrimestre", MONTH(AN.fecha_publicacion) as "Mes" FROM BOGO.Anuncio AN
	UNION
		SELECT DISTINCT YEAR(AN.fecha_finalizacion) as "Anio", BOGO.OBTENER_CUATRIMESTRE(MONTH(AN.fecha_finalizacion)) as "Cuatrimestre", MONTH(AN.fecha_finalizacion) as "Mes" FROM BOGO.Anuncio AN
	UNION 
		SELECT DISTINCT YEAR(A.fecha_de_inicio) as "Anio", BOGO.OBTENER_CUATRIMESTRE(MONTH(A.fecha_de_inicio)) as "Cuatrimestre", MONTH(A.fecha_de_inicio) as "Mes" FROM BOGO.Alquiler A
	UNION
		SELECT DISTINCT YEAR(pg.fecha_de_pago) as "Anio", BOGO.OBTENER_CUATRIMESTRE(MONTH(pg.fecha_de_pago)) as "Cuatrimestre", MONTH(pg.fecha_de_pago) as "Mes" FROM BOGO.Pago_alquiler pg
	UNION
		SELECT DISTINCT YEAR(pg.fecha_de_vencimiento) as "Anio", BOGO.OBTENER_CUATRIMESTRE(MONTH(pg.fecha_de_vencimiento)) as "Cuatrimestre", MONTH(pg.fecha_de_vencimiento) as "Mes" FROM BOGO.Pago_alquiler pg
	UNION
		SELECT DISTINCT YEAR(v.fecha_de_venta) as "Anio", BOGO.OBTENER_CUATRIMESTRE(MONTH(v.fecha_de_venta)) as "Cuatrimestre", MONTH(v.fecha_de_venta) as "Mes" FROM BOGO.venta v
	ORDER BY anio ASC, cuatrimestre ASC, mes ASC
END
GO

CREATE PROCEDURE BOGO.BI_migrar_tipo_operacion AS
BEGIN
    INSERT INTO BOGO.BI_tipo_operacion (nombre)
        SELECT nombre FROM BOGO.tipo_operacion
END
GO

CREATE PROCEDURE BOGO.BI_migrar_tipo_inmueble AS
BEGIN
    INSERT INTO BOGO.BI_tipo_inmueble (nombre)
        SELECT nombre FROM BOGO.tipo_inmueble
END
GO

CREATE PROCEDURE BOGO.BI_migrar_moneda AS
BEGIN
    INSERT INTO BOGO.BI_moneda (descripcion)
        SELECT descripcion FROM BOGO.moneda
END
GO

CREATE PROCEDURE BOGO.BI_migrar_rangos_superficie AS
BEGIN 
	INSERT INTO BOGO.BI_rangos_superficie(limite_inferior,limite_superior,descipcion_rango) VALUES (0,35,'<35')
	INSERT INTO BOGO.BI_rangos_superficie(limite_inferior,limite_superior,descipcion_rango) VALUES (35,55,'35-55')
	INSERT INTO BOGO.BI_rangos_superficie(limite_inferior,limite_superior,descipcion_rango) VALUES (55,75,'55-75')
	INSERT INTO BOGO.BI_rangos_superficie(limite_inferior,limite_superior,descipcion_rango) VALUES (75,100,'75-100')
	INSERT INTO BOGO.BI_rangos_superficie(limite_inferior,limite_superior,descipcion_rango) VALUES (100,null,'>100')
END
GO

CREATE PROCEDURE BOGO.BI_migrar_ambientes AS
BEGIN
    INSERT INTO BOGO.BI_ambientes (cantidad)
        SELECT DISTINCT ambientes FROM BOGO.Inmueble
		ORDER BY ambientes ASC
END
GO

CREATE PROCEDURE BOGO.BI_migrar_ubicacion AS
BEGIN
    INSERT INTO BOGO.BI_ubicacion (codigo_provincia, codigo_localidad, codigo_barrio, nombre_provincia, nombre_localidad, nombre_barrio)
        SELECT DISTINCT p.codigo_provincia, l.codigo_localidad, b.codigo_barrio, p.nombre, l.nombre, b.nombre FROM BOGO.Provincia p
			INNER JOIN BOGO.localidad l on p.codigo_provincia = l.provincia
			INNER JOIN BOGO.barrio b on l.codigo_localidad = b.localidad
		ORDER BY p.codigo_provincia, l.codigo_localidad, b.codigo_barrio ASC
END
GO

CREATE PROCEDURE BOGO.BI_migrar_fecha_publicacion AS 
BEGIN 
	INSERT INTO BOGO.BI_Fecha_publicacion(fecha_publicacion) SELECT DISTINCT Cast(a.fecha_publicacion as date) AS "Anio" FROM Bogo.Anuncio a ORDER BY anio
END
GO 

CREATE PROCEDURE BOGO.BI_migrar_fecha_finalizacion AS 
BEGIN 
	INSERT INTO BOGO.BI_Fecha_finalizacion(fecha_finalizacion) SELECT DISTINCT Cast(a.fecha_finalizacion as date) AS "Anio" FROM Bogo.Anuncio a ORDER BY anio
END
GO

CREATE PROCEDURE BOGO.BI_migrar_anuncios AS
BEGIN
	INSERT INTO BOGO.BI_Anuncios(codigo_anuncio, codigo_tiempo, codigo_fecha_alta, codigo_fecha_baja, codigo_tipo_inmueble, codigo_moneda, codigo_ambientes, codigo_tipo_operacion, codigo_rango_superficie, duracion_promedio, codigo_ubicacion, precio_promedio) 
	SELECT  a.numero_anuncio,
			ti.codigo_tiempo,
			fecha_p.codigo,
			fecha_f.codigo,
			tipo_inmueble.codigo_tipo_inmueble,
			mon.codigo_moneda,
			amb.codigo_ambientes,
			tipo_operacion.codigo_tipo_operacion,
			ra_super.codigo_m2,
			DATEDIFF(DAY,a.fecha_publicacion,a.fecha_finalizacion),
			ubi.codigo_ubicacion,
			a.precio_inmueble
	FROM Bogo.Anuncio a
		INNER JOIN BOGO.BI_Tiempo ti ON ti.anio = Year(a.fecha_publicacion) and ti.cuatrimestre = BOGO.OBTENER_CUATRIMESTRE(MONTH(a.fecha_publicacion)) and ti.mes = MONTH(a.fecha_publicacion)
		INNER JOIN BOGO.BI_Fecha_publicacion fecha_p on fecha_p.fecha_publicacion = Cast(a.fecha_publicacion as Date)
		INNER JOIN BOGO.BI_Fecha_finalizacion fecha_f on fecha_f.fecha_finalizacion = Cast(a.fecha_finalizacion as DATE)
		INNER JOIN BOGO.BI_Moneda mon on a.moneda = mon.codigo_moneda
		INNER JOIN BOGO.Inmueble inm on a.inmueble = inm.numero_de_inmueble
		INNER JOIN BOGO.BI_Tipo_Inmueble tipo_inmueble on tipo_inmueble.codigo_tipo_inmueble = inm.tipo_inmueble
		INNER JOIN BOGO.Provincia prov on prov.codigo_provincia = inm.provincia
		INNER JOIN BOGO.Localidad loc on loc.codigo_localidad = inm.localidad
		INNER JOIN BOGO.Barrio barr on barr.codigo_barrio = inm.barrio
		INNER JOIN BOGO.BI_Ubicacion ubi on ubi.nombre_provincia = prov.nombre and ubi.nombre_localidad = loc.nombre and ubi.nombre_barrio = barr.nombre
		INNER JOIN BOGO.BI_Tipo_operacion tipo_operacion on tipo_operacion.codigo_tipo_operacion = a.tipo_operacion
		INNER JOIN BOGO.BI_rangos_superficie ra_super on ra_super.codigo_m2 = Bogo.Obtener_ID_Rango(inm.superficie)
		INNER JOIN BOGO.BI_Ambientes amb on amb.cantidad = inm.ambientes
END
GO

CREATE PROCEDURE BOGO.BI_migrar_barrios AS 
BEGIN 
	SET IDENTITY_INSERT Bogo.BI_Barrio ON
	INSERT INTO BOGO.BI_Barrio(cod_barrio,descripcion) SELECT barr.codigo_barrio, barr.nombre FROM BOGO.Barrio barr
	SET IDENTITY_INSERT Bogo.BI_Barrio OFF
END
GO

CREATE PROCEDURE BOGO.BI_migrar_localidad AS 
BEGIN 
	SET IDENTITY_INSERT Bogo.BI_Localidad ON
	INSERT INTO BOGO.BI_localidad(cod_localidad,descripcion) SELECT l.codigo_localidad, l.nombre FROM BOGO.localidad l
	SET IDENTITY_INSERT Bogo.BI_localidad OFF
END
GO

CREATE PROCEDURE BOGO.BI_migrar_Edad AS
BEGIN
	INSERT INTO BOGO.BI_Edad(edad_inferior, edad_superior, rango) VALUES (0, 25, '<25')
	INSERT INTO BOGO.BI_Edad(edad_inferior, edad_superior, rango) VALUES (25, 35, '25-35')
	INSERT INTO BOGO.BI_Edad(edad_inferior, edad_superior, rango) VALUES (35, 50, '35-50')
	INSERT INTO BOGO.BI_Edad(edad_inferior, edad_superior, rango) VALUES (50, null, '>50')
END
GO

CREATE PROCEDURE BOGO.BI_migrar_alquiler AS
BEGIN
	INSERT INTO BOGO.BI_Alquiler(codigo_alquiler, codigo_tiempo, codigo_edad, codigo_barrio, fecha_de_inicio, estado_alquiler)
	SELECT a.codigo_alquiler, ti.codigo_tiempo, e.id_edad, b.cod_barrio, CAST(a.fecha_de_inicio AS date), a.estado_alquiler
	FROM BOGO.Alquiler a
	INNER JOIN BOGO.BI_Tiempo ti ON ti.anio = Year(a.fecha_de_inicio) and ti.cuatrimestre = BOGO.OBTENER_CUATRIMESTRE(MONTH(a.fecha_de_inicio)) and ti.mes = MONTH(a.fecha_de_inicio)
	INNER JOIN BOGO.Inquilino i ON i.codigo_inquilino = a.inquilino
	INNER JOIN BOGO.BI_Edad e ON e.id_edad = BOGO.OBTENER_RANGO_EDAD(i.fecha_nacimiento)
	INNER JOIN BOGO.Anuncio an ON an.numero_anuncio = a.anuncio
	INNER JOIN BOGO.Inmueble inm ON inm.numero_de_inmueble = an.inmueble
	INNER JOIN BOGO.BI_Barrio b ON b.cod_barrio = inm.barrio
	INNER JOIN BOGO.BI_estado_Alquiler ea ON ea.estado_alquiler = a.estado_alquiler
END	
GO

CREATE PROCEDURE BOGO.BI_migrar_estado_alquiler AS 
BEGIN 
	INSERT INTO BOGO.BI_estado_alquiler (nombre)
	SELECT ea.descripcion
	FROM BOGO.estado_alquiler ea
END 
GO

CREATE PROCEDURE BOGO.BI_migrar_estado_inmueble AS 
BEGIN 
	SET IDENTITY_INSERT BOGO.BI_Estado_inmueble ON
	INSERT INTO BOGO.BI_estado_inmueble (estado_inmueble, nombre)
	SELECT ei.codigo_estado, ei.descripcion
	FROM BOGO.estado ei
	SET IDENTITY_INSERT BOGO.BI_Estado_inmueble OFF
END 
GO

CREATE PROCEDURE BOGO.BI_migrar_pago_alquiler AS
BEGIN
	INSERT INTO BOGO.BI_pago_alquiler (codigo_pago_alquiler, alquiler, fecha_de_pago, importe, fecha_de_vencimiento, pago_a_tiempo, codigo_tiempo, codigo_estado_alquiler)
	SELECT 
		pg.codigo_pago_alquiler, 
		a.codigo_alquiler, 
		CAST(pg.fecha_de_pago AS DATE) as "Fecha de pago", 
		pg.importe as "Importe", 
		CAST(pg.fecha_de_vencimiento AS DATE) AS "Fecha de vencimiento",
		CASE WHEN pg.fecha_de_pago <= pg.fecha_de_vencimiento THEN 1 ELSE 0 END AS "Pago a tiempo",
		ti.codigo_tiempo,
		ea.estado_alquiler 
	FROM BOGO.pago_alquiler pg
	INNER JOIN BOGO.Alquiler a ON a.codigo_alquiler = pg.alquiler
	INNER JOIN BOGO.BI_estado_Alquiler ea ON ea.estado_alquiler = a.estado_alquiler
	INNER JOIN BOGO.BI_Tiempo ti ON ti.anio = Year(pg.fecha_de_pago) and ti.cuatrimestre = BOGO.OBTENER_CUATRIMESTRE(MONTH(pg.fecha_de_pago)) and ti.mes = MONTH(pg.fecha_de_pago)
END
GO

CREATE PROCEDURE BOGO.BI_migrar_venta AS
BEGIN
	INSERT INTO BOGO.BI_venta (codigo_venta, codigo_tiempo, codigo_localidad, codigo_estado_inmueble, precio_venta, superficie_inmueble, precio_m2)
	SELECT	v.codigo_venta, 
			ti.codigo_tiempo, 
			l.cod_localidad, 
			ea.estado_inmueble, 
			v.precio_venta, 
			inm.superficie, 
			CAST((v.precio_venta / inm.superficie) AS DECIMAL(12,2)) AS "Precio por m2"
	FROM BOGO.venta v
	LEFT JOIN BOGO.Anuncio an ON an.numero_anuncio = v.anuncio
	LEFT JOIN BOGO.BI_Tiempo ti ON ti.anio = Year(v.fecha_de_venta) and ti.cuatrimestre = BOGO.OBTENER_CUATRIMESTRE(MONTH(v.fecha_de_venta)) and ti.mes = MONTH(v.fecha_de_venta)
	LEFT JOIN BOGO.Inmueble inm ON inm.numero_de_inmueble = an.inmueble
	LEFT JOIN BOGO.BI_Localidad l ON l.cod_localidad = inm.localidad
	LEFT JOIN BOGO.BI_estado_inmueble ea ON ea.estado_inmueble = inm.estado
END			
GO		

select * from bogo.BI_estado_inmueble
---------------------------------------------------------------------------------------------------
--                                            Parte 5                                            --
---------------------------------------------------------------------------------------------------

--  EJECUCIÓN DE LOS PROCEDURES PARA MIGRAR LOS DATOS
EXEC BOGO.BI_migrar_tiempo;
GO
EXEC BOGO.BI_migrar_tipo_operacion;
GO
EXEC BOGO.BI_migrar_tipo_inmueble;
GO
EXEC BOGO.BI_migrar_moneda;
GO
EXEC BOGO.BI_migrar_rangos_superficie;
GO
EXEC BOGO.BI_migrar_ambientes;
GO
EXEC BOGO.BI_migrar_ubicacion;
GO
EXEC BOGO.BI_migrar_fecha_publicacion;
GO
EXEC BOGO.BI_migrar_fecha_finalizacion;
GO
EXEC BOGO.BI_migrar_anuncios;
GO
EXEC BOGO.BI_migrar_barrios;
GO
EXEC BOGO.BI_migrar_Edad;
GO
EXEC BOGO.BI_migrar_estado_alquiler;
GO
EXEC BOGO.BI_migrar_pago_alquiler;
GO
EXEC BOGO.BI_migrar_alquiler;
GO
EXEC BOGO.BI_migrar_estado_inmueble;
GO
EXEC BOGO.BI_migrar_Localidad;
GO
EXEC BOGO.BI_migrar_venta;
GO

---------------------------------------------------------------------------------------------------
--                                            Parte 5                                            --
---------------------------------------------------------------------------------------------------

--  CREACIÓN DE LAS VISTAS
-- View 1 ok
CREATE VIEW BOGO.v_duracion_promedio_dias_anuncio AS
	SELECT  tipo_operacion.nombre as "Tipo operación",
			ubi.nombre_barrio as "Barrio",
			amb.cantidad as "Cantidad ambientes",
			tiempo.anio as "Año",
			tiempo.cuatrimestre as "N° cuatrimestre",
			CAST (SUM(an.duracion_promedio)/COUNT(an.codigo_anuncio) AS INT) AS "Duracion promedio en días"
	FROM Bogo.BI_Anuncios an
		INNER JOIN BOGO.BI_Tipo_operacion tipo_operacion ON tipo_operacion.codigo_tipo_operacion = an.codigo_tipo_operacion
		INNER JOIN BOGO.BI_Ubicacion ubi ON ubi.codigo_ubicacion = an.codigo_ubicacion
		INNER JOIN BOGO.BI_Ambientes amb ON amb.codigo_ambientes = an.codigo_ambientes
		INNER JOIN BOGO.BI_Tiempo tiempo ON tiempo.codigo_tiempo = an.codigo_tiempo
		INNER JOIN BOGO.BI_Fecha_publicacion fecha_p ON fecha_p.codigo = an.codigo_fecha_alta
		INNER JOIN BOGO.BI_Fecha_publicacion fecha_f ON fecha_f.codigo= an.codigo_fecha_baja
	GROUP BY tipo_operacion.nombre, ubi.nombre_barrio, amb.cantidad, tiempo.anio, tiempo.cuatrimestre
GO

-- View 2 ok
CREATE VIEW BOGO.v_promedio_precio_anuncio AS
	SELECT  tipo_operacion.nombre as "Tipo operación",
			tipo_inmueble.nombre as "Tipo inmueble",
			rs.descipcion_rango as "Rango superficie",
			tiempo.anio as "Año",
			tiempo.cuatrimestre as "N° cuatrimestre",
			m.descripcion as "Tipo de moneda",
			CAST (SUM(an.precio_promedio)/COUNT(an.codigo_anuncio) AS DECIMAL(10,2)) AS "Precio promedio"
	FROM Bogo.BI_Anuncios an
		INNER JOIN BOGO.BI_Tipo_operacion tipo_operacion ON tipo_operacion.codigo_tipo_operacion = an.codigo_tipo_operacion
		INNER JOIN BOGO.BI_Tipo_Inmueble tipo_inmueble ON tipo_inmueble.codigo_tipo_inmueble = an.codigo_tipo_inmueble
		INNER JOIN BOGO.BI_rangos_superficie rs ON rs.codigo_m2 = an.codigo_rango_superficie
		INNER JOIN BOGO.BI_Tiempo tiempo ON tiempo.codigo_tiempo = an.codigo_tiempo
		INNER JOIN BOGO.BI_Fecha_publicacion fecha_p ON fecha_p.codigo = an.codigo_fecha_alta
		INNER JOIN BOGO.BI_Fecha_publicacion fecha_f ON fecha_f.codigo = an.codigo_fecha_baja
		INNER JOIN BOGO.BI_Moneda m ON m.codigo_moneda = an.codigo_moneda
	GROUP BY tipo_operacion.nombre, tipo_inmueble.nombre, rs.descipcion_rango, tiempo.anio, tiempo.cuatrimestre, m.descripcion
GO

-- View 3 ok
CREATE VIEW BOGO.v_5_barrios_mas_elegidos_rango_etario AS
	SELECT barrios.anio AS "Año", barrios.cuatrimestre AS "Cuatrimestre", barrios.rango AS "Rango", barrios.descripcion AS "Descripción"
	FROM (SELECT temp.anio, temp.cuatrimestre, ed.rango, barr.descripcion,
	ROW_NUMBER() OVER (PARTITION BY temp.anio,temp.cuatrimestre,ed.rango ORDER BY COUNT(alq.codigo_alquiler) DESC) AS Ranking
	FROM Bogo.BI_Alquiler alq
	INNER JOIN BOGO.BI_Tiempo temp ON alq.codigo_tiempo = temp.codigo_tiempo
	INNER JOIN BOGO.BI_Edad ed ON alq.codigo_edad = ed.id_edad
	INNER JOIN BOGO.BI_Barrio barr ON barr.cod_barrio = alq.codigo_barrio
	GROUP BY temp.anio,temp.cuatrimestre,ed.rango,barr.descripcion
	) AS barrios 
	WHERE Ranking <= 5
GO 

-- View 4 ok
CREATE VIEW BOGO.v_porcentaje_incumplimiento_de_pagos AS
	SELECT	t.anio AS "Año", 
			t.mes AS "Mes", 
			CONCAT(
			(SELECT COUNT(*) FROM BOGO.BI_pago_alquiler pa 
							 INNER JOIN BOGO.BI_tiempo ti on ti.codigo_tiempo = pa.codigo_tiempo
							 WHERE ti.anio = t.anio  and ti.mes = t.mes and pa.pago_a_tiempo = 0) * 100 / COUNT(*), '%')
			AS "Porcentaje de incumplimiento de pago"
	FROM BOGO.BI_pago_alquiler pg
	INNER JOIN BOGO.BI_Tiempo t ON t.codigo_tiempo = pg.codigo_tiempo
	GROUP BY t.anio, t.mes
GO

-- vista 5
CREATE VIEW BOGO.v_promedio_de_incremento_del_valor_de_los_alquileres AS
    SELECT DISTINCT MONTH(palq.fecha_de_pago) AS "Mes", YEAR(palq.fecha_de_pago) AS "Año",
    AVG(((palq.importe - anterior.importe)/anterior.importe)*100) AS "Promedio de incremento del importe"
    FROM BOGO.BI_pago_alquiler palq
    LEFT JOIN BOGO.BI_pago_alquiler anterior ON MONTH(anterior.fecha_de_pago) = MONTH(palq.fecha_de_pago) - 1
    INNER JOIN BOGO.BI_Alquiler alq ON alq.codigo_alquiler = palq.alquiler AND MONTH(alq.fecha_de_inicio) <= MONTH(anterior.fecha_de_pago)
    INNER JOIN BOGO.BI_estado_Alquiler ealq ON ealq.estado_alquiler = alq.estado_alquiler
    WHERE palq.importe > anterior.importe AND ealq.estado_alquiler = 3 -- 'Activo'
    GROUP BY MONTH(palq.fecha_de_pago), YEAR(palq.fecha_de_pago)
GO

-- View 6 ok
CREATE VIEW BOGO.v_precio_promedio_m2_ventas AS
	SELECT t.cuatrimestre, t.anio, l.descripcion, ti.nombre, AVG(v.precio_m2) AS "Precio promedio m2"
	FROM BOGO.BI_Venta v
	INNER JOIN BOGO.BI_Tiempo t ON t.codigo_tiempo = v.codigo_tiempo
	INNER JOIN BOGO.BI_Tipo_Inmueble ti ON ti.codigo_tipo_inmueble = v.codigo_estado_inmueble
	INNER JOIN BOGO.BI_Localidad  l On l.cod_localidad = v.codigo_localidad
	GROUP BY t.cuatrimestre, t.anio, l.descripcion, ti.nombre
GO

/*
7. Valor promedio de la comisión según el tipo de operación (alquiler, venta, etc) y sucursal para cada cuatrimestre/año. Se calcula en función de los alquileres y
ventas concretadas dentro del periodo.
*/


/*
8. Porcentaje de operaciones concretadas (tanto de alquileres como ventas) por cada sucursal, según el rango etario de los empleados por año en función de la
cantidad de anuncios publicados en ese mismo año.CREATE VIEW BOGO.v_porcentaje_operaciones_concretadas AS	SELECT 	FROM BOGO.BI_inmuebles i	INNER JOIN 	GRUOP BY*/
/*
CREATE VIEW ABC.v_porcentaje_de_envios_realizados_a_cada_provincia AS
	SELECT t.anio AS Anio, t.mes AS Mes, p.nombre AS Provincia, 100 * SUM(e.cantidad) / (SELECT SUM(e1.cantidad) FROM ABC.BI_envios e1 WHERE e.id_tiempo=e1.id_tiempo GROUP BY e1.id_tiempo) AS Porcentaje
		FROM ABC.BI_envios e INNER JOIN ABC.BI_tiempo t ON e.id_tiempo = t.id_tiempo
								  INNER JOIN ABC.BI_provincia p ON e.id_provincia = p.provincia_id
		GROUP BY t.anio, t.mes, p.nombre, e.id_tiempo
GO
*/

/*
9. Monto total de cierre de contratos por tipo de operación (tanto de alquileres como ventas) por cada cuatrimestre y sucursal, diferenciando el tipo de moneda.
*/

select * from BOGO.v_porcentaje_incumplimiento_de_pagos
