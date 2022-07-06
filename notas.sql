DROP DATABASE IF EXISTS notepad_db;
CREATE DATABASE notepad_db;
USE notepad_db;

DROP TABLE IF EXISTS nota;
CREATE TABLE nota(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100) NOT NULL,
	creacion DATETIME NOT NULL,
	ultima_modificacion DATETIME,
	descripcion TEXT,
	flag_delete TINYINT  DEFAULT(0) NOT NULL
	
);

DROP TABLE IF EXISTS  usuario;
CREATE TABLE usuario(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	nota_id INT UNSIGNED NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	email VARCHAR(20) UNIQUE NOT NULL,
	FOREIGN KEY (nota_id) REFERENCES nota(id)
);

DROP TABLE IF EXISTS  categoria;
CREATE TABLE categoria (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	categorias VARCHAR(50) UNIQUE NOT NULL
);

DROP TABLE IF EXISTS  nota_categoria;
CREATE TABLE nota_categoria(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	nota_id INT UNSIGNED NOT NULL,
	categoria_id INT UNSIGNED,
	FOREIGN KEY(nota_id) REFERENCES nota(id),
	FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);

INSERT INTO nota
VALUES
	(DEFAULT, 'primera nota', NOW(), NULL, 'No se porque',0),
	(DEFAULT, 'Segunda nota', NOW(), NOW(), 'estuve tan distrído',1),
	(DEFAULT, 'tercer nota', NOW(), null, 'que pense que este entregable',0),
	(DEFAULT, 'cuarta nota', NOW(), NOW(), 'eran los ejercicios que vimos en clase.',0),
	(DEFAULT, 'quinta nota', NOW(), NULL, 'Por suerte es una pavada, aunque esta re bueno hacerlo.',1),
	(DEFAULT, '6 nota', NOW(), NULL, 'No se porque',0),
	(DEFAULT, 'Esta es una nota vacía', NOW(), NOW(), NULL,1),
	(DEFAULT, '8 nota', NOW(), NULL, 'que pense que este entregable',0),
	(DEFAULT, '9 nota', NOW(), NOW(), 'eran los ejercicios que vimos en clase.',1),
	(DEFAULT, 'DECIMA nota', NOW(), NULL, 'Por suerte es una pavada, aunque esta re bueno hacerlo.',0);

INSERT INTO usuario
VALUES
	(DEFAULT, 1, 'Luko G', 'prueba@test.com1'),
	(DEFAULT, 10, 'Gregory House', 'prueba@test.com2'),
	(DEFAULT, 2, 'Pinocho', 'prueba@test.com3'),
	(DEFAULT, 9, 'Bruce Wayne', 'prueba@test.com4'),
	(DEFAULT, 3, 'Bruno Díaz', 'prueba@test.com5'),
	(DEFAULT, 8, 'Clark Kent', 'prueba@test.com6'),
	(DEFAULT, 4, 'Max Powers', 'prueba@test.com7'),
	(DEFAULT, 7, 'Baruch de Spinoza', 'prueba@test.com8'),
	(DEFAULT, 5, 'Immanuel Kant', 'prueba@test.com9'),
	(DEFAULT, 6, 'Gilles Deleuze', 'prueba@test.com10');


INSERT INTO categoria
VALUES
	(DEFAULT, 'Lista de compras'),
	(DEFAULT, 'Fechas de vencimiento'),
	(DEFAULT, 'Turnos médicos'),
	(DEFAULT, 'Datos de cuentas'),
	(DEFAULT, 'Ideas de monografías'),
	(DEFAULT, 'Lista de tareas'),
	(DEFAULT, 'Poesía'),
	(DEFAULT, 'Letras o tablaturas de música'),
	(DEFAULT, 'Películas recomendadas'),
	(DEFAULT, 'Contactos');

INSERT INTO nota_categoria
VALUES
	(DEFAULT,1,NULL),
	(DEFAULT, 2, 5),
	(DEFAULT, 2,8),
	(DEFAULT, 4, NULL),
	(DEFAULT, 5, 1),
	(DEFAULT, 5, 7),
	(DEFAULT, 7, 3),
	(DEFAULT, 8, 9),
	(DEFAULT, 9, 10),
	(DEFAULT, 10, NULL);