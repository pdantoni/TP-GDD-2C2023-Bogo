USE [GD2C2023]

Select * from Bogo.BI_Alquiler

-- PARTE 1: borrado de tablas, funciones, procedures y vistas
-- PARTE 2: creación de tablas de dimensiones, hechos y fk
-- PARTE 3: creación de funciones
-- PARTE 4: creación de procedures
-- PARTE 5: ejecución de los procedures para migrar los datos
-- PARTE 6: creación de las vistas

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
IF OBJECT_ID('BOGO.BI_estado_inmueble', 'U') IS NOT NULL DROP TABLE BOGO.BI_estado_inmueble
IF OBJECT_ID('BOGO.BI_localidad', 'U') IS NOT NULL DROP TABLE BOGO.BI_localidad
IF OBJECT_ID('BOGO.BI_operaciones', 'U') IS NOT NULL DROP TABLE BOGO.BI_operaciones
IF OBJECT_ID('BOGO.BI_Agente_inmobiliario', 'U') IS NOT NULL DROP TABLE BOGO.BI_Agente_inmobiliario
IF OBJECT_ID('BOGO.BI_Sucursal', 'U') IS NOT NULL DROP TABLE BOGO.BI_Sucursal

-- BORRADO DE FUNCIONES
IF OBJECT_ID('BOGO.OBTENER_ID_RANGO') IS NOT NULL DROP FUNCTION BOGO.OBTENER_ID_RANGO
IF OBJECT_ID('BOGO.OBTENER_RANGO_EDAD') IS NOT NULL DROP FUNCTION BOGO.OBTENER_RANGO_EDAD
IF OBJECT_ID('BOGO.OBTENER_CUATRIMESTRE') IS NOT NULL DROP FUNCTION BOGO.OBTENER_CUATRIMESTRE
IF OBJECT_ID('BOGO.OBTENER_ID_SUCURSAL') IS NOT NULL DROP FUNCTION BOGO.OBTENER_ID_SUCURSAL
IF OBJECT_ID('BOGO.OBTENER_TOTAL_ALQUILER') IS NOT NULL DROP FUNCTION BOGO.OBTENER_TOTAL_ALQUILER
IF OBJECT_ID('BOGO.OBTENER_ID_TIEMPO') IS NOT NULL DROP FUNCTION BOGO.OBTENER_ID_TIEMPO

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
IF OBJECT_ID('BOGO.BI_migrar_sucursal') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_sucursal
IF OBJECT_ID('BOGO.BI_migrar_Agente_inmobiliario') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_Agente_inmobiliario
IF OBJECT_ID('BOGO.BI_migrar_operaciones') IS NOT NULL DROP PROCEDURE BOGO.BI_migrar_operaciones

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

CREATE TABLE BOGO.BI_Anuncios(
	codigo_tiempo int,
	codigo_tipo_operacion INT,
	codigo_tipo_inmueble INT,
	codigo_moneda INT,
	codigo_rango_superficie INT, 
	codigo_ambientes INT, 
	codigo_ubicacion INT,
	duracion_anuncio INT,
	precio_promedio_anuncio DECIMAL(12,2),
	cant_anuncios_segmentados INT
	Primary key(codigo_tiempo,codigo_tipo_operacion,codigo_tipo_inmueble,codigo_moneda,codigo_rango_superficie,codigo_ambientes,codigo_ubicacion)
)

CREATE TABLE BOGO.BI_Alquiler(
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

CREATE TABLE BOGO.BI_Venta(
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
	precio_venta INT, 
	cant_ventas_segregadas INT
)

CREATE TABLE BOGO.BI_pago_alquiler(
	codigo_pago_alquiler INT PRIMARY KEY IDENTITY(1,1), 
    fecha_de_pago int,
	fecha_de_vencimiento int,
    aumento FLOAT,
	cant_pagos_Segregados INT
)

-------------------------------------------------------
-- CREACION DE PKs COMPUESTAS
ALTER TABLE BOGO.BI_Alquiler
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

ALTER TABLE BOGO.BI_Anuncios
	ADD FOREIGN KEY (codigo_tipo_operacion) REFERENCES BOGO.BI_Tipo_operacion(codigo_tipo_operacion), 
		FOREIGN KEY (codigo_tipo_inmueble) REFERENCES BOGO.BI_Tipo_Inmueble(codigo_tipo_inmueble),
		FOREIGN KEY (codigo_moneda) REFERENCES BOGO.BI_Moneda(codigo_moneda),
		FOREIGN KEY (codigo_rango_superficie) REFERENCES BOGO.BI_rangos_superficie(codigo_m2),
		FOREIGN KEY (codigo_ambientes) REFERENCES BOGO.BI_Ambientes(codigo_ambientes),
		FOREIGN KEY (codigo_ubicacion) REFERENCES BOGO.BI_Ubicacion(codigo_ubicacion),
		FOREIGN KEY (codigo_tiempo) REFERENCES BOGO.BI_Tiempo(codigo_tiempo)
GO

ALTER TABLE BOGO.BI_pago_alquiler
	ADD FOREIGN KEY (fecha_de_pago) REFERENCES BOGO.BI_Tiempo(codigo_tiempo),
		FOREIGN KEY (fecha_de_vencimiento) REFERENCES BOGO.BI_Tiempo(codigo_tiempo)
GO

ALTER TABLE BOGO.BI_venta
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

--  CREACION DE PROCEDURES 
CREATE PROCEDURE BOGO.BI_migrar_tiempo AS
BEGIN
    INSERT INTO BOGO.BI_tiempo (anio, cuatrimestre, mes)
		SELECT DISTINCT YEAR(A.fecha_de_inicio) as "Anio", BOGO.OBTENER_CUATRIMESTRE(MONTH(A.fecha_de_inicio)) as "Cuatrimestre", MONTH(A.fecha_de_inicio) as "Mes" FROM BOGO.Alquiler A
	UNION
		SELECT DISTINCT YEAR(A.fecha_de_fin) as "Anio", BOGO.OBTENER_CUATRIMESTRE(MONTH(A.fecha_de_fin)) as "Cuatrimestre", MONTH(A.fecha_de_fin) as "Mes" FROM BOGO.Alquiler A
	UNION
		SELECT DISTINCT YEAR(AN.fecha_publicacion) as "Anio", BOGO.OBTENER_CUATRIMESTRE(MONTH(AN.fecha_publicacion)) as "Cuatrimestre", MONTH(AN.fecha_publicacion) as "Mes"FROM BOGO.Anuncio AN
	UNION
		SELECT DISTINCT YEAR(AN.fecha_finalizacion) as "Anio", BOGO.OBTENER_CUATRIMESTRE(MONTH(AN.fecha_finalizacion)) as "Cuatrimestre", MONTH(AN.fecha_finalizacion) as "Mes" FROM BOGO.Anuncio AN
	UNION
		SELECT DISTINCT YEAR(v.fecha_de_venta) as "Anio", BOGO.OBTENER_CUATRIMESTRE(MONTH(v.fecha_de_venta)) as "Cuatrimestre", MONTH(v.fecha_de_venta) as "Mes" FROM BOGO.venta v
	UNION	
		SELECT DISTINCT YEAR(pg.fecha_de_pago) as "Anio", BOGO.OBTENER_CUATRIMESTRE(MONTH(pg.fecha_de_pago)) as "Cuatrimestre", MONTH(pg.fecha_de_pago) as "Mes" FROM BOGO.Pago_alquiler pg
	UNION
		SELECT DISTINCT YEAR(pg.fecha_de_vencimiento) as "Anio", BOGO.OBTENER_CUATRIMESTRE(MONTH(pg.fecha_de_vencimiento)) as "Cuatrimestre", MONTH(pg.fecha_de_vencimiento) as "Mes" FROM BOGO.Pago_alquiler pg
	ORDER BY anio ASC, cuatrimestre ASC, mes ASC
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
-- PROCEDURES PARA TABLAS DE HECHOS
-- Tabla hechos anuncio ok
ALTER PROCEDURE BOGO.BI_migrar_anuncios AS
BEGIN
	INSERT INTO BOGO.BI_Anuncios(codigo_tiempo,codigo_tipo_inmueble ,codigo_moneda, codigo_ambientes, codigo_tipo_operacion, codigo_rango_superficie, codigo_ubicacion,duracion_anuncio, precio_promedio_anuncio, cant_anuncios_segmentados) 
	Select distinct codigo_tiempo,
	tipo_inmueble.codigo_tipo_inmueble,
	mon.codigo_moneda,
	amb.codigo_ambientes,
	tipo_operacion.codigo_tipo_operacion,
	ra_super.codigo_m2,
	ubi.codigo_ubicacion,
	sum(Datediff(Day,a.fecha_publicacion,a.fecha_finalizacion)) as "Duracion Promedio",
	sum(a.precio_inmueble),
	count(a.numero_anuncio)
	From Bogo.Anuncio a
	INNER JOIN Bogo.BI_Tiempo ti on ti.anio = Year(a.fecha_publicacion) and ti.cuatrimestre = Bogo.OBTENER_CUATRIMESTRE(Month(a.fecha_publicacion))
	INNER JOIN BOGO.BI_Moneda mon on a.moneda = mon.codigo_moneda
	INNER JOIN BOGO.Inmueble inm on a.inmueble = inm.numero_de_inmueble
	INNER JOIN BOGO.BI_Tipo_Inmueble tipo_inmueble on tipo_inmueble.codigo_tipo_inmueble = inm.tipo_inmueble
    INNER JOIN BOGO.BI_Ambientes amb on amb.cantidad = inm.ambientes
	INNER JOIN Bogo.BI_Tipo_operacion tipo_operacion on tipo_operacion.codigo_tipo_operacion = a.tipo_operacion
	INNER JOIN BOGO.Provincia prov on prov.codigo_provincia = inm.provincia
	INNER JOIN BOGO.Localidad loc on loc.codigo_localidad = inm.localidad
	INNER JOIN BOGO.Barrio barr on barr.codigo_barrio = inm.barrio
	INNER JOIN BOGO.BI_Ubicacion ubi on ubi.nombre_provincia = prov.nombre and ubi.nombre_localidad = loc.nombre and ubi.nombre_barrio = barr.nombre
	INNER JOIN BOGO.BI_rangos_superficie ra_super on ra_super.codigo_m2 = Bogo.Obtener_ID_Rango(inm.superficie)
	group by
	ti.codigo_tiempo,
	mon.codigo_moneda,
	ubi.codigo_ubicacion,
	tipo_inmueble.codigo_tipo_inmueble,
	amb.codigo_ambientes,
	tipo_operacion.codigo_tipo_operacion,
	ra_super.codigo_m2
end
GO


/*

CREATE PROCEDURE BOGO.BI_migrar_alquiler AS
BEGIN
	INSERT INTO BOGO.BI_Alquiler(codigo_tiempo, codigo_tipo_inmueble, codigo_rangom2, codigo_ubicacion, codigo_edad_inquilino, codigo_edad_agente, codigo_sucursal, codigo_ambiente, codigo_moneda, comision, deposito, cant_alquileres_segregados)
	SELECT	(SELECT t.codigo_tiempo FROM BOGO.BI_Tiempo t WHERE t.anio = YEAR(a.fecha_de_fin) AND t.mes = MONTH(a.fecha_de_fin) AND t.cuatrimestre = BOGO.OBTENER_CUATRIMESTRE(MONTH(a.fecha_de_fin))),
			(SELECT ti.codigo_tipo_inmueble FROM BOGO.BI_Tipo_Inmueble ti WHERE ti.codigo_tipo_inmueble = tipo_inmueble.codigo_tipo_inmueble),
			(SELECT rs.codigo_m2 FROM BOGO.BI_rangos_superficie rs WHERE rs.codigo_m2 = BOGO.OBTENER_ID_RANGO(inm.superficie)),
			(SELECT u.codigo_ubicacion FROM BOGO.BI_Ubicacion u WHERE u.nombre_provincia = prov.nombre AND u.nombre_localidad = loc.nombre AND u.nombre_barrio = barr.nombre),
			(SELECT rei.id_edad FROM BOGO.BI_Edad rei WHERE rei.id_edad = BOGO.OBTENER_RANGO_EDAD(i.fecha_nacimiento)),
			(SELECT rea.id_edad FROM BOGO.BI_Edad rea WHERE rea.id_edad = BOGO.OBTENER_RANGO_EDAD(ag.fecha_nacimiento)),
			(SELECT su.codigo_sucursal FROM BOGO.BI_Sucursal su WHERE su.codigo_sucursal = s.codigo_sucursal),
			(SELECT am.codigo_ambientes FROM BOGO.BI_Ambientes am WHERE am.cantidad = amb.cantidad),
			(SELECT m.codigo_moneda FROM BOGO.BI_Moneda m WHERE m.codigo_moneda = mon.codigo_moneda),
			SUM(a.comision),
			SUM(a.deposito),
			COUNT(*)
	FROM BOGO.Alquiler a
	INNER JOIN BOGO.BI_Tiempo ti ON ti.anio = Year(a.fecha_de_inicio) and ti.cuatrimestre = BOGO.OBTENER_CUATRIMESTRE(MONTH(a.fecha_de_inicio)) and ti.mes = MONTH(a.fecha_de_inicio)
	INNER JOIN BOGO.Anuncio an ON an.numero_anuncio = a.anuncio
	INNER JOIN BOGO.Inmueble inm ON inm.numero_de_inmueble = an.inmueble
	INNER JOIN BOGO.BI_Tipo_Inmueble tipo_inmueble on tipo_inmueble.codigo_tipo_inmueble = inm.tipo_inmueble
	INNER JOIN BOGO.BI_rangos_superficie ra_super on ra_super.codigo_m2 = Bogo.Obtener_ID_Rango(inm.superficie)
	INNER JOIN BOGO.Provincia prov on prov.codigo_provincia = inm.provincia
	INNER JOIN BOGO.Localidad loc on loc.codigo_localidad = inm.localidad
	INNER JOIN BOGO.Barrio barr on barr.codigo_barrio = inm.barrio
	INNER JOIN BOGO.BI_Ubicacion ubi on ubi.nombre_provincia = prov.nombre and ubi.nombre_localidad = loc.nombre and ubi.nombre_barrio = barr.nombre
	INNER JOIN BOGO.Inquilino i ON i.codigo_inquilino = a.inquilino
	INNER JOIN BOGO.BI_Edad e ON e.id_edad = BOGO.OBTENER_RANGO_EDAD(i.fecha_nacimiento)
	INNER JOIN BOGO.Agente_inmobiliario ag on ag.codigo_agente = an.agente_inmobiliario
	INNER JOIN BOGO.BI_Edad e2 ON e.id_edad = BOGO.OBTENER_RANGO_EDAD(ag.fecha_nacimiento)
	INNER JOIN BOGO.BI_sucursal s ON s.codigo_sucursal = ag.sucursal
	INNER JOIN BOGO.BI_Ambientes amb on amb.cantidad = inm.ambientes
	INNER JOIN BOGO.BI_Moneda mon on an.moneda = mon.codigo_moneda
	GROUP BY a.fecha_de_fin, tipo_inmueble.codigo_tipo_inmueble, BOGO.OBTENER_ID_RANGO(inm.superficie), barr.nombre, loc.nombre, prov.nombre, BOGO.OBTENER_RANGO_EDAD(i.fecha_nacimiento), BOGO.OBTENER_RANGO_EDAD(ag.fecha_nacimiento), s.codigo_sucursal, amb.cantidad, mon.codigo_moneda
END	
GO

CREATE PROCEDURE BOGO.BI_migrar_pago_alquiler AS
BEGIN
	INSERT INTO BOGO.BI_pago_alquiler (fecha_de_pago, fecha_de_vencimiento, aumento, cant_pagos_Segregados)
	SELECT	(SELECT t.codigo_tiempo FROM BOGO.BI_Tiempo t WHERE t.anio = YEAR(pa.fecha_de_pago) AND t.mes = MONTH(pa.fecha_de_pago) AND t.cuatrimestre = BOGO.OBTENER_CUATRIMESTRE(MONTH(pa.fecha_de_pago))),
			(SELECT t.codigo_tiempo FROM BOGO.BI_Tiempo t WHERE t.anio = YEAR(pa.fecha_de_vencimiento) AND t.mes = MONTH(pa.fecha_de_vencimiento) AND t.cuatrimestre = BOGO.OBTENER_CUATRIMESTRE(MONTH(pa.fecha_de_vencimiento))),
			ISNULL((SELECT SUM(pa1.importe-pa2.importe)
					FROM BOGO.PAGO_ALQUILER pa1 INNER JOIN BOGO.PAGO_ALQUILER pa2 
					ON pa2.alquiler = pa1.alquiler 
					AND pa2.importe < pa1.importe 
					AND DATEDIFF(MONTH,pa2.fecha_de_pago,pa1.fecha_de_pago) = 1 WHERE pa1.fecha_de_pago = pa.fecha_de_pago 
					AND pa1.fecha_de_vencimiento = pa.fecha_de_vencimiento),0),
        COUNT(*)           
        FROM BOGO.PAGO_ALQUILER pa
    GROUP BY pa.fecha_de_pago, pa.fecha_de_vencimiento
END
GO

CREATE PROCEDURE BOGO.BI_migrar_venta AS
BEGIN
	INSERT INTO BOGO.BI_venta (tiempo, tipo_inmueble, rangom2, ubicacion, edad, sucursal, ambientes, tipo_moneda, comision, precio_venta, cant_ventas_segregadas)
	SELECT	(SELECT t.codigo_tiempo FROM BOGO.BI_Tiempo t WHERE t.anio = YEAR(v.fecha_de_venta) AND t.mes = MONTH(v.fecha_de_venta) AND t.cuatrimestre = BOGO.OBTENER_CUATRIMESTRE(MONTH(v.fecha_de_venta))),
			(SELECT ti.codigo_tipo_inmueble FROM BOGO.BI_Tipo_Inmueble ti WHERE ti.codigo_tipo_inmueble = tipo_inmueble.codigo_tipo_inmueble),
			(SELECT rs.codigo_m2 FROM BOGO.BI_rangos_superficie rs WHERE rs.codigo_m2 = BOGO.OBTENER_ID_RANGO(inm.superficie)),
			(SELECT u.codigo_ubicacion FROM BOGO.BI_Ubicacion u WHERE u.nombre_provincia = prov.nombre AND u.nombre_localidad = loc.nombre AND u.nombre_barrio = barr.nombre),
			(SELECT rea.id_edad FROM BOGO.BI_Edad rea WHERE rea.id_edad = BOGO.OBTENER_RANGO_EDAD(ag.fecha_nacimiento)),
			(SELECT su.codigo_sucursal FROM BOGO.BI_Sucursal su WHERE su.codigo_sucursal = s.codigo_sucursal),
			(SELECT am.codigo_ambientes FROM BOGO.BI_Ambientes am WHERE am.cantidad = amb.cantidad),
			(SELECT m.codigo_moneda FROM BOGO.BI_Moneda m WHERE m.codigo_moneda = mon.codigo_moneda),
			SUM(v.comision_inmobiliaria),
			SUM(v.precio_venta),
			COUNT(*)
	FROM BOGO.venta v
	INNER JOIN BOGO.BI_Tiempo ti ON ti.anio = Year(v.fecha_de_venta) and ti.cuatrimestre = BOGO.OBTENER_CUATRIMESTRE(MONTH(v.fecha_de_venta)) and ti.mes = MONTH(v.fecha_de_venta)
	INNER JOIN BOGO.Anuncio an ON an.numero_anuncio = v.anuncio
	INNER JOIN BOGO.Inmueble inm ON inm.numero_de_inmueble = an.inmueble
	INNER JOIN BOGO.BI_Tipo_Inmueble tipo_inmueble on tipo_inmueble.codigo_tipo_inmueble = inm.tipo_inmueble
	INNER JOIN BOGO.BI_rangos_superficie ra_super on ra_super.codigo_m2 = Bogo.Obtener_ID_Rango(inm.superficie)
	INNER JOIN BOGO.Provincia prov on prov.codigo_provincia = inm.provincia
	INNER JOIN BOGO.Localidad loc on loc.codigo_localidad = inm.localidad
	INNER JOIN BOGO.Barrio barr on barr.codigo_barrio = inm.barrio
	INNER JOIN BOGO.BI_Ubicacion ubi on ubi.nombre_provincia = prov.nombre and ubi.nombre_localidad = loc.nombre and ubi.nombre_barrio = barr.nombre
	INNER JOIN BOGO.Agente_inmobiliario ag on ag.codigo_agente = an.agente_inmobiliario
	INNER JOIN BOGO.BI_Edad e ON e.id_edad = BOGO.OBTENER_RANGO_EDAD(ag.fecha_nacimiento)
	INNER JOIN BOGO.BI_sucursal s ON s.codigo_sucursal = ag.sucursal
	INNER JOIN BOGO.BI_Ambientes amb on amb.cantidad = inm.ambientes
	INNER JOIN BOGO.BI_Moneda mon on an.moneda = mon.codigo_moneda
	GROUP BY v.fecha_de_venta, tipo_inmueble.codigo_tipo_inmueble, BOGO.OBTENER_ID_RANGO(inm.superficie), barr.nombre, loc.nombre, prov.nombre, BOGO.OBTENER_RANGO_EDAD(ag.fecha_nacimiento), s.codigo_sucursal, amb.cantidad, mon.codigo_moneda
END			
GO		

*/
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
EXEC BOGO.BI_migrar_Edad;
GO
EXEC BOGO.BI_migrar_sucursal;
GO
EXEC BOGO.BI_migrar_anuncios;
GO
/*
EXEC BOGO.BI_migrar_alquiler;
GO
EXEC BOGO.BI_migrar_pago_alquiler;
GO
EXEC BOGO.BI_migrar_venta;
GO
*/

Delete from Bogo.BI_Anuncios

Select * from Bogo.BI_Anuncios


---------------------------------------------------------------------------------------------------
--                                            Parte 6                                            --
---------------------------------------------------------------------------------------------------

-- CREACIÓN DE LAS VISTAS
-- Vista 1 

CREATE VIEW BOGO.v_duracion_promedio_dias_anuncio AS
	SELECT Distinct
			ti.anio as "Año",
			ti.cuatrimestre as "N° cuatrimestre",
			tipo_operacion.nombre as "Tipo operación",
			ubi.nombre_barrio as "Barrio",
			amb.cantidad as "Cantidad ambientes",
			 sum(an.duracion_anuncio)/sum(an.cant_anuncios_segmentados)
	FROM Bogo.BI_Anuncios an
		LEFT JOIN BOGO.BI_Tipo_operacion tipo_operacion ON tipo_operacion.codigo_tipo_operacion = an.codigo_tipo_operacion
		LEFT JOIN BOGO.BI_Ubicacion ubi ON ubi.codigo_ubicacion = an.codigo_ubicacion
		LEFT JOIN BOGO.BI_Ambientes amb ON amb.codigo_ambientes = an.codigo_ambientes
		LEFT JOIN Bogo.BI_Tiempo ti on ti.codigo_tiempo = an.codigo_tiempo
	GROUP BY ti.anio,ti.cuatrimestre, tipo_operacion.nombre, ubi.nombre_barrio, amb.cantidad
GO


Select * from BOGO.v_duracion_promedio_dias_anuncio


/*
-- Vista 2
CREATE VIEW BOGO.v_promedio_precio_anuncio AS
	SELECT  tipo_operacion.nombre as "Tipo operación",
			tipo_inmueble.nombre as "Tipo inmueble",
			rs.descipcion_rango as "Rango superficie",
			tiempo.anio as "Año",
			tiempo.cuatrimestre as "N° cuatrimestre",
			m.descripcion as "Tipo de moneda",
			CAST (SUM(an.precio_anuncio)/COUNT(an.codigo_anuncio) AS DECIMAL(10,2)) AS "Precio promedio"
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

Select * from Bogo.BI_Anuncios

/*CREATE VIEW GUISO_DE_LENTEJAS.BI_PRECIO_PROMEDIO_PUBLICACION_ANUNCIO AS
    SELECT  tiop.TIPO_OPERACION_DESCRIPCION, 
		tiim.TIPO_INMUEBLE_DESCRIPCION, 
		rm2.RANGO_M2_DESCRIPCION, 
		ti.TIEMPO_ANIO, 
		ti.TIEMPO_CUATRIMESTRE, 
		timo.TIPO_MONEDA_DESCRIPCION,
		CAST(SUM(an.ANUNCIO_PRECIO) / SUM(an.ANUNCIO_CANT_ANUNCIOS_AGRUPADOS) AS numeric(18,2)) AS 'Precio Promedio Publicacion'
		FROM GUISO_DE_LENTEJAS.BI_Hecho_Anuncio an
		JOIN GUISO_DE_LENTEJAS.BI_Tipo_Operacion tiop ON (tiop.TIPO_OPERACION_ID = an.ANUNCIO_TIPO_OPERACION)
		JOIN GUISO_DE_LENTEJAS.BI_Tipo_Inmueble tiim ON (tiim.TIPO_INMUEBLE_ID = an.ANUNCIO_TIPO_INMUEBLE)
		JOIN GUISO_DE_LENTEJAS.BI_Rango_M2 rm2 ON (rm2.RANGO_M2_CODIGO = an.ANUNCIO_RANGO_M2)
        JOIN GUISO_DE_LENTEJAS.BI_Tiempo ti ON (ti.TIEMPO_CODIGO = an.ANUNCIO_TIEMPO_INICIO)
        JOIN GUISO_DE_LENTEJAS.BI_Tipo_Moneda timo ON (timo.TIPO_MONEDA_ID = an.ANUNCIO_TIPO_MONEDA)
		GROUP BY tiop.TIPO_OPERACION_DESCRIPCION, tiim.TIPO_INMUEBLE_DESCRIPCION, rm2.RANGO_M2_DESCRIPCION, ti.TIEMPO_ANIO, ti.TIEMPO_CUATRIMESTRE, timo.TIPO_MONEDA_DESCRIPCION
GO */

-- Vista 3
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

-- Vista 4
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

-- Vista 5
CREATE VIEW BOGO.v_promedio_de_incremento_del_valor_de_los_alquileres AS
    SELECT  MONTH(pg.fecha_de_pago) AS "Mes", 
		   YEAR(pg.fecha_de_pago) AS "Año",
		   CONCAT(CAST(AVG(((pg.importe - anterior.importe)/anterior.importe)*100) AS DECIMAL(12,2)), ' %') AS "Promedio de incremento del importe"
    FROM BOGO.BI_pago_alquiler pg
	
	LEFT JOIN BOGO.BI_pago_alquiler anterior ON bogo.OBTENER_ID_TIEMPO(anterior.fecha_de_pago) = bogo.OBTENER_ID_TIEMPO(pg.fecha_de_pago) - 1
	--INNER JOIN BOGO.BI_Tiempo t2 ON t2.codigo_tiempo = anterior.codigo_tiempo
    LEFT JOIN BOGO.BI_Alquiler alq ON alq.codigo_alquiler = pg.alquiler and alq.codigo_alquiler = anterior.alquiler AND MONTH(alq.fecha_de_inicio) <= MONTH(anterior.fecha_de_pago)
    LEFT JOIN BOGO.BI_estado_Alquiler ealq ON ealq.estado_alquiler = alq.estado_alquiler
    WHERE pg.importe > anterior.importe AND ealq.estado_alquiler = 3 -- 'Activo'
    GROUP BY MONTH(pg.fecha_de_pago), YEAR(pg.fecha_de_pago)
GO

-- Vista 6
CREATE VIEW BOGO.v_precio_promedio_m2_ventas AS
	SELECT t.cuatrimestre, t.anio, l.descripcion, ti.nombre, CONCAT('$ ', CAST(AVG(v.precio_m2) AS DECIMAL(12,2))) AS "Precio promedio m2"
	FROM BOGO.BI_Venta v
	INNER JOIN BOGO.BI_Tiempo t ON t.codigo_tiempo = v.codigo_tiempo
	INNER JOIN BOGO.BI_Tipo_Inmueble ti ON ti.codigo_tipo_inmueble = v.codigo_estado_inmueble
	INNER JOIN BOGO.BI_Localidad  l On l.cod_localidad = v.codigo_localidad
	GROUP BY t.cuatrimestre, t.anio, l.descripcion, ti.nombre
GO

-- Vista 7
CREATE VIEW BOGO.v_promedio_comision_segun_operacion AS
	SELECT tip.nombre, s.descripcion, t.anio, t.cuatrimestre, CONCAT('$ ', CAST(AVG(op.comision) AS DECIMAL(12,2))) AS "Promedio comisión"
	FROM BOGO.BI_operaciones op
	INNER JOIN BOGO.BI_Tipo_operacion tip ON tip.codigo_tipo_operacion = op.codigo_tipo_operacion
	INNER JOIN BOGO.BI_sucursal s ON s.codigo_sucursal = op.codigo_sucursal
	INNER JOIN BOGO.BI_Tiempo t ON t.codigo_tiempo = op.codigo_tiempo
	GROUP BY tip.nombre, s.descripcion, t.anio, t.cuatrimestre
GO

-- Vista 8CREATE VIEW BOGO.v_porcentaje_operaciones_concretadas
AS
    SELECT t.anio AS "Año",
    s.descripcion AS "Sucursal",
    e.rango AS "Rango",
    CONCAT(COUNT(DISTINCT op.codigo_anuncio) * 100/
    (SELECT COUNT(DISTINCT a.numero_anuncio) FROM Bogo.Anuncio a
    INNER JOIN Bogo.Agente_inmobiliario ai ON ai.codigo_agente = a.agente_inmobiliario
    INNER JOIN Bogo.Sucursal su ON su.codigo_sucursal = ai.sucursal
    WHERE su.codigo_sucursal = s.codigo_sucursal and e.id_edad = Bogo.OBTENER_RANGO_EDAD(ai.fecha_nacimiento) AND YEAR(a.fecha_publicacion) = t.anio),'%') AS "Porcentaje de Operaciones Concretadas"
    FROM Bogo.BI_operaciones op
    INNER JOIN Bogo.BI_sucursal s ON s.codigo_sucursal = op.codigo_sucursal
    INNER JOIN Bogo.BI_Edad e ON e.id_edad = op.codigo_edad
    INNER JOIN Bogo.BI_Tiempo t ON t.codigo_tiempo = op.codigo_tiempo
    GROUP BY t.anio,s.codigo_sucursal,s.descripcion,e.id_edad,e.rango
GO

-- Vista 9
CREATE VIEW BOGO.v_monto_total_cierre_contratos_por_operacion AS
	SELECT tip.nombre, s.descripcion AS "Sucursal", t.cuatrimestre, m.descripcion AS "Tipo de moneda", CONCAT('$ ', CAST(SUM(op.monto_total) AS FLOAT)) AS "Monto total"
	FROM BOGO.BI_operaciones op
	INNER JOIN BOGO.BI_Tipo_operacion tip ON tip.codigo_tipo_operacion = op.codigo_tipo_operacion
	INNER JOIN BOGO.BI_sucursal s ON s.codigo_sucursal = op.codigo_sucursal
	INNER JOIN BOGO.BI_Tiempo t ON t.codigo_tiempo = op.codigo_tiempo
	INNER JOIN BOGO.BI_Moneda m ON m.codigo_moneda = op.codigo_moneda
	GROUP BY tip.nombre, s.descripcion, t.cuatrimestre, m.descripcion
GO
*/