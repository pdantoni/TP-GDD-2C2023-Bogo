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
-- IF OBJECT_ID('BOGO.BI_estado_Alquiler', 'U') IS NOT NULL DROP TABLE BOGO.BI_estado_Alquiler
-- IF OBJECT_ID('BOGO.BI_pago_alquiler', 'U') IS NOT NULL DROP TABLE BOGO.BI_pago_alquiler
-- IF OBJECT_ID('BOGO.BI_venta', 'U') IS NOT NULL DROP TABLE BOGO.BI_venta

-- BORRADO DE FUNCIONES
IF OBJECT_ID('BOGO.OBTENER_ID_RANGO') IS NOT NULL DROP FUNCTION BOGO.OBTENER_ID_RANGO
IF OBJECT_ID('BOGO.OBTENER_RANGO_EDAD') IS NOT NULL DROP FUNCTION BOGO.OBTENER_RANGO_EDAD

-- BORRADO DE PROCEDURES
IF OBJECT_ID('BOGO.bi_cargar_edad') IS NOT NULL DROP PROCEDURE BOGO.bi_cargar_edad
IF OBJECT_ID('BOGO.bi_migrar_tiempo') IS NOT NULL DROP PROCEDURE BOGO.bi_migrar_tiempo
IF OBJECT_ID('BOGO.bi_migrar_tipo_operacion') IS NOT NULL DROP PROCEDURE BOGO.bi_migrar_tipo_operacion
IF OBJECT_ID('BOGO.bi_migrar_tipo_inmueble') IS NOT NULL DROP PROCEDURE BOGO.bi_migrar_tipo_inmueble
IF OBJECT_ID('BOGO.bi_migrar_moneda') IS NOT NULL DROP PROCEDURE BOGO.bi_migrar_moneda
IF OBJECT_ID('BOGO.BI_migrar_rangos_superficie') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_rangos_superficie
IF OBJECT_ID('BOGO.bi_migrar_ambientes') IS NOT NULL DROP PROCEDURE BOGO.bi_migrar_ambientes
IF OBJECT_ID('BOGO.bi_migrar_ubicacion') IS NOT NULL DROP PROCEDURE BOGO.bi_migrar_ubicacion
IF OBJECT_ID('BOGO.bi_migrar_barrios') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_barrios
IF OBJECT_ID('BOGO.bi_migrar_fecha_publicacion') IS NOT NULL DROP PROCEDURE BOGO.bi_migrar_fecha_publicacion
IF OBJECT_ID('BOGO.bi_migrar_fecha_finalizacion') IS NOT NULL DROP PROCEDURE BOGO.bi_migrar_fecha_finalizacion
IF OBJECT_ID('BOGO.bi_migrar_anuncios') IS NOT NULL DROP PROCEDURE BOGO.bi_migrar_anuncios
IF OBJECT_ID('BOGO.BI_migrar_barrios') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_barrios
IF OBJECT_ID('BOGO.BI_migrar_Edad') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_Edad
IF OBJECT_ID('BOGO.BI_migrar_alquiler') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_alquiler
-- IF OBJECT_ID('BOGO.BI_migrar_estado_alquiler') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_estado_alquiler
-- IF OBJECT_ID('BOGO.BI_migrar_pago_alquiler') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_pago_alquiler
-- IF OBJECT_ID('BOGO.BI_migrar_venta') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_venta

-- BORRADO DE VISTAS
IF OBJECT_ID('BOGO.v_duracion_promedio_dias_anuncio') IS NOT NULL DROP VIEW BOGO.v_duracion_promedio_dias_anuncio
IF OBJECT_ID('BOGO.v_promedio_precio_anuncio') IS NOT NULL DROP VIEW BOGO.v_promedio_precio_anuncio
IF OBJECT_ID('BOGO.v_5_barrios_mas_elegidos_rango_etario') IS NOT NULL DROP VIEW BOGO.v_5_barrios_mas_elegidos_rango_etario


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

Create TABLE BOGO.BI_rangos_superficie(
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
	duracion_promedio DECIMAL(12,2),  -- renombrar a precio_anuncio
	precio_promedio DECIMAL(12,2),
	PRIMARY KEY (codigo_anuncio, codigo_fecha_alta, codigo_fecha_baja,  codigo_tiempo, codigo_tipo_operacion, codigo_tipo_inmueble, codigo_moneda, codigo_rango_superficie, codigo_ambientes, codigo_ubicacion)
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

CREATE TABLE BOGO.BI_Alquiler(
	codigo_alquiler INT,
	codigo_tiempo INT, 
	codigo_edad INT,  
	codigo_barrio INT,
	fecha_de_inicio DATE,
	PRIMARY KEY(codigo_alquiler, codigo_tiempo, codigo_edad, codigo_barrio)
)
/*
-- vista 4 y 5
-- TODO
CREATE TABLE BOGO.BI_Pago_alquiler(
	codigo_pago_alquiler INT,
	codigo_tiempo INT, -- cuatrimestre/año 
	alquiler INT, --fk
    fecha_de_pago DATETIME,
	fecha_de_vencimiento DATETIME
) ????

CREATE TABLE BOGO.BI_estado_Alquiler(
	estado_alquiler INT PRIMARY KEY IDENTITY (1,1),
	nombre NVARCHAR(100) NULL

)

CREATE TABLE BOGO.BI_pago_alquiler(
	codigo_pago_alquiler INT PRIMARY KEY IDENTITY (1,1), 
	alquiler INT,
    fecha_de_pago DATETIME,
	fecha_de_vencimiento DATETIME,
    numero_de_periodo_de_pago INT,
    fecha_de_inicio_periodo_de_pago DATETIME,
    fecha_de_fin_periodo_de_pago DATETIME,
    descripcion VARCHAR(150),
    importe FLOAT,
	PRIMARY KEY (codigo_pago_alquiler, alquiler)
)

CREATE TABLE BOGO.BI_venta(
	codigo_venta INT,
	superficie_total_inmueble INT,
	localidad INT,
	tiempo INT NOT NULL,
	precio_venta INT,
	tipo_inmueble INT,
	precio_m2 INT 
)
*/
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
		FOREIGN KEY (codigo_fecha_baja) REFERENCES BOGO.BI_Fecha_finalizacion(codigo)
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
		SELECT @id_edad = id_edad FROM BOGO.bi_edad WHERE edad_inferior = 25
	ELSE IF @EDAD BETWEEN 25 AND 35
		SELECT @id_edad = id_edad FROM BOGO.bi_edad WHERE edad_superior = 35
	ELSE IF @EDAD BETWEEN 36 AND 50
		SELECT @id_edad = id_edad FROM BOGO.bi_edad WHERE edad_superior = 50
	ELSE
		SELECT @id_edad = id_edad FROM BOGO.bi_edad WHERE edad_inferior = 50

	RETURN @id_edad;
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

	SELECT @id_tiempo = id_tiempo FROM BOGO.bi_tiempo WHERE anio = @anio AND mes = @mes

	RETURN @id_tiempo
END
GO
*/


---------------------------------------------------------------------------------------------------
--                                            Parte 4                                            --
---------------------------------------------------------------------------------------------------

--  CREACION DE PROCEDURES 
CREATE PROCEDURE BOGO.bi_migrar_tiempo AS
BEGIN
    INSERT INTO BOGO.BI_tiempo (anio, cuatrimestre, mes) 
        SELECT DISTINCT YEAR(AN.fecha_publicacion) as "Anio", DATEPART(QUARTER, AN.fecha_publicacion) as "Cuatrimestre", MONTH(AN.fecha_publicacion) as "Mes" FROM BOGO.Anuncio AN
	UNION
		SELECT DISTINCT YEAR(AN.fecha_finalizacion) as "Anio", DATEPART(QUARTER, AN.fecha_finalizacion) as "Cuatrimestre", MONTH(AN.fecha_finalizacion) as "Mes" FROM BOGO.Anuncio AN
	UNION 
		SELECT DISTINCT YEAR(A.fecha_de_inicio) as "Anio", DATEPART(QUARTER, A.fecha_de_inicio) as "Cuatrimestre", MONTH(A.fecha_de_inicio) as "Mes" FROM BOGO.Alquiler A
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

CREATE PROCEDURE BOGO.BI_migrar_rangos_superficie AS
BEGIN 
	INSERT INTO BOGO.BI_rangos_superficie(limite_inferior,limite_superior,descipcion_rango) VALUES (0,35,'<35')
	INSERT INTO BOGO.BI_rangos_superficie(limite_inferior,limite_superior,descipcion_rango) VALUES (35,55,'35-55')
	INSERT INTO BOGO.BI_rangos_superficie(limite_inferior,limite_superior,descipcion_rango) VALUES (55,75,'55-75')
	INSERT INTO BOGO.BI_rangos_superficie(limite_inferior,limite_superior,descipcion_rango) VALUES (75,100,'75-100')
	INSERT INTO BOGO.BI_rangos_superficie(limite_inferior,limite_superior,descipcion_rango) VALUES (100,null,'>100')
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

CREATE PROCEDURE BOGO.bi_migrar_fecha_publicacion AS 
BEGIN 
	INSERT INTO BOGO.BI_Fecha_publicacion(fecha_publicacion) SELECT DISTINCT Cast(a.fecha_publicacion as date) AS "Anio" FROM Bogo.Anuncio a ORDER BY anio
END
GO 

CREATE PROCEDURE BOGO.bi_migrar_fecha_finalizacion AS 
BEGIN 
	INSERT INTO BOGO.BI_Fecha_finalizacion(fecha_finalizacion) SELECT DISTINCT Cast(a.fecha_finalizacion as date) AS "Anio" FROM Bogo.Anuncio a ORDER BY anio
END
GO

CREATE PROCEDURE BOGO.bi_migrar_anuncios AS
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
END
GO

CREATE PROCEDURE BOGO.BI_migrar_barrios AS 
BEGIN 
	SET IDENTITY_INSERT Bogo.BI_Barrio ON
	INSERT INTO BOGO.BI_Barrio(cod_barrio,descripcion) SELECT barr.codigo_barrio, barr.nombre FROM BOGO.Barrio barr
	SET IDENTITY_INSERT Bogo.BI_Barrio OFF
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
	INSERT INTO BOGO.BI_Alquiler(codigo_alquiler, codigo_tiempo, codigo_edad, codigo_barrio, fecha_de_inicio)
	SELECT a.codigo_alquiler, ti.codigo_tiempo, e.id_edad, b.cod_barrio, CAST(a.fecha_de_inicio AS date)
	FROM BOGO.Alquiler a
	INNER JOIN BOGO.BI_Tiempo ti ON ti.anio = Year(a.fecha_de_inicio) and ti.cuatrimestre = DATEPART(QUARTER,a.fecha_de_inicio) and ti.mes = MONTH(a.fecha_de_inicio)
	INNER JOIN BOGO.Inquilino i ON i.codigo_inquilino = a.inquilino
	INNER JOIN BOGO.BI_Edad e ON e.id_edad = BOGO.OBTENER_RANGO_EDAD(i.fecha_nacimiento)
	INNER JOIN BOGO.Anuncio an ON an.numero_anuncio = a.anuncio
	INNER JOIN BOGO.Inmueble inm ON inm.numero_de_inmueble = an.inmueble
	INNER JOIN BOGO.BI_Barrio b ON b.cod_barrio = inm.barrio
END	
GO


/*
-- TODO view 5
CREATE PROCEDURE BOGO.BI_migrar_estado_alquiler AS 
BEGIN 
	INSERT INTO BOGO.BI_estado_alquiler
	SELECT DISTINCT estado_alquiler, nombre FROM BOGO.estado_alquiler
END 
GO

CREATE PROCEDURE BOGO.BI_migrar_pago_alquiler AS
BEGIN
	INSERT INTO BOGO.BI_pago_alquiler
	SELECT DISTINCT codigo_pago_alquiler, alquiler, numero_de_periodo_de_pago, fecha_de_pago, importe, fecha_de_vencimiento, descripcion, fecha_de_inicio_periodo_de_pago, fecha_de_fin_periodo_de_pago 
	FROM BOGO.pago_alquiler
END
GO

CREATE PROCEDURE BOGO.BI_migrar_venta AS
BEGIN
			INSERT INTO BOGO.BI_venta (codigo_venta, superficie_total_inmueble, localidad, precio_venta, tipo_inmueble, precio_m2, tiempo)
			SELECT v.codigo_venta, ra_super.codigo_m2, u.codigo_localidad, v.precio_venta, inm.tipo_inmueble, 
			FROM BOGO.venta v
			INNER JOIN BOGO.Anuncio an ON an.numero_anuncio = v.anuncio
			INNER JOIN BOGO.Inmueble inm ON inm.numero_de_inmueble = an.inmueble
			INNER JOIN BOGO.BI_ubicacion u ON u.codigo_localidad = inm.localidad
			INNER JOIN BOGO.BI_rangos_superficie ra_super on ra_super.codigo_m2 = Bogo.Obtener_ID_Rango(inm.superficie)
			INNER JOIN BOGO.Inmueble inm ON inm.tipo_inmueble = an.inmueble
			-- FALTA PRECIO_M2 creo que falta una funcion para esto
			INNER JOIN BOGO.BI_Tiempo ti ON 
END		
*/
		


---------------------------------------------------------------------------------------------------
--                                            Parte 5                                            --
---------------------------------------------------------------------------------------------------

--  EJECUCIÓN DE LOS PROCEDURES PARA MIGRAR LOS DATOS
EXEC BOGO.bi_migrar_tiempo;
GO
EXEC BOGO.bi_migrar_tipo_operacion;
GO
EXEC BOGO.bi_migrar_tipo_inmueble;
GO
EXEC BOGO.bi_migrar_moneda;
GO
EXEC BOGO.BI_migrar_rangos_superficie;
GO
EXEC BOGO.bi_migrar_ambientes;
GO
EXEC BOGO.bi_migrar_ubicacion;
GO
EXEC BOGO.bi_migrar_fecha_publicacion;
GO
EXEC BOGO.bi_migrar_fecha_finalizacion;
GO
EXEC BOGO.bi_migrar_anuncios;
GO
EXEC BOGO.BI_migrar_barrios
GO
EXEC BOGO.BI_migrar_Edad
GO
EXEC BOGO.BI_migrar_alquiler
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

/*
4. Porcentaje de incumplimiento de pagos de alquileres en término por cada mes/año. Se calcula en función de las fechas de pago y fecha de vencimiento del
mismo. El porcentaje es en función del total de pagos en dicho periodo.
*/

/*
5. Porcentaje promedio de incremento del valor de los alquileres para los contratos en curso por mes/año. Se calcula tomando en cuenta el último pago
con respecto al del mes en curso, únicamente de aquellos alquileres que hayan tenido aumento y están activos.
*/
/*
CREATE VIEW ABC.v_aumento_promedio_de_precios_de_cada_proveedor_anual AS
	SELECT t.anio AS Anio, p.razon_social AS Razon_Social_Proveedor, (MAX(c.precio_unitario) - MIN(c.precio_unitario)) / MIN(c.precio_unitario) AS Aumento_Promedio
		FROM ABC.bi_compras_productos c INNER JOIN ABC.bi_tiempo t ON c.id_tiempo = t.id_tiempo
											 INNER JOIN ABC.bi_proveedor p ON c.id_proveedor = p.proveedor_id
		GROUP BY t.anio, p.razon_social
GO
*/

/*
6. Precio promedio de m2 de la venta de inmuebles según el tipo de inmueble y la localidad para cada cuatrimestre/año. Se calcula en función de las ventas
concretadas.
*/
/*
CREATE VIEW BOGO.v_precio_promedio_m2_ventas AS
	SELECT BI_TIPO_INMUEBLE_DETALLE, BI_LOCALIDAD_DETALLE, BI_TIEMPO_ANIO, BI_TIEMPO_CUATRIMESTRE, AVG(BI_VENTA_PRECIO_M2) AS PROM_PRECIO_M2
FROM BOGO.BI_VENTA 
JOIN BOGO.BI_TIPO_INMUEBLE ON BI_VENTA_TIPO_INMUEBLE= BI_TIPO_INMUEBLE_CODIGO
JOIN BOGO.BI_LOCALIDAD ON BI_VENTA_LOCALIDAD = BI_LOCALIDAD_CODIGO
JOIN BOGO.BI_TIEMPO ON BI_VENTA_TIEMPO = BI_TIEMPO_CODIGO
GROUP BY  BI_TIPO_INMUEBLE_DETALLE, BI_LOCALIDAD_DETALLE, BI_TIEMPO_ANIO, BI_TIEMPO_CUATRIMESTRE
*/

/*
7. Valor promedio de la comisión según el tipo de operación (alquiler, venta, etc) y sucursal para cada cuatrimestre/año. Se calcula en función de los alquileres y
ventas concretadas dentro del periodo.
*/


/*
8. Porcentaje de operaciones concretadas (tanto de alquileres como ventas) por cada sucursal, según el rango etario de los empleados por año en función de la
cantidad de anuncios publicados en ese mismo año.*/
/*
CREATE VIEW ABC.v_porcentaje_de_envios_realizados_a_cada_provincia AS
	SELECT t.anio AS Anio, t.mes AS Mes, p.nombre AS Provincia, 100 * SUM(e.cantidad) / (SELECT SUM(e1.cantidad) FROM ABC.bi_envios e1 WHERE e.id_tiempo=e1.id_tiempo GROUP BY e1.id_tiempo) AS Porcentaje
		FROM ABC.bi_envios e INNER JOIN ABC.bi_tiempo t ON e.id_tiempo = t.id_tiempo
								  INNER JOIN ABC.bi_provincia p ON e.id_provincia = p.provincia_id
		GROUP BY t.anio, t.mes, p.nombre, e.id_tiempo
GO
*/

/*
9. Monto total de cierre de contratos por tipo de operación (tanto de alquileres como ventas) por cada cuatrimestre y sucursal, diferenciando el tipo de moneda.
*/