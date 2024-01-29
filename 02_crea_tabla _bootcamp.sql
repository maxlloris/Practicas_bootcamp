-- 02_crea_base_datos

-- Crear la tabla student
CREATE TABLE student (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    surname VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(20),
    nif VARCHAR(15)
);

ALTER TABLE student
ADD CONSTRAINT unique_email UNIQUE (email);

-- Crear la tabla teacher
CREATE TABLE teacher (
    teacher_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    surname VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(20),
    nif VARCHAR(15)
);

ALTER TABLE teacher
ADD CONSTRAINT unique_email_teacher UNIQUE (email);

-- Crear la tabla Bootcamp
CREATE TABLE bootcamp (
    bootcamp_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    price INT,
    duration INT
);


-- Crear la tabla student_bootcamp (relación muchos a muchos entre bootcamp, student y teacher)
CREATE TABLE student_bootcamp (
    student_bootcamp_id SERIAL PRIMARY KEY,
    student_id INT,
    bootcamp_id INT,
    order_date DATE,
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (bootcamp_id) REFERENCES bootcamp(bootcamp_id)
);


--CREATE INDEX idx_start_date ON reservation (start_date);

-- Crear la tabla subject
CREATE TABLE subject (
    subject_id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);



-- Crear la tabla bootcamp_subject (relación muchos a muchos entre bootcamp y subject)
CREATE TABLE bootcamp_subject (
    bootcamp_subject SERIAL PRIMARY KEY,
    bootcamp_id INT,
    subject_id INT,
    FOREIGN KEY (bootcamp_id) REFERENCES BOOTCAMP(bootcamp_id),
    FOREIGN KEY (subject_id) REFERENCES SUBJECT(subject_id)
);


-- Crear la tabla bootcamp_teacher (relación muchos a muchos entre bootcamp y teacher)
CREATE TABLE bootcamp_teacher (
    bootcamp_teacher SERIAL PRIMARY KEY,
    bootcamp_id INT,
    teacher_id INT,
    FOREIGN KEY (bootcamp_id) REFERENCES BOOTCAMP(bootcamp_id),
    FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id)
);

INSERT INTO student (name, surname, email, phone, nif)
VALUES
('Ana', 'González', 'ana.gonzalez@email.com', '912-222333', '35683618R'),
('Juan', 'Pérez', 'juan.perez@email.com', '912-222334', '35683619S'),
('María', 'López', 'maria.lopez@email.com', '912-222335', '35683620T'),
('Pedro', 'Martínez', 'pedro.martinez@email.com', '912-222336', '35683621U'),
('Sara', 'Gómez', 'sara.gomez@email.com', '912-222339', '35683624X'),
('Miguel', 'Ruiz', 'miguel.ruiz@email.com', '912-222340', '35683625Y'),
('Laura', 'Martínez', 'laura.martinez@email.com', '912-222345', '35683630D'),
('Isabel', 'Fernández', 'isabel.fernandez@email.com', '912-222347', '35683632F'),
('Elena', 'Ruiz', 'elena.ruiz@email.com', '912-222349', '35683634H'),
('Antonio', 'Sánchez', 'antonio.sanchez@email.com', '912-222350', '35683635I'),
('Marina', 'González', 'marina.gonzalez@email.com', '912-222351', '35683636J'),
('Carlos', 'Pérez', 'carlos.perez@email.com', '912-222352', '35683637K'),
('Diego', 'Fernández', 'diego.fernandez@email.com', '912-222356', '35683641O'),
('Alicia', 'Gómez', 'alicia.gomez@email.com', '912-222357', '35683642P'),
('Lucía', 'García', 'lucia.garcia@email.com', '912-222337', '35683622V'),
('Javier', 'Fernández', 'javier.fernandez@email.com', '912-222338', '35683623W'),
('Carmen', 'Sánchez', 'carmen.sanchez@email.com', '912-222341', '35683626Z'),
('Pablo', 'González', 'pablo.gonzalez@email.com', '912-222342', '35683627A'),
('Sofía', 'Pérez', 'sofia.perez@email.com', '912-222343', '35683628B'),
('David', 'López', 'david.lopez@email.com', '912-222344', '35683629C'),
('Jorge', 'García', 'jorge.garcia@email.com', '912-222346', '35683631E'),
('Rubén', 'Gómez', 'ruben.gomez@email.com', '912-222348', '35683633G'),
('Raquel', 'López', 'raquel.lopez@email.com', '912-222353', '35683638L'),
('Jesús', 'Martínez', 'jesus.martinez@email.com', '912-222354', '35683639M'),
('Natalia', 'García', 'natalia.garcia@email.com', '912-222355', '35683640N'),
('Juan', 'Martínez', 'juan.martinez@email.com', '912-222361', '35683646T'),
('Carmen', 'González', 'carmen.gonzalez@email.com', '912-222362', '35683647U'),
('Pablo', 'Pérez', 'pablo.perez@email.com', '912-222363', '35683648V'),
('Sofía', 'López', 'sofia.lopez@email.com', '912-222364', '35683649W'),
('David', 'García', 'david.garcia@email.com', '912-222365', '35683650X');

INSERT INTO teacher (name, surname, email, phone, nif)
VALUES
('María', 'García', 'maria.garcia@email.com', '912-222356', '35683641O'),
('Pedro', 'Fernández', 'pedro.fernandez@email.com', '912-222357', '35683642P'),
('Lucía', 'Gómez', 'lucia.gomez@email.com', '912-222358', '35683643Q'),
('Javier', 'Ruiz', 'javier.ruiz@email.com', '912-222359', '35683644R'),
('Sara', 'Sánchez', 'sara.sanchez@email.com', '912-222360', '35683645S'),
('Miguel', 'González', 'miguel.gonzalez@email.com', '912-222361', '35683646T'),
('Carmen', 'Pérez', 'carmen.perez@email.com', '912-222362', '35683647U'),
('Pablo', 'López', 'pablo.lopez@email.com', '912-222363', '35683648V'),
('Sofía', 'Martínez', 'sofia.martinez@email.com', '912-222364', '35683649W'),
('Laura', 'Fernández', 'laura.fernandez@email.com', '912-222366', '35683651Y'),
('Jorge', 'Gómez', 'jorge.gomez@email.com', '912-222367', '35683652Z'),
('Isabel', 'Ruiz', 'isabel.ruiz@email.com', '912-222368', '35683653A'),
('Rubén', 'Sánchez', 'ruben.sanchez@email.com', '912-222369', '35683654B'),
('Elena', 'González', 'elena.gonzalez@email.com', '912-222370', '35683655C'),
('Juan', 'Martínez', 'juan.martinez@email.com', '912-222361', '35683646T'),
('Carmen', 'González', 'carmen.gonzalez@email.com', '912-222362', '35683647U'),
('Pablo', 'Pérez', 'pablo.perez@email.com', '912-222363', '35683648V'),
('Sofía', 'López', 'sofia.lopez@email.com', '912-222364', '35683649W'),
('David', 'García', 'david.garcia@email.com', '912-222365', '35683650X');

INSERT INTO bootcamp (name, price, duration)
VALUES
('Programar desde Cero con Python', 2550, 6),
('Desarrollo de Apps Móviles iOS', 1245, 8),
('Big Data', 5530, 8),
('Inteligencia Artificial', 2650, 8),
('Desarrollo Web', 4230, 7),
('Ciberseguridad', 3650, 7),
('DevOps & Cloud Computing', 4320, 7),
('AI Driven', 2250, 6),
('Blockchain y Criptoactivos', 5500, 6),
('Marketing Digital', 4540, 5)

INSERT INTO student_bootcamp (student_id, bootcamp_id, order_date) VALUES
(1, 2, DATE '2023-11-22'),
(2, 10, DATE '2023-12-28'),
(3, 7, DATE '2023-09-28'),
(4, 6, DATE '2024-01-08'),
(5, 8, DATE '2023-11-06'),
(6, 4, DATE '2023-12-23'),
(7, 8, DATE '2023-08-23'),
(8, 7, DATE '2023-09-05'),
(9, 5, DATE '2023-12-21'),
(10, 5, DATE '2023-10-29'),
(11, 8, DATE '2023-12-12'),
(12, 2, DATE '2023-12-15'),
(13, 5, DATE '2023-08-31'),
(14, 3, DATE '2023-12-03'),
(15, 4, DATE '2023-12-23'),
(16, 7, DATE '2023-09-27'),
(17, 1, DATE '2023-12-22'),
(18, 6, DATE '2023-12-16'),
(19, 4, DATE '2023-11-20'),
(20, 6, DATE '2023-11-08'),
(21, 9, DATE '2023-12-26'),
(22, 2, DATE '2023-10-30'),
(23, 3, DATE '2023-12-02'),
(24, 10, DATE '2023-12-06'),
(25, 2, DATE '2023-12-07'),
(26, 5, DATE '2023-12-22'),
(27, 4, DATE '2023-12-23'),
(28, 5, DATE '2023-12-16'),
(29, 10, DATE '2023-12-30'),
(30, 7, DATE '2023-12-08'),
(1, 7, DATE '2023-11-28'),
(2, 5, DATE '2023-10-23'),
(3, 7, DATE '2023-12-03'),
(4, 3, DATE '2023-09-21'),
(5, 4, DATE '2023-12-13'),
(6, 7, DATE '2023-11-12'),
(7, 9, DATE '2023-11-23'),
(8, 10, DATE '2023-12-11'),
(9, 7, DATE '2023-10-23'),
(10, 4, DATE '2023-12-02'),
(11, 5, DATE '2023-12-23'),
(12, 7, DATE '2023-09-03'),
(13, 5, DATE '2023-08-16'),
(14, 10, DATE '2023-12-06'),
(15, 10, DATE '2023-10-07'),
(16, 9, DATE '2023-09-23'),
(17, 4, DATE '2023-12-23'),
(17, 1, DATE '2023-12-22'),
(24, 1, DATE '2023-12-22'),
(11, 1, DATE '2023-12-22'),
(7, 1, DATE '2023-12-22'),
(12, 3, DATE '2023-12-22'),
(15, 8, DATE '2023-12-22'),
(27, 9, DATE '2023-12-22'),
(8, 6, DATE '2023-12-22'),
(2, 8, DATE '2023-12-22');

INSERT INTO subject (name) VALUES
('Introducción a la programación con Python'),
('Estructuras de datos en Python'),
('Programación orientada a objetos con Python'),
('Desarrollo web con Python y Flask'),
('Análisis de datos con Python'),
('Introducción al desarrollo de aplicaciones móviles iOS'),
('Diseño de interfaces de usuario para aplicaciones móviles iOS'),
('Programación en Swift para aplicaciones móviles iOS'),
('Desarrollo de aplicaciones móviles iOS con Xcode'),
('Publicación de aplicaciones móviles iOS en la App Store'),
('Introducción a Big Data'),
('Análisis de datos masivos'),
('Minería de datos'),
('Almacenamiento y procesamiento de datos en la nube'),
('Visualización de datos'),
('Introducción a la Inteligencia Artificial'),
('Aprendizaje automático'),
('Redes neuronales'),
('Procesamiento del lenguaje natural'),
('Robótica'),
('Introducción al desarrollo web'),
('Desarrollo web con HTML, CSS y JavaScript'),
('Desarrollo web con React'),
('Desarrollo web con Angular'),
('Desarrollo web con Node.js'),
('Introducción a la ciberseguridad'),
('Seguridad en redes'),
('Criptografía'),
('Análisis de vulnerabilidades'),
('Hacking ético'),
('Introducción a DevOps'),
('Automatización de procesos con shell scripting'),
('Creación de arquitecturas cloud sobre Google Cloud Platform'),
('Despliegue y orquestación de microservicios con Docker y Kubernetes'),
('Monitorización de infraestructuras con Nagios'),
('Aprendizaje Automático'),
('Procesamiento del Lenguaje Natural'),
('Visión por Computadora'),
('Sistemas Multiagentes'),
('Ética y Responsabilidad en la Inteligencia Artificial'),
('Fundamentos de Blockchain'),
('Sistemas Multiagentes'),
('Desarrollo de Contratos Inteligentes'),
('Criptomonedas y Tokens'),
('Estrategias de Marketing Digital'),
('Publicidad en Línea'),
('Marketing de Contenidos'),
('Analítica Web'),
('Email Marketing');

INSERT INTO bootcamp_teacher (bootcamp_id, teacher_id ) VALUES
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(2,6),
(2,7),
(2,8),
(2,9),
(2,10),
(3,11),
(3,12),
(3,13),
(3,14),
(3,15),
(4,16),
(4,17),
(4,18),
(4,19),
(4,1),
(5,6),
(5,7),
(5,8),
(5,12),
(5,13),
(6,16),
(6,17),
(6,18),
(6,14),
(6,15),
(7,2),
(7,3),
(7,4),
(7,5),
(7,9),
(8,10),
(8,11),
(8,12),
(8,13),
(8,16),
(9,4),
(9,5),
(9,6),
(9,3),
(9,19),
(10,17),
(10,18),
(10,19),
(10,11),
(10,9);


INSERT INTO bootcamp_subject (bootcamp_id, subject_id ) VALUES
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(2,6),
(2,7),
(2,8),
(2,9),
(2,10),
(3,11),
(3,12),
(3,13),
(3,14),
(3,15),
(4,16),
(4,17),
(4,18),
(4,19),
(4,20),
(5,21),
(5,22),
(5,23),
(5,24),
(5,25),
(6,26),
(6,27),
(6,28),
(6,29),
(6,30),
(7,31),
(7,32),
(7,33),
(7,34),
(7,35),
(8,36),
(8,37),
(8,38),
(8,39),
(8,40),
(9,41),
(9,42),
(9,43),
(9,44),
(10,45),
(10,46),
(10,47),
(10,48),
(10,49),
(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(6,1),
(7,1),
(8,1),
(9,1),
(10,1),
(1,5),
(2,5),
(3,5),
(4,5),
(5,5),
(6,5),
(7,5),
(8,5),
(9,5),
(10,5),
(1,19),
(2,19),
(3,19),
(4,19),
(5,19),
(6,19),
(7,19),
(8,19),
(9,19),
(10,19),
(1,30),
(2,30),
(3,30),
(4,30),
(1,30),
(2,30),
(3,30),
(4,30),
(5,30),
(6,30),
(7,30),
(8,30),
(9,30),
(10,30),
(1,36),
(2,36),
(3,36),
(4,36),
(5,36),
(6,36),
(7,36),
(8,36),
(9,36),
(10,36);

------------------------------------------------------ CONSULTAS VARIAS A LAS DISTINTAS TABLAS

-- Informacion completa de cada uno de los Bootcamps ( Nombre, precio, duracion, nº profesores, nº alumnos, nº asignaturas, nombres apellidos y datos alumnos y profesores)

WITH student_cte
	AS(SELECT bootcamp.bootcamp_id
			, bootcamp."name"
			, COUNT(student.student_id) AS student_count
			, ARRAY_AGG(CONCAT(student.name,' ', student.surname, '-', student.phone)) AS students2
			, STRING_AGG(CONCAT(student.name,' ', student.surname, '-', student.email), ' | ') AS students
		FROM student_bootcamp
		JOIN bootcamp
		ON bootcamp.bootcamp_id = student_bootcamp.bootcamp_id
		JOIN student
		ON student.student_id = student_bootcamp.student_id
		GROUP BY bootcamp.bootcamp_id
				,bootcamp."name")
				
	, subjects_cte
	AS(SELECT bootcamp.bootcamp_id
			, bootcamp.name
			, count(subject) AS n_subject
			, STRING_AGG(subject.name, ' | ' ORDER by subject.name) AS subjects
		FROM subject
		JOIN bootcamp_subject
		ON bootcamp_subject.subject_id = subject.subject_id
		JOIN bootcamp
		ON bootcamp.bootcamp_id = bootcamp_subject.bootcamp_id
		GROUP BY bootcamp.bootcamp_id
			, bootcamp.name
		ORDER BY bootcamp.bootcamp_id)

SELECT bootcamp.bootcamp_id AS id
	, bootcamp."name" as name
	, bootcamp.price as price
	, bootcamp.duration as duration
	, count(teacher.teacher_id) as Nº_teachers
	, student_cte.student_count AS Nº_students
	, subjects_cte.n_subject AS Nº_subjects
	, ARRAY_AGG(CONCAT(teacher.name, ' ', teacher.surname, ' PHONE ',teacher.phone )  ORDER BY teacher.name) AS teachers_data
	, student_cte.students AS student_data
	, subjects_cte.subjects
FROM bootcamp
LEFT
JOIN bootcamp_teacher
ON bootcamp.bootcamp_id = bootcamp_teacher.bootcamp_id
LEFT
JOIN teacher
ON teacher.teacher_id = bootcamp_teacher.teacher_id
LEFT
JOIN student_cte
ON bootcamp.bootcamp_id = student_cte.bootcamp_id
LEFT
JOIN subjects_cte
ON bootcamp.bootcamp_id = subjects_cte.bootcamp_id

GROUP by bootcamp.bootcamp_id
	, bootcamp.name
	, bootcamp.price
	, bootcamp.duration
	, student_cte.student_count
	, subjects_cte.n_subject
	, student_data
	, subjects_cte.subjects
order by bootcamp.bootcamp_id


-- Informacion completa de alumnos
WITH student_cte
	AS(SELECT student.student_id AS student_id
			, ROW_NUMBER() OVER(ORDER BY (SUM(bootcamp.duration))DESC, (SUM(bootcamp.price))DESC) AS rankin
		FROM student
		JOIN student_bootcamp
		ON student.student_id = student_bootcamp.student_id
		JOIN bootcamp
		on bootcamp.bootcamp_id = student_bootcamp.bootcamp_id
		GROUP BY student.student_id)

SELECT student.student_id as id
	, student_cte.rankin
	, student.name
	, student.surname
	, student.email
	, COUNT(bootcamp.bootcamp_id) AS n_form
	, SUM(bootcamp.duration) AS time
	, SUM(bootcamp.price) AS invest
	, STRING_AGG(CAST(student_bootcamp.order_date AS VARCHAR(10)), ' / ') AS date_beginning
	--Otra columna con la suma de la duracion del boocamp a la fecha de inicio del alumno y hacer un STRING_AGG.
	, STRING_AGG(bootcamp.name, ' / ') AS Bootcamps

FROM student
JOIN student_bootcamp
ON student.student_id = student_bootcamp.student_id
JOIN bootcamp
ON bootcamp.bootcamp_id = student_bootcamp.bootcamp_id
JOIN student_cte 
ON student.student_id = student_cte.student_id
GROUP
BY	 student.student_id
	, student.name
	, student.surname
	, student.email
	, student_cte.rankin
ORDER BY student_cte.rankin


-- Listado de todas los bootcamps y sus asignaturas.
SELECT bootcamp."name"
	, subject."name"
FROM bootcamp
JOIN bootcamp_subject
ON bootcamp.bootcamp_id = bootcamp_subject.bootcamp_id
JOIN subject
on subject.subject_id = bootcamp_subject.subject_id
ORDER BY bootcamp.bootcamp_id



-- Listado de todas los bootcamps y sus profesores con nombre, apellido e email
SELECT bootcamp."name"
	, teacher."name"
	,teacher.surname
	,teacher.email
FROM bootcamp
JOIN bootcamp_teacher
ON bootcamp.bootcamp_id = bootcamp_teacher.bootcamp_id
JOIN teacher
on teacher.teacher_id = bootcamp_teacher.teacher_id
ORDER BY bootcamp.bootcamp_id

-- Listado de todas los bootcamps, nombre y numero de alumnos

SELECT bootcamp.bootcamp_id
	, bootcamp."name"
	, COUNT(student.student_id) AS nº_alumnos
FROM student
JOIN student_bootcamp
ON student.student_id = student_bootcamp.student_id
JOIN bootcamp
on bootcamp.bootcamp_id = student_bootcamp.bootcamp_id
GROUP
BY bootcamp.bootcamp_id
	, bootcamp."name"
ORDER BY bootcamp.bootcamp_id


-- Coste de la formacion de cada uno de los alumnos y numeros de Bootcamps que realiza cada uno (Devuelve student_id, student.name, student.email, coste formaciones, numero formaciones)

SELECT student.student_id
	, student."name"
	, student.email
	, SUM(bootcamp.price) AS Coste_formacion
	, COUNT(bootcamp.bootcamp_id) as Número_bootcamps
FROM student
JOIN student_bootcamp
ON student.student_id = student_bootcamp.student_id
JOIN bootcamp
on bootcamp.bootcamp_id = student_bootcamp.bootcamp_id
GROUP BY student.student_id
	, student."name"
	, student.email
ORDER BY student.student_id


-- Los 3 alumnos que mas han gastado en formacion (Devuelve student_id, student.name, student.email, coste formaciones, numero formaciones y los bootcamps)

SELECT student.student_id
	, student."name"
	, student.email
	, SUM(bootcamp.price) AS Coste_formacion
	, COUNT(bootcamp.bootcamp_id) as Número_bootcamps
	, ARRAY_AGG(bootcamp.name ORDER BY student.student_id) AS bootcamps
FROM student
JOIN student_bootcamp
ON student.student_id = student_bootcamp.student_id
JOIN bootcamp
on bootcamp.bootcamp_id = student_bootcamp.bootcamp_id
GROUP BY student.student_id
order by Coste_formacion  DESC
LIMIT 3

-- Tiempo de formacion de cada uno de los alumnos (Devuelve student_id, student.phone, student.email, Meses_lectivos)

SELECT student.student_id
	, student.phone
	, student.email
	, SUM(bootcamp.duration) AS Meses_lectivos
FROM student
JOIN student_bootcamp
ON student.student_id = student_bootcamp.student_id
JOIN bootcamp
on bootcamp.bootcamp_id = student_bootcamp.bootcamp_id
GROUP by student.student_id 
order by Meses_lectivos DESC

-- Columna nueva donde se indiquen todos los bootcams de cada alumono ademas del coste en tiempo y en dinero (Devuelve student_id, student.phone, student.email, Bootcams, Meses_lectivos, Coste formacion)

SELECT student.student_id
	, student.phone
	, student.email
	, ARRAY_AGG(bootcamp.name ORDER BY student.student_id) AS bootcamps
	, SUM(bootcamp.duration) AS Meses_lectivos
	, SUM(bootcamp.price) AS Coste_formacion
FROM student
JOIN student_bootcamp
ON student.student_id = student_bootcamp.student_id
JOIN bootcamp
on bootcamp.bootcamp_id = student_bootcamp.bootcamp_id
GROUP by student.student_id 
ORDER by Coste_formacion DESC


-- Asignaturas correspondiente a un bootcamp en concreto seleccionado por el bootcamp_id (devuelve el nombre de la asignatura y el bootcamp al que pertenece)

SELECT subject.name
	, bootcamp."name"
FROM subject
JOIN bootcamp_subject
ON subject.subject_id = bootcamp_subject.subject_id
JOIN bootcamp
on bootcamp.bootcamp_id = bootcamp_subject.bootcamp_id
where bootcamp.bootcamp_id = 3
GROUP by subject."name"
	, subject.subject_id
	, bootcamp."name"
order by subject.subject_id

-- DUDA --> No se realizar la misma consulta anterior pero buscando por nombre de bootcamp en lugar de por bootcamp_id es decir esto:

SELECT subject.name
	, bootcamp."name"
FROM subject
JOIN bootcamp_subject
ON subject.subject_id = bootcamp_subject.subject_id
JOIN bootcamp
on bootcamp.bootcamp_id = bootcamp_subject.bootcamp_id
where bootcamp."name" = 'Big data' -- error en esta linea
GROUP by subject."name"
	, subject.subject_id
	, bootcamp."name"
order by subject.subject_id


-- Listado de profesores y el numero de bootcamps que imparten y listado con los nombre de los bootcamps

SELECT teacher.teacher_id 
	, teacher.email
	, count(bootcamp.bootcamp_id) as nº_bootcamps
	, STRING_AGG(bootcamp.name, ' | ' ORDER BY teacher.teacher_id) AS bootcamps_name
FROM teacher
JOIN bootcamp_teacher
ON teacher.teacher_id = bootcamp_teacher.teacher_id
JOIN bootcamp
on bootcamp.bootcamp_id = bootcamp_teacher.bootcamp_id
GROUP by teacher.name
	, teacher.teacher_id
order by teacher.teacher_id

