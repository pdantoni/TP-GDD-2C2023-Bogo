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
IF OBJECT_ID('BOGO.BI_Rangom2', 'U') IS NOT NULL DROP TABLE BOGO.BI_Rangom2
IF OBJECT_ID('BOGO.BI_Ambientes', 'U') IS NOT NULL DROP TABLE BOGO.BI_Ambientes
IF OBJECT_ID('BOGO.BI_Ubicacion', 'U') IS NOT NULL DROP TABLE BOGO.BI_Ubicacion
IF OBJECT_ID('BOGO.BI_Anuncios', 'U') IS NOT NULL DROP TABLE BOGO.BI_Anuncios
IF OBJECT_ID('BOGO.BI_Edad', 'U') IS NOT NULL DROP TABLE BOGO.BI_Edad
IF OBJECT_ID('BOGO.BI_Fecha_publicacion', 'U') IS NOT NULL DROP TABLE BOGO.BI_Fecha_publicacion
IF OBJECT_ID('BOGO.BI_Fecha_finalizacion', 'U') IS NOT NULL DROP TABLE BOGO.BI_Fecha_finalizacion

-- BORRADO DE FUNCIONES
IF OBJECT_ID('BOGO.OBTENER_ID_RANGO') IS NOT NULL DROP FUNCTION BOGO.OBTENER_ID_RANGO

-- BORRADO DE PROCEDURES
IF OBJECT_ID('BOGO.bi_cargar_edad') IS NOT NULL DROP PROCEDURE BOGO.bi_cargar_edad
IF OBJECT_ID('BOGO.bi_migrar_tiempo') IS NOT NULL DROP PROCEDURE BOGO.bi_migrar_tiempo
IF OBJECT_ID('BOGO.bi_migrar_tipo_operacion') IS NOT NULL DROP PROCEDURE BOGO.bi_migrar_tipo_operacion
IF OBJECT_ID('BOGO.bi_migrar_tipo_inmueble') IS NOT NULL DROP PROCEDURE BOGO.bi_migrar_tipo_inmueble
IF OBJECT_ID('BOGO.bi_migrar_moneda') IS NOT NULL DROP PROCEDURE BOGO.bi_migrar_moneda
IF OBJECT_ID('BOGO.bi_migrar_rangom2') IS NOT NULL DROP PROCEDURE BOGO.bi_migrar_rangom2
IF OBJECT_ID('BOGO.bi_migrar_ambientes') IS NOT NULL DROP PROCEDURE BOGO.bi_migrar_ambientes
IF OBJECT_ID('BOGO.bi_migrar_ubicacion') IS NOT NULL DROP PROCEDURE BOGO.bi_migrar_ubicacion
IF OBJECT_ID('BOGO.bi_migrar_barrios') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_barrios
IF OBJECT_ID('BOGO.bi_migrar_fecha_publicacion') IS NOT NULL DROP PROCEDURE BOGO.bi_migrar_fecha_publicacion
IF OBJECT_ID('BOGO.bi_migrar_fecha_finalizacion') IS NOT NULL DROP PROCEDURE BOGO.bi_migrar_fecha_finalizacion
IF OBJECT_ID('BOGO.bi_migrar_anuncios') IS NOT NULL DROP PROCEDURE BOGO.bi_migrar_anuncios


---------------------------------------------------------------------------------------------------
--                                            Parte 2                                            --
---------------------------------------------------------------------------------------------------

-- CREACION DE TABLAS
CREATE TABLE BOGO.BI_Tipo_Inmueble
( 
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

CREATE TABLE BOGO.BI_Rangom2(
	codigo_m2 INT PRIMARY KEY IDENTITY(1,1),
	rango VARCHAR(150)
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

CREATE TABLE BOGO.BI_Anuncios(
	codigo_tiempo INT,
	codigo_tipo_operacion INT,
	codigo_tipo_inmueble INT,
	codigo_moneda INT,
	codigo_m2 INT, 
	codigo_ambientes INT, 
	codigo_ubicacion INT, 
	duracion_promedio DECIMAL(12,2), 
	precio_promedio DECIMAL(12,2),
	codigo_anuncio INT,
	PRIMARY KEY (codigo_tiempo, codigo_tipo_operacion, codigo_tipo_inmueble, codigo_moneda, codigo_m2, codigo_ambientes, codigo_ubicacion)
)
-- VER OTRA TABLA DE ANUNCIOS, QUÉ DIFERENCIAS
/*
Create TABLE BOGO.BI_Anuncios(
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
	duracion_promedio DECIMAL(12,2), 
	precio_promedio DECIMAL(12,2),
	PRIMARY KEY (codigo_anuncio, codigo_fecha_alta, codigo_fecha_baja,  codigo_tiempo, codigo_tipo_operacion, codigo_tipo_inmueble, codigo_moneda, codigo_rango_superficie, codigo_ambientes, codigo_ubicacion)
)
*/

CREATE TABLE BOGO.BI_Edad(
	id_edad DECIMAL(18) PRIMARY KEY IDENTITY(1,1),
	rango NVARCHAR(50) NOT NULL,
)

CREATE TABLE BOGO.BI_Fecha_publicacion(
	codigo INT PRIMARY KEY IDENTITY(1,1),
	fecha_publicacion DATE
)

CREATE TABLE BOGO.BI_Fecha_finalizacion(
	codigo INT PRIMARY KEY IDENTITY(1,1),
	fecha_finalizacion DATE
)

-- CREACION DE PKs COMPUESTAS
ALTER TABLE BOGO.BI_Ubicacion
	ADD	FOREIGN KEY (codigo_provincia) REFERENCES BOGO.provincia(codigo_provincia), 
		FOREIGN KEY (codigo_localidad) REFERENCES BOGO.localidad(codigo_localidad),
		FOREIGN KEY (codigo_barrio) REFERENCES BOGO.barrio(codigo_barrio)
GO 

ALTER TABLE BOGO.BI_Anuncios
	ADD FOREIGN KEY (codigo_tiempo) REFERENCES BOGO.BI_tiempo(codigo_tiempo),
		FOREIGN KEY (codigo_tipo_operacion) REFERENCES BOGO.tipo_operacion(codigo_tipo_operacion),
		FOREIGN KEY (codigo_tipo_inmueble) REFERENCES BOGO.tipo_inmueble(codigo_tipo_inmueble),
		FOREIGN KEY (codigo_moneda) REFERENCES BOGO.BI_moneda(codigo_moneda),
		FOREIGN KEY (codigo_m2) REFERENCES BOGO.BI_Rangom2(codigo_m2),
		FOREIGN KEY (codigo_ambientes) REFERENCES BOGO.BI_Ambientes(codigo_ambientes),
		FOREIGN KEY (codigo_ubicacion) REFERENCES BOGO.BI_ubicacion(codigo_ubicacion),
		FOREIGN KEY (codigo_anuncio) REFERENCES BOGO.Anuncio(numero_anuncio)
GO

-- VER OTRA TABLA DE ANUNCIOS, QUÉ DIFERENCIAS
/*
ALTER TABLE BOGO.BI_Anuncios
	ADD FOREIGN KEY (codigo_tiempo) REFERENCES BOGO.BI_Tiempo(codigo),
		FOREIGN KEY (codigo_tipo_operacion) REFERENCES BOGO.Tipo_operacion(codigo_tipo_operacion),
		FOREIGN KEY (codigo_tipo_inmueble) REFERENCES BOGO.Tipo_Inmueble(codigo_tipo_inmueble),
		FOREIGN KEY (codigo_moneda) REFERENCES BOGO.BI_Moneda(codigo_moneda),
		FOREIGN KEY (codigo_rango_superficie) REFERENCES BOGO.BI_rangos_superficie(codigo_m2),
		FOREIGN KEY (codigo_ambientes) REFERENCES BOGO.BI_Ambientes(codigo_ambientes),
		FOREIGN KEY (codigo_ubicacion) REFERENCES BOGO.BI_Ubicacion(codigo_ubicacion),
		FOREIGN KEY (codigo_fecha_alta) REFERENCES BOGO.BI_Fecha_publicacion(codigo),
		FOREIGN KEY (codigo_fecha_baja) REFERENCES BOGO.BI_Fecha_finalizacion(codigo)
GO
*/
---------------------------------------------------------------------------------------------------
--                                            Parte 3                                            --
---------------------------------------------------------------------------------------------------

--  CREACION DE FUNCIONES 
CREATE FUNCTION BOGO.OBTENER_ID_RANGO(@rango FLOAT) RETURNS INT
AS
BEGIN
	DECLARE @id INT
		IF(@rango < 35) SET @id = 6
		IF(@rango >= 35 and @rango < 55) SET @id = 7
		IF(@rango >= 55 and @rango < 75) SET @id = 8
		IF(@rango >= 75 and @rango < 100) SET @id = 9
		IF(@rango >= 100) SET @id = 10
	RETURN @id
END

-- Devuelve el ID para un año y mes específico
/*
CREATE FUNCTION BOGO.ID_TIEMPO(@fecha DATE) RETURNS DECIMAL(18) AS
BEGIN
	DECLARE @anio DECIMAL(4),
			@mes DECIMAL(2),
			@id_tiempo DECIMAL(18)

	SET @anio = DATEPART(YEAR, @fecha)
	SET @mes = DATEPART(MONTH, @fecha)

	SELECT @id_tiempo = id_tiempo FROM BOGO.bi_tiempo WHERE anio = @anio AND mes = @mes

	RETURN @id_tiempo
END
GO
*/

-- Devuelve el rango de edad según fecha de nacimiento.
/*
CREATE FUNCTION BOGO.RANGO_EDAD(@FECHA_NACIMIENTO DATE) RETURNS DECIMAL(18) AS
BEGIN
	DECLARE @id_edad DECIMAL(18);
	DECLARE @HOY DATE;
	DECLARE @EDAD INT;
	SET @HOY = GETDATE();
	SET @EDAD = (DATEDIFF(DAY, @FECHA_NACIMIENTO, @HOY) / 365)

	IF @EDAD < 25
		SELECT @id_edad = id_edad FROM BOGO.bi_edad WHERE rango = '< 25 años'
	ELSE IF @EDAD BETWEEN 25 AND 35
		SELECT @id_edad = id_edad FROM BOGO.bi_edad WHERE rango = '25 - 35 años'
	ELSE IF @EDAD BETWEEN 36 AND 50
		SELECT @id_edad = id_edad FROM BOGO.bi_edad WHERE rango = '35 - 50 años'
	ELSE
		SELECT @id_edad = id_edad FROM BOGO.bi_edad WHERE rango = '> 50 años'


	RETURN @id_edad;

END
GO
*/
---------------------------------------------------------------------------------------------------
--                                            Parte 4                                            --
---------------------------------------------------------------------------------------------------

--  CREACION DE PROCEDURES 
CREATE PROCEDURE BOGO.bi_cargar_edad AS
BEGIN
	INSERT INTO BOGO.bi_edad (rango)
		VALUES 	('< 25 años'),
				('25 - 35 años'),
				('35 - 50 años'),
				('> 50 años')
END
GO

CREATE PROCEDURE BOGO.bi_migrar_tiempo AS
BEGIN
    INSERT INTO BOGO.BI_tiempo (anio, cuatrimestre, mes) 
        SELECT DISTINCT YEAR(AN.fecha_publicacion) as "Anio", DATEPART(QUARTER, AN.fecha_publicacion) as "Cuatrimestre", MONTH(AN.fecha_publicacion) as "Mes" FROM BOGO.Anuncio AN
	UNION
		SELECT DISTINCT YEAR(AN.fecha_finalizacion) as "Anio", DATEPART(QUARTER, AN.fecha_finalizacion) as "Cuatrimestre", MONTH(AN.fecha_finalizacion) as "Mes" FROM BOGO.Anuncio AN
	ORDER BY anio ASC, cuatrimestre ASC, mes ASC
END
GO

CREATE PROCEDURE BOGO.bi_migrar_tipo_operacion AS
BEGIN
    INSERT INTO BOGO.BI_tipo_operacion (nombre)
        SELECT nombre FROM BOGO.tipo_operacion
END
GO

CREATE PROCEDURE BOGO.bi_migrar_tipo_inmueble AS
BEGIN
    INSERT INTO BOGO.BI_tipo_inmueble (nombre)
        SELECT nombre FROM BOGO.tipo_inmueble
END
GO

CREATE PROCEDURE BOGO.bi_migrar_moneda AS
BEGIN
    INSERT INTO BOGO.BI_moneda (descripcion)
        SELECT descripcion FROM BOGO.moneda
END
GO

CREATE PROCEDURE BOGO.bi_migrar_rangom2 AS
BEGIN
    INSERT INTO BOGO.BI_rangom2 (rango)
        VALUES ('<35 m2'), ('35-55 m2'), ('55-75 m2'), ('75-100 m2'), ('>100 m2')
END
GO

-- VER cuál es la diferencia con bi_migrar_rangom2 y este procedure
/*
CREATE PROCEDURE BOGO.BI_migrar_rangos_superficie AS
BEGIN 
INSERT INTO BOGO.BI_rangos_superficie(limite_inferior,limite_superior,descipcion_rango) VALUES (0,35,'<35')
INSERT INTO BOGO.BI_rangos_superficie (limite_inferior,limite_superior,descipcion_rango) VALUES (35,55,'35-55')
INSERT INTO BOGO.BI_rangos_superficie (limite_inferior,limite_superior,descipcion_rango) VALUES (55,75,'55-75')
INSERT INTO BOGO.BI_rangos_superficie(limite_inferior,limite_superior,descipcion_rango) VALUES (75,100,'75-100')
INSERT INTO BOGO.BI_rangos_superficie (limite_inferior,limite_superior,descipcion_rango) VALUES (100,null,'>100')
END
*/

CREATE PROCEDURE BOGO.bi_migrar_ambientes AS
BEGIN
    INSERT INTO BOGO.BI_ambientes (cantidad)
        SELECT DISTINCT ambientes FROM BOGO.Inmueble
		ORDER BY ambientes ASC
END
GO

CREATE PROCEDURE BOGO.bi_migrar_ubicacion AS
BEGIN
    INSERT INTO BOGO.BI_ubicacion (codigo_provincia, codigo_localidad, codigo_barrio, nombre_provincia, nombre_localidad, nombre_barrio)
        SELECT DISTINCT p.codigo_provincia, l.codigo_localidad, b.codigo_barrio, p.nombre, l.nombre, b.nombre FROM BOGO.Provincia p
			INNER JOIN BOGO.localidad l on p.codigo_provincia = l.provincia
			INNER JOIN BOGO.barrio b on l.codigo_localidad = b.localidad
		ORDER BY p.codigo_provincia, l.codigo_localidad, b.codigo_barrio ASC
END
GO


CREATE PROCEDURE BOGO.bi_migrar_barrios AS 
BEGIN 
	SET IDENTITY INSERT BOGO.bi_barrio ON 
		INSERT INTO Bogo.bi_Barrio(cod_barrio,descripcion) SELECT barr.codigo_barrio,barr.nombre FROM BOGO.Barrio barr
	SET IDENTITY INSERT Bogo.bi_Barrio OFF
END

CREATE PROCEDURE BOGO.bi_migrar_fecha_publicacion AS 
BEGIN 
	INSERT INTO BOGO.BI_Fecha_publicacion(fecha_publicacion) SELECT DISTINCT Cast(a.fecha_publicacion as date) AS "Anio" FROM Bogo.Anuncio a ORDER BY anio
END

CREATE PROCEDURE BOGO.bi_migrar_fecha_finalizacion AS 
BEGIN 
	INSERT INTO BOGO.BI_Fecha_finalizacion(fecha_finalizacion) SELECT DISTINCT Cast(a.fecha_finalizacion as date) AS "Anio" FROM Bogo.Anuncio a ORDER BY anio
END


CREATE PROCEDURE BOGO.bi_migrar_anuncios AS
BEGIN
	INSERT INTO BOGO.BI_Anuncios(codigo_anuncio, codigo_tiempo, codigo_fecha_alta, codigo_fecha_baja, codigo_tipo_inmueble, codigo_moneda, codigo_ambientes, codigo_tipo_operacion, codigo_rango_superficie, duracion_promedio, codigo_ubicacion, precio_promedio) 
	SELECT  a.numero_anuncio,
			ti.codigo,
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
		INNER JOIN BOGO.BI_Tiempo ti ON ti.anio = Year(a.fecha_publicacion) and ti.cuatrimestre = DATEPART(QUARTER,a.fecha_publicacion) and ti.mes = MONTH(a.fecha_publicacion)
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
	SELECT * FROM Bogo.BI_Anuncios
END
 




/*
CREATE PROCEDURE BOGO.bi_migrar_anuncios AS
BEGIN
    INSERT INTO BOGO.BI_ubicacion (codigo_tiempo, codigo_tipo_operacion, codigo_tipo_inmueble, codigo_moneda, codigo_m2, codigo_ambientes, codigo_ubicacion, duracion_promedio, precio_promedio)
        SELECT DISTINCT p.codigo_provincia, l.codigo_localidad, b.codigo_barrio, p.nombre, l.nombre, b.nombre FROM BOGO.Provincia p
			INNER JOIN BOGO.localidad l on p.codigo_provincia = l.provincia
			INNER JOIN BOGO.barrio b on l.codigo_localidad = b.localidad
		ORDER BY p.codigo_provincia, l.codigo_localidad, b.codigo_barrio ASC
END
GO
*/

---------------------------------------------------------------------------------------------------
--                                            Parte 5                                            --
---------------------------------------------------------------------------------------------------

--  EJECUCIÓN DE LOS PROCEDURES PARA MIGRAR LOS DATOS
EXEC BOGO.bi_cargar_edad;
GO
EXEC BOGO.bi_migrar_tiempo;
GO
EXEC BOGO.bi_migrar_tipo_operacion;
GO
EXEC BOGO.bi_migrar_tipo_inmueble;
GO
EXEC BOGO.bi_migrar_moneda;
GO
EXEC BOGO.bi_migrar_rangom2;
GO
EXEC BOGO.bi_migrar_ambientes;
GO
EXEC BOGO.bi_migrar_ubicacion;
GO
EXEC BOGO.bi_migrar_barrios;
GO
EXEC BOGO.bi_migrar_fecha_publicacion;
GO
EXEC BOGO.bi_migrar_fecha_finalizacion;
GO
EXEC BOGO.bi_migrar_anuncios;
GO


---------------------------------------------------------------------------------------------------
--                                            Parte 5                                            --
---------------------------------------------------------------------------------------------------

--  CREACIÓN DE LAS VISTAS
-- Promedio de tiempo en stock de cáda modelo de automovil

/*
Duración promedio (en días) que se encuentran publicados los anuncios según el tipo de operación (alquiler, venta, etc), barrio y ambientes para cada
cuatrimestre de cada año. Se consideran todos los anuncios que se dieron de alta en ese cuatrimestre. La duración se calcula teniendo en cuenta la fecha de alta y
la fecha de finalización.
*/
CREATE VIEW BOGO.v_tiempo_promedio_anuncio AS
	SELECT DISTINCT Ti.nombre AS "Nombre de tipo Operacion", 
					U.nombre_barrio AS "Nombre de barrio", 
					A.cantidad AS "Cantidad de ambientes", 
					YEAR(a.fecha_publicacion) AS "Anio", 
					DATEPART(QUARTER, AN.fecha_publicacion) AS "Cuatrimestre", 
					AVG(DATEDIFF(DAY, AN.fecha_finalizacion, AN.fecha_publicacion)) AS "Duracion promedio en dias" 
	FROM BOGO.Anuncio AN
		INNER JOIN BOGO.BI_tipo_operacion Ti ON AN.tipo_operacion = Ti.codigo_tipo_operacion
		INNER JOIN BOGO.Inmueble I ON AN.inmueble = I.numero_de_inmueble
		INNER JOIN BOGO.BI_Ambientes A ON I.ambientes = A.cantidad
		INNER JOIN BOGO.BI_Ubicacion U ON I.barrio = U.codigo_barrio
		--INNER JOIN BOGO.BI_Tiempo T on YEAR(AN.fecha_publicacion) = t.anio
		
	GROUP BY Ti.nombre, U.nombre_barrio, A.cantidad, YEAR(AN.fecha_publicacion),DATEPART(QUARTER, AN.fecha_publicacion)
GO


-- VER CUÁL DE LAS DOS QUEDA
CREATE VIEW duracion_promedio_dias_anuncio AS
	SELECT  tipo_operacion.nombre,
			ubi.nombre_barrio,
			amb.cantidad,
			tiempo.anio,
			tiempo.cuatrimestre,
			SUM(an.duracion_promedio)/COUNT(an.codigo_anuncio) AS "Duracion Promedio en Dias"
	FROM Bogo.BI_Anuncios an
		INNER JOIN BOGO.BI_Tipo_operacion tipo_operacion ON tipo_operacion.codigo_tipo_operacion = an.codigo_tipo_operacion
		INNER JOIN BOGO.BI_Ubicacion ubi ON ubi.codigo_ubicacion = an.codigo_ubicacion
		INNER JOIN BOGO.BI_Ambientes amb ON amb.codigo_ambientes = an.codigo_ambientes
		INNER JOIN BOGO.BI_Tiempo tiempo ON tiempo.codigo = an.codigo_tiempo
		INNER JOIN BOGO.BI_Fecha_publicacion fecha_p ON fecha_p.codigo = an.codigo_fecha_alta
		INNER JOIN BOGO.BI_Fecha_publicacion fecha_f ON fecha_f.codigo= an.codigo_fecha_baja
	GROUP BY tipo_operacion.nombre, ubi.nombre_barrio, amb.cantidad, tiempo.anio, tiempo.cuatrimestre
END

/*
Precio promedio de los anuncios de inmuebles según el tipo de operación
(alquiler, venta, etc), tipo de inmueble y rango m2 para cada cuatrimestre/año.
Se consideran todos los anuncios que se dieron de alta en ese cuatrimestre. El
precio se debe expresar en el tipo de moneda que corresponda, identificando de
cuál se trata.
*/
-- Precio promedio de cada autoparte, vendida y comprada
CREATE VIEW BOGO.v_precio_promedio_anuncios AS
	SELECT al.codigo_anuncio, al.precio_promedio_anuncio, ve.precio_promedio_venta
	FROM (
			SELECT an.codigo_anuncio, CONVERT(DECIMAL(18,2), COALESCE(SUM(an. ) / SUM(ca.cantidad_comprada), 0)) as precio_promedio_anuncio
				FROM BOGO.bi_anuncios an
			GROUP BY an.codigo_anuncio
		) al
	JOIN
		(
			SELECT va.codigo_autoparte, CONVERT(DECIMAL(18,2), COALESCE(SUM(va.total_vendido) / SUM(va.cantidad_vendida), 0)) as precio_promedio_venta
			FROM BOGO.bi_venta_autopartes va
			GROUP BY va.codigo_autoparte
		) ve ON p.codigo_autoparte = ve.codigo_autoparte
GO


/* 3. Los 5 barrios más elegidos para alquilar en función del rango etario de los inquilinos para cada cuatrimestre/año. Se calcula en función de los alquileres
dados de alta en dicho periodo.

CREATE VIEW BOGO.v_barrios_por_rango_etario AS
	SELECT t.anio AS Anio, t.mes AS Mes, e.rango AS Rango_Etario, cp.categoria AS Barrio
		FROM BOGO.bi_alquiler v INNER JOIN BOGO.bi_barrio cp ON v.id_barrio = cp.categoria_id
											INNER JOIN BOGO.bi_edad e ON v.id_edad = e.id_edad
											INNER JOIN BOGO.bi_tiempo t ON v.id_tiempo = t.id_tiempo
		WHERE v.id_barrio IN (SELECT TOP 5 v1.id_barrio
											 FROM BOGO.bi_alquiler v1
											 WHERE v1.id_edad = v.id_edad AND v1.id_tiempo = v.id_tiempo
											 GROUP BY v1.id_barrio
											 ORDER BY SUM(v1.cantidad) DESC)
		GROUP BY t.anio, t.mes, e.rango, cp.categoria 
GO
*/