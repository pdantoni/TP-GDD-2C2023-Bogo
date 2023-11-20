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

CREATE TABLE BOGO.BI_Edad(
	id_edad DECIMAL(18) PRIMARY KEY IDENTITY(1,1),
	rango NVARCHAR(50) NOT NULL,
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

---------------------------------------------------------------------------------------------------
--                                            Parte 3                                            --
---------------------------------------------------------------------------------------------------

--  CREACION DE FUNCIONES 

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
        SELECT DISTINCT YEAR(AN.fecha_publicacion), DATEPART(QUARTER, AN.fecha_publicacion), MONTH(AN.fecha_publicacion) FROM BOGO.Anuncio AN
	UNION
		SELECT DISTINCT YEAR(AN.fecha_finalizacion), DATEPART(QUARTER, AN.fecha_finalizacion), MONTH(AN.fecha_finalizacion) FROM BOGO.Anuncio AN
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
EXEC BOGO.bi_migrar_ambientes;
GO
EXEC BOGO.bi_migrar_moneda;
GO
EXEC BOGO.bi_migrar_rangom2;
GO
EXEC BOGO.bi_migrar_tiempo;
GO
EXEC BOGO.bi_migrar_tipo_inmueble;
GO
EXEC BOGO.bi_migrar_tipo_operacion;
GO
EXEC BOGO.bi_migrar_ubicacion;
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
	SELECT Ti.nombre, U.nombre_barrio, A.cantidad, T.anio, T.cuatrimestre, AVG(DATEDIFF(DAY, AN.fecha_finalizacion, AN.fecha_publicacion)) FROM BOGO.Anuncio AN
		INNER JOIN BOGO.BI_tipo_operacion Ti on AN.tipo_operacion = Ti.codigo_tipo_operacion
		INNER JOIN BOGO.Inmueble I on AN.inmueble = I.numero_de_inmueble
		INNER JOIN BOGO.BI_Ubicacion U on I.barrio = u.codigo_barrio
		INNER JOIN BOGO.BI_Tiempo T on YEAR(AN.fecha_publicacion) = t.anio
		INNER JOIN BOGO.BI_Ambientes A on I.ambientes = A.cantidad
	GROUP BY Ti.nombre, U.nombre_barrio, A.cantidad, T.anio, T.cuatrimestre
GO



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