use db_biblioteca;

CREATE USER 'juanperez'@'localhost' IDENTIFIED BY 'contraseña_segura';
GRANT ALL PRIVILEGES ON *.* TO 'juanperez'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;


select * from empleados;
select * from libros;
select * from usuarios;

INSERT INTO libros (isbn, titulo, fechaPublicacion, idEditorial, idCategoria, idCondicion) VALUES
('9781234567890', 'Libro de Aventura 1', '2001-03-15', 1, 3, 2),
('9781234567891', 'Libro de Historia 2', '1999-05-10', 2, 1, 1),
('9781234567892', 'Libro de Ciencia 3', '2010-07-21', 3, 4, 3),
('9781234567893', 'Libro de Misterio 4', '2015-09-30', 4, 2, 5),
('9781234567894', 'Libro de Fantasía 5', '2005-02-17', 5, 3, 4),
('9781234567895', 'Libro de Filosofía 6', '2018-12-05', 1, 5, 1),
('9781234567896', 'Libro de Matemáticas 7', '2019-01-15', 2, 3, 2),
('9781234567897', 'Libro de Programación 8', '2011-11-22', 3, 4, 4),
('9781234567898', 'Libro de Física 9', '2014-06-18', 4, 1, 3),
('9781234567899', 'Libro de Química 10', '2017-04-13', 5, 2, 2),
('9781234567900', 'Libro de Astronomía 11', '2013-08-23', 1, 3, 5),
('9781234567901', 'Libro de Psicología 12', '2008-07-12', 2, 5, 4),
('9781234567902', 'Libro de Literatura 13', '2020-09-19', 3, 4, 3),
('9781234567903', 'Libro de Economía 14', '2021-11-10', 4, 2, 1),
('9781234567904', 'Libro de Política 15', '2002-03-25', 5, 3, 5),
('9781234567905', 'Libro de Ciencias Sociales 16', '1998-02-07', 1, 5, 2),
('9781234567906', 'Libro de Geografía 17', '2022-05-20', 2, 4, 3),
('9781234567907', 'Libro de Arte 18', '2007-09-01', 3, 2, 4),
('9781234567908', 'Libro de Fotografía 19', '2006-12-29', 4, 1, 5),
('9781234567909', 'Libro de Cocina 20', '2012-10-05', 5, 3, 1),
('9781234567910', 'Libro de Viajes 21', '2019-02-28', 1, 4, 2),
('9781234567911', 'Libro de Deportes 22', '2016-03-15', 2, 2, 3),
('9781234567912', 'Libro de Música 23', '2010-04-20', 3, 5, 4),
('9781234567913', 'Libro de Animales 24', '2015-07-13', 4, 1, 5),
('9781234567914', 'Libro de Medicina 25', '2013-01-07', 5, 3, 2),
('9781234567915', 'Libro de Autoayuda 26', '2023-06-11', 1, 4, 1),
('9781234567916', 'Libro de Idiomas 27', '2018-09-19', 2, 2, 3),
('9781234567917', 'Libro de Tecnología 28', '2003-03-03', 3, 5, 5),
('9781234567918', 'Libro de Ciencia Ficción 29', '2017-11-08', 4, 4, 4),
('9781234567919', 'Libro de Misterio 30', '2014-02-22', 5, 3, 2),
('9781234567920', 'Libro de Novela 31', '2020-08-05', 1, 1, 1),
('9781234567921', 'Libro de Poemas 32', '2005-10-14', 2, 3, 3),
('9781234567922', 'Libro de Arquitectura 33', '2009-06-27', 3, 2, 4),
('9781234567923', 'Libro de Diseño 34', '2001-07-08', 4, 5, 5),
('9781234567924', 'Libro de Energía 35', '2012-01-30', 5, 4, 3),
('9781234567925', 'Libro de Historia Natural 36', '2023-04-20', 1, 1, 2),
('9781234567926', 'Libro de Leyendas 37', '2019-05-15', 2, 3, 4),
('9781234567927', 'Libro de Ciencia Aplicada 38', '2016-11-17', 3, 2, 1),
('9781234567928', 'Libro de Educación 39', '2004-12-24', 4, 5, 5),
('9781234567929', 'Libro de Manualidades 40', '2007-04-28', 5, 4, 3),
('9781234567930', 'Libro de Climatología 41', '2006-10-16', 1, 1, 1),
('9781234567931', 'Libro de Dinámica 42', '2021-08-14', 2, 3, 2),
('9781234567932', 'Libro de Innovación 43', '2008-02-04', 3, 4, 5),
('9781234567933', 'Libro de Narrativa 44', '2013-06-06', 4, 5, 2),
('9781234567934', 'Libro de Ensayo 45', '2011-05-11', 5, 1, 4),
('9781234567935', 'Libro de Aventura 46', '2019-03-01', 1, 3, 3),
('9781234567936', 'Libro de Pintura 47', '2009-11-27', 2, 4, 2),
('9781234567937', 'Libro de Viajes 48', '2015-08-02', 3, 2, 1),
('9781234567938', 'Libro de Cuentos 49', '2020-07-07', 4, 1, 5),
('9781234567939', 'Libro de Ensayos Filosóficos 50', '2018-05-25', 5, 5, 4);
