USE [GD2C2023]

-- PARTE 1: borrado de tablas, funciones, procedures y vistas
-- PARTE 2: creación de tablas de dimensiones, hechos y fk
-- PARTE 3: creación de funciones
-- PARTE 4: creación de procedures
-- PARTE 5: ejecución de los procedures para migrar los datos
-- PARTE 6: creación de las vistas

---------------------------------------------------------------------------------------------------
--                                            Parte 1                                            --
---------------------------------------------------------------------------------------------------

-- BORRADO DE TABLAS DIMENSIONALES
IF OBJECT_ID('BOGO.BI_Tipo_Inmueble', 'U') IS NOT NULL DROP TABLE BOGO.BI_Tipo_Inmueble
IF OBJECT_ID('BOGO.BI_Tipo_operacion', 'U') IS NOT NULL DROP TABLE BOGO.BI_Tipo_operacion
IF OBJECT_ID('BOGO.BI_Tiempo', 'U') IS NOT NULL DROP TABLE BOGO.BI_Tiempo
IF OBJECT_ID('BOGO.BI_Moneda', 'U') IS NOT NULL DROP TABLE BOGO.BI_Moneda
IF OBJECT_ID('BOGO.BI_rangos_superficie', 'U') IS NOT NULL DROP TABLE BOGO.BI_rangos_superficie
IF OBJECT_ID('BOGO.BI_Ambientes', 'U') IS NOT NULL DROP TABLE BOGO.BI_Ambientes
IF OBJECT_ID('BOGO.BI_Ubicacion', 'U') IS NOT NULL DROP TABLE BOGO.BI_Ubicacion
IF OBJECT_ID('BOGO.BI_Edad', 'U') IS NOT NULL DROP TABLE BOGO.BI_Edad
IF OBJECT_ID('BOGO.BI_Sucursal', 'U') IS NOT NULL DROP TABLE BOGO.BI_Sucursal

-- BORRADO DE TABLAS DE HECHOS
IF OBJECT_ID('BOGO.BI_Hechos_Anuncios', 'U') IS NOT NULL DROP TABLE BOGO.BI_Hechos_Anuncios
IF OBJECT_ID('BOGO.BI_Hechos_Alquileres', 'U') IS NOT NULL DROP TABLE BOGO.BI_Hechos_Alquileres
IF OBJECT_ID('BOGO.BI_Hechos_Ventas', 'U') IS NOT NULL DROP TABLE BOGO.BI_Hechos_Ventas
IF OBJECT_ID('BOGO.BI_Hechos_Pago_alquileres', 'U') IS NOT NULL DROP TABLE BOGO.BI_Hechos_Pago_alquileres

-- BORRADO DE FUNCIONES
IF OBJECT_ID('BOGO.OBTENER_ID_RANGO') IS NOT NULL DROP FUNCTION BOGO.OBTENER_ID_RANGO
IF OBJECT_ID('BOGO.OBTENER_RANGO_EDAD') IS NOT NULL DROP FUNCTION BOGO.OBTENER_RANGO_EDAD
IF OBJECT_ID('BOGO.OBTENER_CUATRIMESTRE') IS NOT NULL DROP FUNCTION BOGO.OBTENER_CUATRIMESTRE
IF OBJECT_ID('BOGO.OBTENER_TOTAL_ALQUILER') IS NOT NULL DROP FUNCTION BOGO.OBTENER_TOTAL_ALQUILER
IF OBJECT_ID('BOGO.OBTENER_ID_TIEMPO') IS NOT NULL DROP FUNCTION BOGO.OBTENER_ID_TIEMPO

-- BORRADO DE PROCEDURES
IF OBJECT_ID('BOGO.BI_migrar_tiempo') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_tiempo
IF OBJECT_ID('BOGO.BI_migrar_Edad') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_Edad
IF OBJECT_ID('BOGO.BI_migrar_tipo_operacion') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_tipo_operacion
IF OBJECT_ID('BOGO.BI_migrar_tipo_inmueble') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_tipo_inmueble
IF OBJECT_ID('BOGO.BI_migrar_moneda') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_moneda
IF OBJECT_ID('BOGO.BI_migrar_rangos_superficie') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_rangos_superficie
IF OBJECT_ID('BOGO.BI_migrar_ambientes') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_ambientes
IF OBJECT_ID('BOGO.BI_migrar_ubicacion') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_ubicacion
IF OBJECT_ID('BOGO.BI_migrar_sucursal') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_sucursal
IF OBJECT_ID('BOGO.BI_migrar_hechos_anuncios') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_hechos_anuncios
IF OBJECT_ID('BOGO.BI_migrar_hechos_alquileres') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_hechos_alquileres
IF OBJECT_ID('BOGO.BI_migrar_hechos_pago_alquileres') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_hechos_pago_alquileres
IF OBJECT_ID('BOGO.BI_migrar_hechos_ventas') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_hechos_ventas

-- BORRADO DE VISTAS
IF OBJECT_ID('BOGO.v_duracion_promedio_dias_anuncio') IS NOT NULL DROP VIEW BOGO.v_duracion_promedio_dias_anuncio
IF OBJECT_ID('BOGO.v_promedio_precio_anuncio') IS NOT NULL DROP VIEW BOGO.v_promedio_precio_anuncio
IF OBJECT_ID('BOGO.v_5_barrios_mas_elegidos_rango_etario') IS NOT NULL DROP VIEW BOGO.v_5_barrios_mas_elegidos_rango_etario
IF OBJECT_ID('BOGO.v_porcentaje_incumplimiento_de_pagos') IS NOT NULL DROP VIEW BOGO.v_porcentaje_incumplimiento_de_pagos
IF OBJECT_ID('BOGO.v_promedio_de_incremento_del_valor_de_los_alquileres') IS NOT NULL DROP VIEW BOGO.v_promedio_de_incremento_del_valor_de_los_alquileres
IF OBJECT_ID('BOGO.v_precio_promedio_m2_ventas') IS NOT NULL DROP VIEW BOGO.v_precio_promedio_m2_ventas
IF OBJECT_ID('BOGO.v_promedio_comision_segun_operacion') IS NOT NULL DROP VIEW BOGO.v_promedio_comision_segun_operacion
IF OBJECT_ID('BOGO.v_porcentaje_operaciones_concretadas') IS NOT NULL DROP VIEW BOGO.v_porcentaje_operaciones_concretadas
IF OBJECT_ID('BOGO.v_monto_total_cierre_contratos_por_operacion') IS NOT NULL DROP VIEW BOGO.v_monto_total_cierre_contratos_por_operacion


---------------------------------------------------------------------------------------------------
--                                            Parte 2                                            --
---------------------------------------------------------------------------------------------------

-- TABLAS DIMENSIONALES
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
	mes INT,
	dia INT
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
	nombre_provincia VARCHAR(250),
	nombre_localidad VARCHAR(250),
	nombre_barrio VARCHAR(250)
)

CREATE TABLE BOGO.BI_Edad(
	id_edad INT PRIMARY KEY IDENTITY(1,1),
	edad_inferior int,
	edad_superior int,
	rango NVARCHAR(50) NOT NULL
)

CREATE TABLE BOGO.BI_sucursal(
    codigo_sucursal INT PRIMARY KEY IDENTITY(1,1),
    descripcion VARCHAR(150)
)

-------------------------------------------------------
-- TABLAS DE HECHOS
CREATE TABLE BOGO.BI_Hechos_Anuncios(
	codigo_anuncio INT PRIMARY KEY IDENTITY(1,1),
	codigo_tiempo INT,
	codigo_tipo_operacion INT,
	codigo_tipo_inmueble INT,
	codigo_moneda INT,
	codigo_rango_superficie INT, 
	codigo_ambientes INT, 
	codigo_ubicacion INT,
	duracion_anuncio INT,
	precio_promedio_anuncio DECIMAL(12,2),
	cant_anuncios_segmentados INT

)

CREATE TABLE BOGO.BI_Hechos_Alquileres(
	codigo_alquiler INT PRIMARY KEY IDENTITY(1,1),
	codigo_tiempo INT, 
	codigo_tipo_inmueble INT, 
	codigo_rangom2 INT,
	codigo_ubicacion INT,
	codigo_edad_inquilino INT,
	codigo_edad_agente INT,
	codigo_sucursal INT, 
	codigo_ambiente INT, 
	codigo_moneda INT, 
	comision INT, 
	deposito INT, 
	cant_alquileres_segregados INT
)

CREATE TABLE BOGO.BI_Hechos_Ventas(
    codigo_venta INT PRIMARY KEY IDENTITY(1,1),
	tiempo INT,
	tipo_inmueble INT, 
	rangom2 INT, 
	ubicacion INT, 
	edad INT, 
	sucursal INT, 
	ambientes INT, 
	tipo_moneda INT, 
	comision INT, 
	precio_venta_promedio_por_m2 INT,
	precio_venta_total int ,
	cant_ventas_segregadas INT
)

CREATE TABLE BOGO.BI_Hechos_Pago_alquileres(
	codigo_pago_alquiler INT PRIMARY KEY IDENTITY(1,1), 
    fecha_de_pago int,
	fecha_de_vencimiento int,
    aumento FLOAT,
	cant_pagos_Segregados INT
)


-------------------------------------------------------
-- CREACION DE PKs COMPUESTAS
ALTER TABLE BOGO.BI_Hechos_Alquileres
	ADD FOREIGN KEY (codigo_tiempo) REFERENCES BOGO.BI_Tiempo(codigo_tiempo),
		FOREIGN KEY (codigo_tipo_inmueble) REFERENCES BOGO.BI_Tipo_Inmueble(codigo_tipo_inmueble),
		FOREIGN KEY (codigo_rangom2) REFERENCES BOGO.BI_rangos_superficie(codigo_m2),
		FOREIGN KEY (codigo_ubicacion) REFERENCES BOGO.BI_Ubicacion(codigo_ubicacion),
		FOREIGN KEY (codigo_edad_inquilino) REFERENCES BOGO.BI_Edad(id_Edad),
		FOREIGN KEY (codigo_edad_agente) REFERENCES BOGO.BI_Edad(id_Edad),
		FOREIGN KEY (codigo_sucursal) REFERENCES BOGO.BI_sucursal(codigo_sucursal),
		FOREIGN KEY (codigo_ambiente) REFERENCES BOGO.BI_Ambientes(codigo_ambientes),
		FOREIGN KEY (codigo_moneda) REFERENCES BOGO.BI_Moneda(codigo_moneda)
GO

ALTER TABLE BOGO.BI_Hechos_Anuncios
	ADD FOREIGN KEY (codigo_tipo_operacion) REFERENCES BOGO.BI_Tipo_operacion(codigo_tipo_operacion), 
		FOREIGN KEY (codigo_tipo_inmueble) REFERENCES BOGO.BI_Tipo_Inmueble(codigo_tipo_inmueble),
		FOREIGN KEY (codigo_moneda) REFERENCES BOGO.BI_Moneda(codigo_moneda),
		FOREIGN KEY (codigo_rango_superficie) REFERENCES BOGO.BI_rangos_superficie(codigo_m2),
		FOREIGN KEY (codigo_ambientes) REFERENCES BOGO.BI_Ambientes(codigo_ambientes),
		FOREIGN KEY (codigo_ubicacion) REFERENCES BOGO.BI_Ubicacion(codigo_ubicacion),
		FOREIGN KEY (codigo_tiempo) REFERENCES BOGO.BI_Tiempo(codigo_tiempo)
GO

ALTER TABLE BOGO.BI_Hechos_Pago_alquileres
	ADD FOREIGN KEY (fecha_de_pago) REFERENCES BOGO.BI_Tiempo(codigo_tiempo),
		FOREIGN KEY (fecha_de_vencimiento) REFERENCES BOGO.BI_Tiempo(codigo_tiempo)
GO

ALTER TABLE BOGO.BI_Hechos_Ventas
	ADD FOREIGN KEY (tiempo) REFERENCES BOGO.BI_Tiempo(codigo_tiempo),	
		FOREIGN KEY (tipo_inmueble) REFERENCES BOGO.BI_Tipo_inmueble(codigo_tipo_inmueble) ,
		FOREIGN KEY (rangom2) REFERENCES BOGO.BI_rangos_superficie(codigo_m2),
		FOREIGN KEY (ubicacion) REFERENCES BOGO.BI_Ubicacion(codigo_ubicacion),
		FOREIGN KEY (edad) REFERENCES BOGO.BI_Edad(id_edad),
		FOREIGN KEY (sucursal) REFERENCES BOGO.BI_sucursal(codigo_sucursal),
		FOREIGN KEY (ambientes) REFERENCES BOGO.BI_Ambientes(codigo_ambientes),
		FOREIGN KEY (tipo_moneda) REFERENCES BOGO.BI_Moneda(codigo_moneda)
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

CREATE FUNCTION BOGO.OBTENER_TOTAL_ALQUILER(@alquiler INT) RETURNS INT AS
BEGIN
	DECLARE @monto INT
	SELECT @monto = a.deposito + (SELECT SUM(p.precio) FROM BOGO.periodo p WHERE p.alquiler = @alquiler) 
	FROM BOGO.Alquiler a 
	WHERE a.codigo_alquiler= @alquiler
	RETURN @monto;
END
GO

CREATE FUNCTION BOGO.OBTENER_ID_TIEMPO(@fecha DATE) RETURNS INT AS
BEGIN
	DECLARE @anio DECIMAL(4),
			@mes DECIMAL(2),
			@id_tiempo DECIMAL(18)

	SET @anio = DATEPART(YEAR, @fecha)
	SET @mes = DATEPART(MONTH, @fecha)

	SELECT @id_tiempo = codigo_tiempo FROM BOGO.BI_Tiempo WHERE anio = @anio AND mes = @mes

	RETURN @id_tiempo
END
GO


---------------------------------------------------------------------------------------------------
--                                            Parte 4                                            --
---------------------------------------------------------------------------------------------------

-- CREACIÓN DE PROCEDURES PARA TABLAS DIMENSIONALES
CREATE PROCEDURE BOGO.BI_migrar_tiempo AS
BEGIN
     INSERT INTO BOGO.BI_tiempo (anio, cuatrimestre, mes, dia)
		SELECT DISTINCT YEAR(A.fecha_de_inicio) as "Anio", BOGO.OBTENER_CUATRIMESTRE(MONTH(A.fecha_de_inicio)) as "Cuatrimestre", MONTH(A.fecha_de_inicio) as "Mes", DAY(A.fecha_de_inicio) as "Día" FROM BOGO.Alquiler A
	UNION
		SELECT DISTINCT YEAR(A.fecha_de_fin) as "Anio", BOGO.OBTENER_CUATRIMESTRE(MONTH(A.fecha_de_fin)) as "Cuatrimestre", MONTH(A.fecha_de_fin) as "Mes", DAY(A.fecha_de_fin) as "Día" FROM BOGO.Alquiler A
	UNION
		SELECT DISTINCT YEAR(AN.fecha_publicacion) as "Anio", BOGO.OBTENER_CUATRIMESTRE(MONTH(AN.fecha_publicacion)) as "Cuatrimestre", MONTH(AN.fecha_publicacion) as "Mes", DAY(AN.fecha_publicacion) as "Día" FROM BOGO.Anuncio AN
	UNION
		SELECT DISTINCT YEAR(AN.fecha_finalizacion) as "Anio", BOGO.OBTENER_CUATRIMESTRE(MONTH(AN.fecha_finalizacion)) as "Cuatrimestre", MONTH(AN.fecha_finalizacion) as "Mes", DAY(AN.fecha_finalizacion) as "Día" FROM BOGO.Anuncio AN
	UNION
		SELECT DISTINCT YEAR(v.fecha_de_venta) as "Anio", BOGO.OBTENER_CUATRIMESTRE(MONTH(v.fecha_de_venta)) as "Cuatrimestre", MONTH(v.fecha_de_venta) as "Mes", DAY(v.fecha_de_venta) as "Día" FROM BOGO.venta v
	UNION	
		SELECT DISTINCT YEAR(pg.fecha_de_pago) as "Anio", BOGO.OBTENER_CUATRIMESTRE(MONTH(pg.fecha_de_pago)) as "Cuatrimestre", MONTH(pg.fecha_de_pago) as "Mes", DAY(pg.fecha_de_pago) as "Día" FROM BOGO.Pago_alquiler pg
	UNION
		SELECT DISTINCT YEAR(pg.fecha_de_vencimiento) as "Anio", BOGO.OBTENER_CUATRIMESTRE(MONTH(pg.fecha_de_vencimiento)) as "Cuatrimestre", MONTH(pg.fecha_de_vencimiento) as "Mes", DAY(pg.fecha_de_vencimiento) as "Día" FROM BOGO.Pago_alquiler pg
	ORDER BY anio ASC, cuatrimestre ASC, mes ASC, "Día" ASC
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
    INSERT INTO BOGO.BI_ubicacion (nombre_provincia, nombre_localidad, nombre_barrio)
        SELECT DISTINCT p.nombre, l.nombre, b.nombre FROM BOGO.Provincia p
			INNER JOIN BOGO.localidad l on p.codigo_provincia = l.provincia
			INNER JOIN BOGO.barrio b on l.codigo_localidad = b.localidad
END
GO

CREATE PROCEDURE Bogo.BI_migrar_sucursal AS
BEGIN
	INSERT INTO Bogo.BI_sucursal(descripcion) 
	SELECT s.nombre FROM Bogo.Sucursal s
END
GO

-------------------------------------------------------
-- CREACIÓN DE PROCEDURES PARA TABLAS DE HECHOS
CREATE PROCEDURE BOGO.BI_migrar_hechos_anuncios AS
BEGIN
	INSERT INTO BOGO.BI_Hechos_Anuncios(codigo_tiempo, codigo_tipo_inmueble, codigo_moneda, codigo_ambientes, codigo_tipo_operacion, codigo_rango_superficie, codigo_ubicacion,duracion_anuncio, precio_promedio_anuncio, cant_anuncios_segmentados) 
	SELECT DISTINCT ti.codigo_tiempo,
					tipo_inmueble.codigo_tipo_inmueble,
					mon.codigo_moneda,
					amb.codigo_ambientes,
					tipo_operacion.codigo_tipo_operacion,
					ra_super.codigo_m2,
					ubi.codigo_ubicacion,
					SUM(DATEDIFF(DAY,a.fecha_publicacion,a.fecha_finalizacion)) AS "Duración Promedio",
					SUM(a.precio_inmueble),
					COUNT(a.numero_anuncio)
	FROM Bogo.Anuncio a
	INNER JOIN Bogo.BI_Tiempo ti ON ti.anio = YEAR(a.fecha_publicacion) and ti.cuatrimestre = BOGO.OBTENER_CUATRIMESTRE(MONTH(a.fecha_publicacion)) and ti.mes = MONTH(a.fecha_publicacion) and ti.dia = DAY(a.fecha_publicacion)
	INNER JOIN BOGO.BI_Moneda mon ON a.moneda = mon.codigo_moneda
	INNER JOIN BOGO.Inmueble inm ON a.inmueble = inm.numero_de_inmueble
	INNER JOIN BOGO.BI_Tipo_Inmueble tipo_inmueble ON tipo_inmueble.codigo_tipo_inmueble = inm.tipo_inmueble
    INNER JOIN BOGO.BI_Ambientes amb ON amb.cantidad = inm.ambientes
	INNER JOIN Bogo.BI_Tipo_operacion tipo_operacion ON tipo_operacion.codigo_tipo_operacion = a.tipo_operacion
	INNER JOIN BOGO.Provincia prov ON prov.codigo_provincia = inm.provincia
	INNER JOIN BOGO.Localidad loc ON loc.codigo_localidad = inm.localidad
	INNER JOIN BOGO.Barrio barr ON barr.codigo_barrio = inm.barrio
	INNER JOIN BOGO.BI_Ubicacion ubi ON ubi.nombre_provincia = prov.nombre and ubi.nombre_localidad = loc.nombre and ubi.nombre_barrio = barr.nombre
	INNER JOIN BOGO.BI_rangos_superficie ra_super ON ra_super.codigo_m2 = BOGO.OBTENER_ID_RANGO(inm.superficie)
	GROUP BY ti.codigo_tiempo, mon.codigo_moneda, ubi.codigo_ubicacion, tipo_inmueble.codigo_tipo_inmueble, amb.codigo_ambientes, tipo_operacion.codigo_tipo_operacion,	ra_super.codigo_m2
END
GO

CREATE PROCEDURE BOGO.BI_migrar_hechos_alquileres AS
BEGIN
	INSERT INTO BOGO.BI_Hechos_Alquileres(codigo_tiempo, codigo_tipo_inmueble, codigo_rangom2, codigo_ubicacion, codigo_edad_inquilino, codigo_edad_agente, codigo_sucursal, codigo_ambiente, codigo_moneda, comision, deposito, cant_alquileres_segregados)
	SELECT	ti.codigo_tiempo,
			tipo_inmueble.codigo_tipo_inmueble,
			ra_super.codigo_m2,
			ubi.codigo_ubicacion,
			e.id_edad,
			e2.id_edad,
			s.codigo_sucursal,
			amb.codigo_ambientes,
			an.moneda,
			SUM(a.comision) AS "Comisión",
			SUM(a.deposito) AS "Depósito",
			COUNT(*) AS "Cantidad de alquileres segmentados"
	FROM BOGO.Alquiler a
	INNER JOIN Bogo.BI_Tiempo ti ON ti.anio = YEAR(a.fecha_de_inicio) and ti.cuatrimestre = BOGO.OBTENER_CUATRIMESTRE(MONTH(a.fecha_de_inicio)) and ti.mes = MONTH(a.fecha_de_inicio) and ti.dia = DAY(a.fecha_de_inicio)
	INNER JOIN BOGO.Anuncio an ON an.numero_anuncio = a.anuncio
	INNER JOIN BOGO.Inmueble inm ON an.inmueble = inm.numero_de_inmueble
	INNER JOIN BOGO.BI_Tipo_Inmueble tipo_inmueble ON tipo_inmueble.codigo_tipo_inmueble = inm.tipo_inmueble
	INNER JOIN BOGO.BI_rangos_superficie ra_super ON ra_super.codigo_m2 = BOGO.OBTENER_ID_RANGO(inm.superficie)
	INNER JOIN BOGO.Provincia prov ON prov.codigo_provincia = inm.provincia
	INNER JOIN BOGO.Localidad loc ON loc.codigo_localidad = inm.localidad
	INNER JOIN BOGO.Barrio barr ON barr.codigo_barrio = inm.barrio
	INNER JOIN BOGO.BI_Ubicacion ubi ON ubi.nombre_provincia = prov.nombre and ubi.nombre_localidad = loc.nombre and ubi.nombre_barrio = barr.nombre
	INNER JOIN BOGO.Inquilino i ON i.codigo_inquilino = a.inquilino
	INNER JOIN BOGO.BI_Edad e ON e.id_edad = BOGO.OBTENER_RANGO_EDAD(i.fecha_nacimiento)
	INNER JOIN BOGO.Agente_inmobiliario ag ON ag.codigo_agente = an.agente_inmobiliario
	INNER JOIN BOGO.BI_Edad e2 ON e.id_edad = BOGO.OBTENER_RANGO_EDAD(ag.fecha_nacimiento)
	INNER JOIN BOGO.BI_sucursal s ON s.codigo_sucursal = ag.sucursal
	INNER JOIN BOGO.BI_Ambientes amb ON amb.cantidad = inm.ambientes
	INNER JOIN BOGO.BI_Moneda mon ON an.moneda = mon.codigo_moneda
	GROUP BY ti.codigo_tiempo, tipo_inmueble.codigo_tipo_inmueble, ra_super.codigo_m2, ubi.codigo_ubicacion, e.id_edad, e2.id_edad, s.codigo_sucursal, amb.codigo_ambientes, an.moneda
END	
GO

CREATE PROCEDURE BOGO.BI_migrar_hechos_pago_alquileres AS
BEGIN
	INSERT INTO BOGO.BI_Hechos_Pago_alquileres (fecha_de_pago, fecha_de_vencimiento, aumento, cant_pagos_Segregados)
	SELECT	t.codigo_tiempo, ti.codigo_tiempo,
			ISNULL((SELECT SUM(pa1.importe-pa2.importe)
					FROM BOGO.PAGO_ALQUILER pa1 INNER JOIN BOGO.PAGO_ALQUILER pa2 
					ON pa2.alquiler = pa1.alquiler 
					AND pa2.importe < pa1.importe 
					AND DATEDIFF(MONTH, pa2.fecha_de_pago,pa1.fecha_de_pago) = 1 
					WHERE pa1.fecha_de_pago = pa.fecha_de_pago AND pa1.fecha_de_vencimiento = pa.fecha_de_vencimiento
					GROUP BY pa1.fecha_de_pago, pa1.fecha_de_vencimiento),0),
			COUNT(*)           
        FROM BOGO.PAGO_ALQUILER pa
		INNER JOIN Bogo.BI_Tiempo t ON t.anio = YEAR(pa.fecha_de_pago) and t.cuatrimestre = BOGO.OBTENER_CUATRIMESTRE(MONTH(pa.fecha_de_pago)) and t.mes = MONTH(pa.fecha_de_pago) and t.dia = DAY(pa.fecha_de_pago)
		INNER JOIN Bogo.BI_Tiempo ti ON ti.anio = YEAR(pa.fecha_de_vencimiento) and ti.cuatrimestre = BOGO.OBTENER_CUATRIMESTRE(MONTH(pa.fecha_de_vencimiento)) and ti.mes = MONTH(pa.fecha_de_vencimiento) and ti.dia = DAY(pa.fecha_de_vencimiento)
    GROUP BY t.codigo_tiempo, ti.codigo_tiempo, pa.fecha_de_pago, pa.fecha_de_vencimiento
END
GO

Create PROCEDURE BOGO.BI_migrar_hechos_ventas AS
BEGIN
	INSERT INTO BOGO.BI_Hechos_Ventas (tiempo, tipo_inmueble, rangom2, ubicacion, edad, sucursal, ambientes, tipo_moneda, comision, precio_venta_promedio_por_m2,precio_venta_total, cant_ventas_segregadas)
	SELECT	ti.codigo_tiempo, tipo_inmueble.codigo_tipo_inmueble, ra_super.codigo_m2, ubi.codigo_ubicacion, e.id_edad, s.codigo_sucursal, amb.codigo_ambientes,	an.moneda,
			SUM(v.comision_inmobiliaria) AS "Comisión",
			SUM(v.precio_venta) / SUM(inm.superficie) AS "Precio de venta por m2",
			sum(v.precio_venta),
			COUNT(*) AS "Cantidad de ventas segregadas"
	FROM BOGO.venta v
	INNER JOIN BOGO.BI_Tiempo ti ON ti.anio = Year(v.fecha_de_venta) and ti.cuatrimestre = BOGO.OBTENER_CUATRIMESTRE(MONTH(v.fecha_de_venta)) and ti.mes = MONTH(v.fecha_de_venta) and ti.dia = DAY(v.fecha_de_venta)
	INNER JOIN BOGO.Anuncio an ON an.numero_anuncio = v.anuncio
	INNER JOIN BOGO.Inmueble inm ON inm.numero_de_inmueble = an.inmueble
	INNER JOIN BOGO.BI_Tipo_Inmueble tipo_inmueble ON tipo_inmueble.codigo_tipo_inmueble = inm.tipo_inmueble
	INNER JOIN BOGO.BI_rangos_superficie ra_super ON ra_super.codigo_m2 = Bogo.Obtener_ID_Rango(inm.superficie)
	INNER JOIN BOGO.Provincia prov ON prov.codigo_provincia = inm.provincia
	INNER JOIN BOGO.Localidad loc ON loc.codigo_localidad = inm.localidad
	INNER JOIN BOGO.Barrio barr ON barr.codigo_barrio = inm.barrio
	INNER JOIN BOGO.BI_Ubicacion ubi ON ubi.nombre_provincia = prov.nombre and ubi.nombre_localidad = loc.nombre and ubi.nombre_barrio = barr.nombre
	INNER JOIN BOGO.Agente_inmobiliario ag on ag.codigo_agente = an.agente_inmobiliario
	INNER JOIN BOGO.BI_Edad e ON e.id_edad = BOGO.OBTENER_RANGO_EDAD(ag.fecha_nacimiento)
	INNER JOIN BOGO.BI_sucursal s ON s.codigo_sucursal = ag.sucursal
	INNER JOIN BOGO.BI_Ambientes amb ON amb.cantidad = inm.ambientes
	INNER JOIN BOGO.BI_Moneda mon ON an.moneda = mon.codigo_moneda
	GROUP BY ti.codigo_tiempo, tipo_inmueble.codigo_tipo_inmueble, ra_super.codigo_m2, ubi.codigo_ubicacion, e.id_edad, s.codigo_sucursal, amb.codigo_ambientes, an.moneda
END			
GO


---------------------------------------------------------------------------------------------------
--                                            Parte 5                                            --
---------------------------------------------------------------------------------------------------

--  EJECUCIÓN DE LOS PROCEDURES PARA MIGRAR LOS DATOS
EXEC BOGO.BI_migrar_tiempo;
GO
EXEC BOGO.BI_migrar_Edad;
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
EXEC BOGO.BI_migrar_sucursal;
GO
EXEC BOGO.BI_migrar_hechos_anuncios;
GO
EXEC BOGO.BI_migrar_hechos_alquileres;
GO
EXEC BOGO.BI_migrar_hechos_pago_alquileres;
GO
EXEC BOGO.BI_migrar_hechos_ventas;
GO


---------------------------------------------------------------------------------------------------
--                                            Parte 6                                            --
---------------------------------------------------------------------------------------------------

-- CREACIÓN DE LAS VISTAS
-- Vista 1 
CREATE VIEW BOGO.v_duracion_promedio_dias_anuncio AS
	SELECT DISTINCT
			ti.anio AS "Año",
			ti.cuatrimestre AS "N° cuatrimestre",
			tipo_operacion.nombre AS "Tipo operación",
			ubi.nombre_barrio AS "Barrio",
			amb.cantidad AS "Cantidad ambientes",
			SUM(an.duracion_anuncio)/SUM(an.cant_anuncios_segmentados) AS "Duracion promedio en días"
	FROM Bogo.BI_Hechos_Anuncios an
		INNER JOIN BOGO.BI_Tipo_operacion tipo_operacion ON tipo_operacion.codigo_tipo_operacion = an.codigo_tipo_operacion
		INNER JOIN BOGO.BI_Ubicacion ubi ON ubi.codigo_ubicacion = an.codigo_ubicacion
		INNER JOIN BOGO.BI_Ambientes amb ON amb.codigo_ambientes = an.codigo_ambientes
		INNER JOIN Bogo.BI_Tiempo ti ON ti.codigo_tiempo = an.codigo_tiempo
	GROUP BY ti.anio,ti.cuatrimestre, tipo_operacion.nombre, ubi.nombre_barrio, amb.cantidad
GO

-- Vista 2
CREATE VIEW BOGO.v_promedio_precio_anuncio AS
	SELECT  tipo_operacion.nombre AS "Tipo operación",
			tipo_inmueble.nombre AS "Tipo inmueble",
			rs.descipcion_rango AS "Rango superficie",
			tiempo.anio AS "Año",
			tiempo.cuatrimestre AS "N° cuatrimestre",
			m.descripcion AS "Tipo de moneda",
			CAST (SUM(an.precio_promedio_anuncio)/sum(an.cant_anuncios_segmentados)AS DECIMAL(10,2)) AS "Precio promedio"
	FROM Bogo.BI_Hechos_Anuncios an
		INNER JOIN BOGO.BI_Tipo_operacion tipo_operacion ON tipo_operacion.codigo_tipo_operacion = an.codigo_tipo_operacion
		INNER JOIN BOGO.BI_Tipo_Inmueble tipo_inmueble ON tipo_inmueble.codigo_tipo_inmueble = an.codigo_tipo_inmueble
		INNER JOIN BOGO.BI_rangos_superficie rs ON rs.codigo_m2 = an.codigo_rango_superficie
		INNER JOIN BOGO.BI_Tiempo tiempo ON tiempo.codigo_tiempo = an.codigo_tiempo
		INNER JOIN BOGO.BI_Moneda m ON m.codigo_moneda = an.codigo_moneda
	GROUP BY tipo_operacion.nombre, tipo_inmueble.nombre, rs.descipcion_rango, tiempo.anio, tiempo.cuatrimestre, m.descripcion
GO

-- Vista 3
CREATE VIEW BOGO.v_5_barrios_mas_elegidos_rango_etario AS
	SELECT	barrios.anio AS "Año", 
			barrios.cuatrimestre AS "Cuatrimestre", 
			barrios.rango AS "Rango", 
			barrios.nombre_barrio AS "Descripción"
	FROM (SELECT temp.anio, temp.cuatrimestre, ed.rango, u.nombre_barrio,
	ROW_NUMBER() OVER (PARTITION BY temp.anio, temp.cuatrimestre, ed.rango ORDER BY COUNT(alq.codigo_alquiler) DESC) AS Ranking
	FROM Bogo.BI_Hechos_Alquileres alq
	INNER JOIN BOGO.BI_Tiempo temp ON alq.codigo_tiempo = temp.codigo_tiempo
	INNER JOIN BOGO.BI_Edad ed ON alq.codigo_edad_inquilino = ed.id_edad
	INNER JOIN BOGO.BI_Ubicacion u ON u.codigo_ubicacion = alq.codigo_ubicacion
	GROUP BY temp.anio, temp.cuatrimestre, ed.rango, u.nombre_barrio
	) AS barrios 
	WHERE Ranking <= 5
GO 

-- Vista 4
CREATE VIEW BOGO.v_porcentaje_incumplimiento_de_pagos AS
	SELECT	ti.anio, 
			ti.mes, 
			CONVERT(VARCHAR,(SELECT ISNULL(SUM(bhpa1.cant_pagos_Segregados),0) 
							FROM BOGO.BI_Hechos_Pago_alquileres bhpa1
							INNER JOIN BOGO.BI_Tiempo t1 ON t1.codigo_tiempo = bhpa1.fecha_de_pago
							INNER JOIN BOGO.BI_Tiempo ti1 ON ti1.codigo_tiempo = bhpa1.fecha_de_vencimiento
							WHERE DATEFROMPARTS(ti1.anio,ti1.mes, ti1.dia) < DATEFROMPARTS(t1.anio,t1.mes, t1.dia) 
							AND CONCAT(ti1.anio, ti1.mes) = CONCAT(ti.anio, ti.mes))*100 / COUNT(*))+'%' 
			AS "Porcentaje de incumplimiento de pago"
	FROM BOGO.BI_Hechos_Pago_alquileres bhpa
	INNER JOIN BOGO.BI_Tiempo t ON t.codigo_tiempo = bhpa.fecha_de_pago
	INNER JOIN BOGO.BI_Tiempo ti ON ti.codigo_tiempo = bhpa.fecha_de_vencimiento 
	GROUP BY  ti.anio, ti.mes 
GO

-- Vista 5
CREATE VIEW BOGO.v_promedio_de_incremento_del_valor_de_los_alquileres AS
	SELECT	t.anio, t.mes, 
			ISNULL(CAST(((SUM(pa.aumento) / SUM(pa.cant_pagos_Segregados))*100 / 
				(SELECT SUM(pa.cant_pagos_Segregados) 
				 FROM BOGO.BI_Hechos_Pago_alquileres pa2
				 INNER JOIN BOGO.BI_Tiempo t2 ON t2.codigo_tiempo = pa2.fecha_de_pago
				 GROUP BY t2.anio, t2.mes
				 HAVING DATEDIFF(MONTH,DATEFROMPARTS(t2.anio, t2.mes, 1),DATEFROMPARTS(t.anio,t.mes,1)) = 1)) AS numeric(18,2)),0) 
				 AS Porcentaje 
	FROM BOGO.BI_Hechos_Pago_alquileres pa
	INNER JOIN BOGO.BI_Tiempo t ON t.codigo_tiempo = pa.fecha_de_pago
	GROUP BY t.anio, t.mes  
GO

-- Vista 6
CREATE VIEW BOGO.v_precio_promedio_m2_ventas AS
	SELECT t.cuatrimestre, t.anio, u.nombre_localidad, ti.nombre, CONCAT('$ ', CAST(AVG(v.precio_venta_promedio_por_m2) AS DECIMAL(12,2))) AS "Precio promedio m2"
	FROM BOGO.BI_Hechos_Ventas v
	INNER JOIN BOGO.BI_Tiempo t ON t.codigo_tiempo = v.tiempo
	INNER JOIN BOGO.BI_Tipo_Inmueble ti ON ti.codigo_tipo_inmueble = v.tipo_inmueble
	INNER JOIN BOGO.BI_Ubicacion u On u.codigo_ubicacion= v.ubicacion
	GROUP BY t.cuatrimestre, t.anio, u.nombre_localidad, ti.nombre
GO

-- Vista 7
CREATE VIEW BOGO.v_promedio_comision_segun_operacion AS
	SELECT 'Alquiler' AS "Tipo Operacion" ,s.descripcion, t.anio, t.cuatrimestre, CONCAT('$ ', CAST(sum(alq.comision)/sum(alq.cant_alquileres_segregados) AS DECIMAL(12,2))) AS "Promedio comisión"
	FROM BOGO.BI_Hechos_Alquileres alq
	INNER JOIN BOGO.BI_sucursal s ON s.codigo_sucursal = alq.codigo_sucursal
	INNER JOIN BOGO.BI_Tiempo t ON t.codigo_tiempo = alq.codigo_tiempo
	GROUP BY s.descripcion, t.anio, t.cuatrimestre
	UNION 
	SELECT 'Venta' AS "Tipo Operacion",s.descripcion, t.anio, t.cuatrimestre, CONCAT('$ ', CAST(sum(ventas.comision)/sum(ventas.cant_ventas_segregadas) AS DECIMAL(12,2))) AS "Promedio comisión"
	FROM BOGO.BI_Hechos_Ventas ventas
	INNER JOIN BOGO.BI_sucursal s ON s.codigo_sucursal = ventas.sucursal
	INNER JOIN BOGO.BI_Tiempo t ON t.codigo_tiempo = ventas.tiempo
	GROUP BY s.descripcion, t.anio, t.cuatrimestre
GO

 --Vista 8
CREATE VIEW BOGO.v_porcentaje_operaciones_concretadas AS
	SELECT Operacion.anio, Operacion.descripcion, Operacion.rango,
	CONCAT(CAST(SUM(Operacion.Cantidad)*100
				/(SELECT  SUM(an.cant_anuncios_segmentados)
				  FROM BOGO.BI_Hechos_Anuncios an
				  INNER JOIN BOGO.BI_Tiempo ti2 ON (ti2.codigo_tiempo = an.codigo_tiempo)
				  WHERE ti2.anio = Operacion.anio
				  GROUP BY ti2.anio) AS numeric(6,2)),'%') AS "Porcentaje de operaciones concretadas"																																																																						
	FROM (SELECT  ti.anio, su.descripcion, ret.rango, SUM(ven.cant_ventas_segregadas) AS Cantidad
		  FROM BOGO.BI_Hechos_Ventas ven
		  LEFT JOIN BOGO.BI_Tiempo ti ON (ti.codigo_tiempo = ven.tiempo)
		  LEFT JOIN BOGO.BI_Sucursal su ON (su.codigo_sucursal = ven.sucursal)
	      LEFT JOIN Bogo.BI_Edad ret ON (ret.id_edad = ven.edad)
		  GROUP BY ti.anio, su.codigo_sucursal, su.descripcion,	ret.rango
		  UNION 
		  SELECT t.anio AS "Año", s.descripcion AS "Sucursal", e.rango AS "Rango", SUM(a.cant_alquileres_segregados)
		  FROM Bogo.BI_Hechos_Alquileres a
		  INNER JOIN Bogo.BI_sucursal s ON s.codigo_sucursal = a.codigo_sucursal
		  INNER JOIN Bogo.BI_Edad e ON e.id_edad = a.codigo_edad_agente
		  INNER JOIN Bogo.BI_Tiempo t ON t.codigo_tiempo = a.codigo_tiempo
		  GROUP BY t.anio, s.codigo_sucursal, s.descripcion, e.rango
		 ) AS "Operacion"
	GROUP BY Operacion.anio,Operacion.descripcion,Operacion.rango
GO

-- Vista 9
CREATE VIEW BOGO.v_monto_total_cierre_contratos_por_operacion AS
	SELECT 'Alquiler' AS "Tipo Operacion", s.descripcion AS "Sucursal", t.cuatrimestre, m.descripcion AS "Tipo de moneda", CONCAT('$ ', CAST(SUM(alq.deposito) AS Numeric(18,2))) AS "Monto total"
	FROM BOGO.BI_Hechos_Alquileres alq
	INNER JOIN BOGO.BI_sucursal s ON s.codigo_sucursal = alq.codigo_sucursal
	INNER JOIN BOGO.BI_Tiempo t ON t.codigo_tiempo = alq.codigo_tiempo
	INNER JOIN BOGO.BI_Moneda m ON m.codigo_moneda = alq.codigo_moneda
	GROUP BY s.descripcion, t.cuatrimestre, m.descripcion
	UNION 
	SELECT 'Venta' as "Tipo Operacion", s.descripcion AS "Sucursal", t.cuatrimestre, m.descripcion AS "Tipo de moneda", CONCAT('$ ', CAST(SUM(v.precio_venta_total) AS Numeric(18,2))) AS "Monto total"
	FROM BOGO.BI_Hechos_Ventas v
	INNER JOIN BOGO.BI_sucursal s ON s.codigo_sucursal = v.sucursal
	INNER JOIN BOGO.BI_Tiempo t ON t.codigo_tiempo = v.tiempo
	INNER JOIN BOGO.BI_Moneda m ON m.codigo_moneda = v.tipo_moneda
	GROUP BY s.descripcion, t.cuatrimestre, m.descripcion
GO