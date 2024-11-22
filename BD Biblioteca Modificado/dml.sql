use db_biblioteca;


INSERT INTO departamentos (idDepartamento, departamento, pais) VALUES
	('AH', 'Ahuachapan', 'El Salvador'),
	('CA', 'Cabañas', 'El Salvador'),
	('CH', 'Chalatenango', 'El Salvador'),
	('CU', 'Cuscatlan', 'El Salvador'),
	('LL', 'La Libertad', 'El Salvador'),
	('LP', 'La Paz', 'El Salvador'),
	('LU', 'La Union', 'El Salvador'),
	('MO', 'Morazan', 'El Salvador'),
	('SA', 'Santa Ana', 'El Salvador'),
	('SM', 'San Miguel', 'El Salvador'),
	('SS', 'San Salvador', 'El Salvador'),
	('SV', 'San Vicente', 'El Salvador'),
	('SO', 'Sonsonate', 'El Salvador'),
	('US', 'Usulutan', 'El Salvador');


INSERT INTO cargos (cargo) VALUES
	('SysAdmin'),
	('Gerente de Biblioteca'),
	('Bibliotecario'),
	('Encargado de Atención al Usuario'),
	('Asistente de Biblioteca'),
	('RRHH'),
	('Ordenanza');


INSERT INTO roles (rol) VALUES
	('SysAdmin'), -- 1
	('Gerente de Biblioteca'), -- 2
	('Bibliotecario'), -- 3
	('Encargado de Atención al Usuario'), -- 4
	('Asistente de Biblioteca'), -- 5
	('RRHH'), -- 6
	('Lector'); -- 7


INSERT INTO opciones (opcion) VALUES
    ('Gestionar departamentos'), -- 1
    ('Gestionar cargos'), -- 2
    ('Gestionar roles'), -- 3
    ('Gestionar opciones'), -- 4
    ('Gestionar categorias'), -- 5
    ('Gestionar editoriales'), -- 6
    ('Gestionar condiciones'), -- 7
    ('Gestionar municipios'), -- 8
    ('Gestionar distritos'), -- 9
    ('Gestionar direcciones'), -- 10
    ('Gestionar empleados'), -- 11
    ('Gestionar usuarios'), -- 12
    ('Gestionar libros'), -- 13
    ('Gestionar inventarioLibros'), -- 14
    ('Gestionar historialPrecios'), -- 15
    ('Gestionar autores'), -- 16
    ('Gestionar autoresLibros'), -- 17
    ('Gestionar lectores'), -- 18
    ('Gestionar historialPrestamos'), -- 19
    ('Gestionar prestamos'), -- 20
    ('Gestionar prestamosLibros'), -- 21
    ('Gestionar moras'), -- 22
    ('Gestionar rolesOpciones'); -- 23


INSERT INTO categorias (categoria) VALUES 
	('Ficción'),
	('No Ficción'),
	('Misterio'),
	('Ciencia Ficción'),
	('Fantasía'),
	('Romance'),
	('Historia'),
	('Biografía'),
	('Autoayuda'),
	('Cómics');


INSERT INTO editoriales (editorial) VALUES
    ('Penguin Random House'),
    ('HarperCollins'),
    ('Simon & Schuster'),
    ('Hachette Livre'),
    ('Macmillan Publishers'),
    ('Bloomsbury Publishing'),
    ('Pearson'),
    ('Wiley');


INSERT INTO condiciones (condicion) VALUES
	('Nuevo'),
    ('Usado - Buen estado'),
    ('Usado - Aceptable'),
    ('Dañado'),
    ('Reacondicionado'),
    ('Edición especial'),
    ('Antiguo'),
    ('Faltan páginas'),
    ('Edición limitada');


INSERT INTO municipios (idMunicipio, municipio, idDepartamento) VALUES
	('AHN', 'Ahuachapan Norte', 'AH'),
	('AHC', 'Ahuachapan Centro', 'AH'),
	('AHS', 'Ahuachapan Sur', 'AH'),
	('CAE', 'Cabañas Este', 'CA'),
	('CAO', 'Cabañas Oeste', 'CA'),
	('CHN', 'Chalatenango Norte', 'CH'),
	('CHC', 'Chalatenango Centro', 'CH'),
	('CHS', 'Chalatenango Sur', 'CH'),
	('CUN', 'Cuscatlan Norte', 'CU'),
	('CUS', 'Cuscatlan Sur', 'CU'),
	('LLN', 'La Libertad Norte', 'LL'),
	('LLC', 'La Libertad Centro', 'LL'),
	('LLO', 'La Libertad Oeste', 'LL'),
	('LLE', 'La Libertad Este', 'LL'),
	('LLS', 'La Libertad Sur', 'LL'),
	('LLT', 'La Libertad Costa', 'LL'),
	('LPO', 'La Paz Oeste', 'LP'),
	('LPC', 'La Paz Centro', 'LP'),
	('LPE', 'La Paz Este', 'LP'),
	('LUN', 'La Union Norte', 'LU'),
	('LUS', 'La Union Sur', 'LU'),
	('MON', 'Morazan Norte', 'MO'),
	('MOS', 'Morazan Sur', 'MO'),
	('SAN', 'Santa Ana Norte', 'SA'),
	('SAC', 'Santa Ana Centro', 'SA'),
	('SAE', 'Santa Ana Este', 'SA'),
	('SAO', 'Santa Ana Oeste', 'SA'),
	('SMN', 'San Miguel Norte', 'SM'),
	('SMC', 'San Miguel Centro', 'SM'),
	('SMO', 'San Miguel Oeste', 'SM'),
	('SSN', 'San Salvador Norte', 'SS'),
	('SSO', 'San Salvador Oeste', 'SS'),
	('SSE', 'San Salvador Este', 'SS'),
	('SSC', 'San Salvador Centro', 'SS'),
	('SSS', 'San Salvador Sur', 'SS'),
	('SVN', 'San Vicente Norte', 'SV'),
	('SVS', 'San Vicente Sur', 'SV'),
	('SON', 'Sonsonate Norte', 'SO'),
	('SOC', 'Sonsonate Centro', 'SO'),
	('SOE', 'Sonsonate Este', 'SO'),
	('SOO', 'Sonsonate Oeste', 'SO'),
	('USN', 'Usulutan Norte', 'US'),
	('USE', 'Usulutan Este', 'US'),
	('USO', 'Usulutan Oeste', 'US');


INSERT INTO distritos (idDistrito, distrito, idMunicipio) VALUES
	-- Ahuachapan
	('AHN01', 'Atiquizaya', 'AHN'),
	('AHN02', 'El Refugio', 'AHN'),
	('AHN03', 'San Lorenzo', 'AHN'),
	('AHN04', 'Tur�n', 'AHN'),
	('AHC01', 'Ahuachapan', 'AHC'),
	('AHC02', 'Apaneca', 'AHC'),
	('AHC03', 'Concepcion de Ataco', 'AHC'),
	('AHC04', 'Tacuba', 'AHC'),
	('AHS01', 'Guaymango', 'AHS'),
	('AHS02', 'Jujutla', 'AHS'),
	('AHS03', 'San Francisco Menendez', 'AHS'),
	('AHS04', 'San Pedro Puxtla', 'AHS'),
-- Caba�as
	('CAE01', 'Sensuntepeque', 'CAE'),
	('CAE02', 'Victoria', 'CAE'),
	('CAE03', 'Dolores', 'CAE'),
	('CAE04', 'Guacotecti', 'CAE'),
	('CAE05', 'San Isidro', 'CAE'),
	('CAO01', 'Ilobasco', 'CAO'),
	('CAO02', 'Tejutepeque', 'CAO'),
	('CAO03', 'Jutiapa', 'CAO'),
	('CAO04', 'Cinquera', 'CAO'),
-- Chalatenango
	('CHN01', 'La Palma', 'CHN'),
	('CHN02', 'Cital�', 'CHN'),
	('CHN03', 'San Ignacio', 'CHN'),
	('CHC01', 'Nueva Concepcion', 'CHC'),
	('CHC02', 'Tejutla', 'CHC'),
	('CHC03', 'La Reina', 'CHC'),
	('CHC04', 'Agua Caliente', 'CHC'),
	('CHC05', 'Dulce Nombre de Mar�a', 'CHC'),
	('CHC06', 'El Para�so', 'CHC'),
	('CHC07', 'San Fernando', 'CHC'),
	('CHC08', 'San Francisco Morazan', 'CHC'),
	('CHC09', 'San Rafael', 'CHC'),
	('CHC10', 'Santa Rita', 'CHC'),
	('CHS01', 'Chalatenango', 'CHS'),
	('CHS02', 'Arcatao', 'CHS'),
	('CHS03', 'Azacualpa', 'CHS'),
	('CHS04', 'Comalapa', 'CHS'),
	('CHS05', 'Concepcion Quezaltepeque', 'CHS'),
	('CHS06', 'El Carrizal', 'CHS'),
	('CHS07', 'La Laguna', 'CHS'),
	('CHS08', 'Las Vueltas', 'CHS'),
	('CHS09', 'Nombre de Jesus', 'CHS'),
	('CHS10', 'Nueva Trinidad', 'CHS'),
	('CHS11', 'Ojos de Agua', 'CHS'),
	('CHS12', 'Potonico', 'CHS'),
	('CHS13', 'San Antonio de La Cruz', 'CHS'),
	('CHS14', 'San Antonio Los Ranchos', 'CHS'),
	('CHS15', 'San Francisco Lempa', 'CHS'),
	('CHS16', 'San Isidro Labrador', 'CHS'),
	('CHS17', 'San Jose Cancasque', 'CHS'),
	('CHS18', 'San Miguel de Mercedes', 'CHS'),
	('CHS19', 'San Jose Las Flores', 'CHS'),
	('CHS20', 'San Luis del Carmen', 'CHS'),
-- Cuscatl�n
	('CUN01', 'Suchitoto', 'CUN'),
	('CUN02', 'San Jose Guayabal', 'CUN'),
	('CUN03', 'Oratorio de Concepcion', 'CUN'),
	('CUN04', 'San Bartolomo Perulap�a', 'CUN'),
	('CUN05', 'San Pedro Perulap�n', 'CUN'),
	('CUS01', 'Cojutepeque', 'CUS'),
	('CUS02', 'San Rafael Cedros', 'CUS'),
	('CUS03', 'Candelaria', 'CUS'),
	('CUS04', 'Monte San Juan', 'CUS'),
	('CUS05', 'El Carmen', 'CUS'),
	('CUS06', 'San Cristobal', 'CUS'),
	('CUS07', 'Santa Cruz Michapa', 'CUS'),
	('CUS08', 'San Ramon', 'CUS'),
	('CUS09', 'El Rosario', 'CUS'),
	('CUS10', 'Santa Cruz Analquito', 'CUS'),
	('CUS11', 'Tenancingo', 'CUS'),
-- La Libertad
	('LLN01', 'Quezaltepeque', 'LLN'),
	('LLN02', 'San Matias', 'LLN'),
	('LLN03', 'San Pablo Tacachico', 'LLN'),
	('LLC01', 'San Juan Opico', 'LLC'),
	('LLC02', 'Ciudad Arce', 'LLC'),
	('LLO01', 'Colon', 'LLO'),
	('LLO02', 'Jayaque', 'LLO'),
	('LLO03', 'Sacacoyo', 'LLO'),
	('LLO04', 'Tepecoyo', 'LLO'),
	('LLO05', 'Talnique', 'LLO'),
	('LLE01', 'Antiguo Cuscatlan', 'LLE'),
	('LLE02', 'Huiz�car', 'LLE'),
	('LLE03', 'Nuevo Cuscatlan', 'LLE'),
	('LLE04', 'San Jose Villanueva', 'LLE'),
	('LLE05', 'Zaragoza', 'LLE'),
	('LLS01', 'Comasagua', 'LLS'),
	('LLS02', 'Santa Tecla', 'LLS'),
	('LLT01', 'Chiltiup�n', 'LLT'),
	('LLT02', 'Jicalapa', 'LLT'),
	('LLT03', 'La Libertad', 'LLT'),
	('LLT04', 'Tamanique', 'LLT'),
	('LLT05', 'Teotepeque', 'LLT'),
-- La Paz
	('LPO01', 'Cuyultitan', 'LPO'),
	('LPO02', 'Olocuilta', 'LPO'),
	('LPO03', 'San Juan Talpa', 'LPO'),
	('LPO04', 'San Luis Talpa', 'LPO'),
	('LPO05', 'San Pedro Masahuat', 'LPO'),
	('LPO06', 'Tapalhuaca', 'LPO'),
	('LPO07', 'San Francisco Chinameca', 'LPO'),
	('LPC01', 'El Rosario', 'LPC'),
	('LPC02', 'Jerusalen', 'LPC'),
	('LPC03', 'Mercedes La Ceiba', 'LPC'),
	('LPC04', 'Paraiso de Osorio', 'LPC'),
	('LPC05', 'San Antonio Masahuat', 'LPC'),
	('LPC06', 'San Emigdio', 'LPC'),
	('LPC07', 'San Juan Tepezontes', 'LPC'),
	('LPC08', 'San Luis La Herradura', 'LPC'),
	('LPC09', 'San Miguel Tepezontes', 'LPC'),
	('LPC10', 'San Pedro Nonualco', 'LPC'),
	('LPC11', 'Santa Mar�a Ostuma', 'LPC'),
	('LPC12', 'Santiago Nonualco', 'LPC'),
	('LPE01', 'San Juan Nonualco', 'LPE'),
	('LPE02', 'San Rafael Obrajuelo', 'LPE'),
	('LPE03', 'Zacatecoluca', 'LPE'),
-- La Uni�n
	('LUN01', 'Anamor�s', 'LUN'),
	('LUN02', 'Bolivar', 'LUN'),
	('LUN03', 'Concepcion de Oriente', 'LUN'),
	('LUN04', 'El Sauce', 'LUN'),
	('LUN05', 'Lislique', 'LUN'),
	('LUN06', 'Nueva Esparta', 'LUN'),
	('LUN07', 'Pasaquina', 'LUN'),
	('LUN08', 'Polor�s', 'LUN'),
	('LUN09', 'San Jose La Fuente', 'LUN'),
	('LUN10', 'Santa Rosa de Lima', 'LUN'),
	('LUS01', 'Conchagua', 'LUS'),
	('LUS02', 'El Carmen', 'LUS'),
	('LUS03', 'Intipuc�', 'LUS'),
	('LUS04', 'La Union', 'LUS'),
	('LUS05', 'Meanguera del Golfo', 'LUS'),
	('LUS06', 'San Alejo', 'LUS'),
	('LUS07', 'Yayantique', 'LUS'),
	('LUS08', 'Yucuaiqu�n', 'LUS'),
-- Moraz�n
	('MON01', 'Arambala', 'MON'),
	('MON02', 'Cacaopera', 'MON'),
	('MON03', 'Corinto', 'MON'),
	('MON04', 'El Rosario', 'MON'),
	('MON05', 'Joateca', 'MON'),
	('MON06', 'Jocoaitique', 'MON'),
	('MON07', 'Meanguera', 'MON'),
	('MON08', 'Perqu�n', 'MON'),
	('MON09', 'San Fernando', 'MON'),
	('MON10', 'San Isidro', 'MON'),
	('MON11', 'Torola', 'MON'),
	('MOS01', 'Chilanga', 'MOS'),
	('MOS02', 'Delicias de Concepci�n', 'MOS'),
	('MOS03', 'El Divisadero', 'MOS'),
	('MOS04', 'Gualococti', 'MOS'),
	('MOS05', 'Guatajiagua', 'MOS'),
	('MOS06', 'Jocoro', 'MOS'),
	('MOS07', 'Lolotiquillo', 'MOS'),
	('MOS08', 'Osicala', 'MOS'),
	('MOS09', 'San Carlos', 'MOS'),
	('MOS10', 'San Francisco Gotera', 'MOS'),
	('MOS11', 'San Sim�n', 'MOS'),
	('MOS12', 'Sensembra', 'MOS'),
	('MOS13', 'Sociedad', 'MOS'),
	('MOS14', 'Yamabal', 'MOS'),
	('MOS15', 'Yoloaiqu�n', 'MOS'),
-- Santa Ana
	('SAN01', 'Masahuat', 'SAN'),
	('SAN02', 'Metap�n', 'SAN'),
	('SAN03', 'Santa Rosa Guachipil�n', 'SAN'),
	('SAN04', 'Texistepeque', 'SAN'),
	('SAC01', 'Santa Ana', 'SAC'),
	('SAE01', 'Coatepeque', 'SAE'),
	('SAE02', 'El Congo', 'SAE'),
	('SAO01', 'Candelaria de la Frontera', 'SAO'),
	('SAO02', 'Chalchuapa', 'SAO'),
	('SAO03', 'El Porvenir', 'SAO'),
	('SAO04', 'San Antonio Pajonal', 'SAO'),
	('SAO05', 'San Sebasti�n Salitrillo', 'SAO'),
	('SAO06', 'Santiago de La Frontera', 'SAO'),
-- San Miguel
	('SMN01', 'Ciudad Barrios', 'SMN'),
	('SMN02', 'Sesori', 'SMN'),
	('SMN03', 'Nuevo Ed�n de San Juan', 'SMN'),
	('SMN04', 'San Gerardo', 'SMN'),
	('SMN05', 'San Luis de La Reina', 'SMN'),
	('SMN06', 'Carolina', 'SMN'),
	('SMN07', 'San Antonio del Mosco', 'SMN'),
	('SMN08', 'Chapeltique', 'SMN'),
	('SMC01', 'San Miguel', 'SMC'),
	('SMC02', 'Comacar�n', 'SMC'),
	('SMC03', 'Uluazapa', 'SMC'),
	('SMC04', 'Moncagua', 'SMC'),
	('SMC05', 'Quelepa', 'SMC'),
	('SMC06', 'Chirilagua', 'SMC'),
	('SMO01', 'Chinameca', 'SMO'),
	('SMO02', 'Nueva Guadalupe', 'SMO'),
	('SMO03', 'Lolotique', 'SMO'),
	('SMO04', 'San Jorge', 'SMO'),
	('SMO05', 'San Rafael Oriente', 'SMO'),
	('SMO06', 'El Tr�nsito', 'SMO'),
-- San Salvador
	('SSN01', 'Aguilares', 'SSN'),
	('SSN02', 'El Paisnal', 'SSN'),
	('SSN03', 'Guazapa', 'SSN'),
	('SSO01', 'Apopa', 'SSO'),
	('SSO02', 'Nejapa', 'SSO'),
	('SSE01', 'Ilopango', 'SSE'),
	('SSE02', 'San Mart�n', 'SSE'),
	('SSE03', 'Soyapango', 'SSE'),
	('SSE04', 'Tonacatepeque', 'SSE'),
	('SSC01', 'Ayutuxtepeque', 'SSC'),
	('SSC02', 'Mejicanos', 'SSC'),
	('SSC03', 'San Salvador', 'SSC'),
	('SSC04', 'Cuscatancingo', 'SSC'),
	('SSC05', 'Ciudad Delgado', 'SSC'),
	('SSS01', 'Panchimalco', 'SSS'),
	('SSS02', 'Rosario de Mora', 'SSS'),
	('SSS03', 'San Marcos', 'SSS'),
	('SSS04', 'Santo Tom�s', 'SSS'),
	('SSS05', 'Santiago Texacuangos', 'SSS'),
-- San Vicente
	('SVN01', 'Apastepeque', 'SVN'),
	('SVN02', 'Santa Clara', 'SVN'),
	('SVN03', 'San Ildefonso', 'SVN'),
	('SVN04', 'San Esteban Catarina', 'SVN'),
	('SVN05', 'San Sebasti�n', 'SVN'),
	('SVN06', 'San Lorenzo', 'SVN'),
	('SVN07', 'Santo Domingo', 'SVN'),
	('SVS01', 'San Vicente', 'SVS'),
	('SVS02', 'Guadalupe', 'SVS'),
	('SVS03', 'Verapaz', 'SVS'),
	('SVS04', 'Tepetit�n', 'SVS'),
	('SVS05', 'Tecoluca', 'SVS'),
	('SVS06', 'San Cayetano Istepeque', 'SVS'),
-- Sonsonate
	('SON01', 'Juay�a', 'SON'),
	('SON02', 'Nahuizalco', 'SON'),
	('SON03', 'Salcoatit�n', 'SON'),
	('SON04', 'Santa Catarina Masahuat', 'SON'),
	('SOC01', 'Sonsonate', 'SOC'),
	('SOC02', 'Sonzacate', 'SOC'),
	('SOC03', 'Nahulingo', 'SOC'),
	('SOC04', 'San Antonio del Monte', 'SOC'),
	('SOC05', 'Santo Domingo de Guzm�n', 'SOC'),
	('SOE01', 'Izalco', 'SOE'),
	('SOE02', 'Armenia', 'SOE'),
	('SOE03', 'Caluco', 'SOE'),
	('SOE04', 'San Juli�n', 'SOE'),
	('SOE05', 'Cuisnahuat', 'SOE'),
	('SOE06', 'Santa Isabel Ishuat�n', 'SOE'),
	('SOO01', 'Acajutla', 'SOO'),
-- Usulut�n
	('USN01', 'Santiago de Mar�a', 'USN'),
	('USN02', 'Alegr�a', 'USN'),
	('USN03', 'Berl�n', 'USN'),
	('USN04', 'Mercedes Uma�a', 'USN'),
	('USN05', 'Jucuapa', 'USN'),
	('USN06', 'El triunfo', 'USN'),
	('USN07', 'Estanzuelas', 'USN'),
	('USN08', 'San Buenaventura', 'USN'),
	('USN09', 'Nueva Granada', 'USN'),
	('USE01', 'Usulut�n', 'USE'),
	('USE02', 'Jucuar�n', 'USE'),
	('USE03', 'San Dionisio', 'USE'),
	('USE04', 'Concepci�n Batres', 'USE'),
	('USE05', 'Santa Mar�a', 'USE'),
	('USE06', 'Ozatl�n', 'USE'),
	('USE07', 'Tecap�n', 'USE'),
	('USE08', 'Santa Elena', 'USE'),
	('USE09', 'California', 'USE'),
	('USE10', 'Ereguayqu�n', 'USE'),
	('USO01', 'Jiquilisco', 'USO'),
	('USO02', 'Puerto El Triunfo', 'USO'),
	('USO03', 'San Agust�n', 'USO'),
	('USO04', 'San Francisco Javier', 'USO');


INSERT INTO direcciones (linea1, linea2, idDistrito, codigoPostal) VALUES
	('Col Madera, Calle 1, #1N', 'Frente al parque', 'SON02', '02311'),  -- 1					
	('Barrio El Caldero, Av 2, #2I', 'Frente al amate', 'SOE01', '02306'), -- 2
	('Res El Cangrejo, Av 3, #3A', 'Frente a la playa', 'SOO01', '02302'), -- 3
	('Barrio El Centro, Av 4, #4S', 'Frente a catedral', 'SOC01', '02301'), -- 4
	('Col La Frontera, Calle 5, #5G', 'Km 10', 'AHS03', '02113'), -- 5
	('Res Buenavista, Calle 6, #6A', 'Contiguo a Alcaldia', 'SAC01', '02201'), -- 6
	('Res Altavista, Av 7, #7S', 'Contiguo al ISSS', 'SSC03', '01101'), -- 7
	('Col Las Margaritas, Pje 20, #2-4', 'Junto a ANDA', 'AHS01', '02114'),-- 8
	('Urb Las Magnolias, Pol 21, #2-6', 'Casa de esquina', 'LLO01', '01115'),-- 9
	('Caserio Florencia, 3era Calle, #5', 'Casa rosada', 'SON01', '02305');-- 10


INSERT INTO empleados (nombre, apellido, dui, isss, fechaNacimiento, telefono, correo, idCargo, idDireccion) VALUES
	('Juan', 'Pérez', '1234567890', '123456789', '1985-07-15', '2234-5678', 'juan.perez@correo.com', 1, 1),
	('María', 'Rodríguez', '2345678901', '987654321', '1990-04-10', '2234-5679', 'maria.rodriguez@correo.com', 2, 2),
	('Carlos', 'González', '3456789012', '234567890', '1982-11-25', '2234-5680', 'carlos.gonzalez@correo.com', 3, 3),
	('Ana', 'López', '4567890123', '345678901', '1995-02-20', '2234-5681', 'ana.lopez@correo.com', 4, 4),
	('Luis', 'Martínez', '5678901234', '456789012', '1992-06-17', '2234-5682', 'luis.martinez@correo.com', 5, 5),
	('Sofía', 'Hernández', '6789012345', '567890123', '1988-09-30', '2234-5683', 'sofia.hernandez@correo.com', 6, 6);


INSERT INTO usuarios (nombreUsuario, contrasena, idRol, idEmpleado) VALUES
	('juanperez', 'pass1234', 1, 1),
	('mariarodriguez', 'securePass1', 2, 2),
	('carlosgonzalez', 'password1982', 3, 3),
	('analopes', 'mypassword2024', 4, 4),
	('luismartinez', 'pass@456', 5, 5),
	('sofiahernandez', 'newpass2024', 6, 6);


INSERT INTO libros (isbn, titulo, fechaPublicacion, idEditorial, idCategoria, idCondicion) VALUES
	('9780451524935', '1984', '1949-06-08', 1, 1, 1),
	('9780061120084', 'To Kill a Mockingbird', '1960-07-11', 2, 2, 1),
	('9780156013925', 'El Principito', '2001-09-04', 3, 3, 2),
	('9780374292799', 'The Great Gatsby', '1925-04-10', 4, 4, 1),
	('9781644732717', '21 lecciones para el siglo XXI', '2020-07-21', 5, 4, 4),
	('9780452284234', 'Pride and Prejudice', '1813-01-28', 6, 6, 1),
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


INSERT INTO inventarioLibros (isbn, stock, fechaUltimaActualizacion) VALUES
	('9780451524935', 20, '2024-11-11'),
	('9780061120084', 15, '2024-11-11'),
	('9780156013925', 50, '2024-11-11'),
	('9780374292799', 10, '2024-11-11'),
	('9781644732717', 25, '2024-11-11'),
	('9780452284234', 30, '2024-11-11');


INSERT INTO historialPrecios (isbn, precioAnterior, precioNuevo, fechaCambio) VALUES
	('9780451524935', 15.99, 17.99, '2024-11-11'),
	('9780061120084', 18.50, 20.00, '2024-11-11'),
	('9780156013925', 12.99, 14.50, '2024-11-11'),
	('9780374292799', 10.00, 12.00, '2024-11-11'),
	('9781644732717', 13.99, 15.50, '2024-11-11'),
	('9780452284234', 9.99, 11.00, '2024-11-11');


INSERT INTO autores (nombre, apellido) VALUES
	('George', 'Orwell'),
	('Harper', 'Lee'),
	('Antoine de Saint-Exupéry', ' '),
	('F. Scott', 'Fitzgerald'),
	('Yuval Noah', 'Harari'),
	('Jane', 'Austen');


INSERT INTO autorLibros (idAutor, isbn) VALUES
	(1, '9780451524935'),
	(2, '9780061120084'),
	(3, '9780156013925'),
	(4, '9780374292799'),
	(5, '9781644732717'),
	(6, '9780452284234');


-- Inserciones para la tabla lectores
INSERT INTO lectores (nombre, apellido, dui, telefono, idDireccion) VALUES
('Felipe', 'García', '7890123456', '555-9876', 1),
('Elena', 'Sánchez', '8901234567', '555-8765', 2),
('Ricardo', 'Vázquez', '9012345678', '555-7654', 3),
('Isabel', 'Jiménez', '0123456789', '555-6543', 4),
('Manuel', 'Torres', '1234567890', '555-5432', 5),
('Clara', 'Morales', '2345678901', '555-4321', 6);


-- Inserciones para la tabla prestamos
INSERT INTO prestamos (fechaPrestamo, fechaEntregado, fechaRecibido, idLector, idEmpleado, estado) VALUES
    ('2024-11-01', '2024-11-01', '2024-11-15', 1, 1, 'Activo'),
    ('2024-10-01', '2024-10-05', '2024-11-05', 2, 2, 'Activo'),
    ('2024-09-10', '2024-09-10', '2024-09-30', 3, 3, 'Activo'),
    ('2024-08-05', '2024-08-05', '2024-08-20', 4, 4, 'Activo'),
    ('2024-07-01', '2024-07-01', '2024-07-12', 5, 5, 'Activo'),
    ('2024-06-15', '2024-06-15', '2024-06-25', 6, 6, 'Activo');


-- Inserciones para la tabla prestamosLibros
INSERT INTO prestamoLibros (isbn, idPrestamo) VALUES
	('9780451524935', 1),
	('9780061120084', 2),
	('9780156013925', 3),
	('9780374292799', 4),
	('9781644732717', 5),
	('9780452284234', 6);


INSERT INTO moras (cantidadDias, moraDia, idPrestamo, estado) VALUES
	(5, 0.50, 1, 'Pendiente'),
    (10, 1.00, 2, 'Pendiente'),
    (3, 0.75, 3, 'Pagada'),
    (7, 1.20, 4, 'Pendiente'),
    (15, 1.50, 5, 'Pendiente'),
    (0, 0.00, 6, 'Pendiente');


-- Inserciones para la tabla rolesOpciones
-- SysAdmin (tiene acceso a todas las opciones)
INSERT INTO rolOpciones (idRol, idOpcion) VALUES
    (1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7), (1, 8), (1, 9), 
    (1, 10), (1, 11), (1, 12), (1, 13), (1, 14), (1, 15), (1, 16), (1, 17), 
    (1, 18), (1, 19), (1, 20), (1, 21), (1, 22), (1, 23),

-- Gerente de Biblioteca (acceso administrativo, incluyendo gestión de libros y empleados)
    (2, 5), (2, 6), (2, 7), (2, 11), (2, 12), (2, 13), (2, 14), (2, 15), 
    (2, 16), (2, 17), (2, 18), (2, 19), (2, 20), (2, 21), (2, 22),

-- Bibliotecario (gestión de libros, inventario, autores, lectores y préstamos)
    (3, 13), (3, 14), (3, 16), (3, 17), (3, 18), (3, 19), (3, 20), (3, 21), 
    (3, 22),

-- Encargado de Atención al Usuario (gestión de préstamos y lectores)
    (4, 18), (4, 19), (4, 20), (4, 21), (4, 22),

-- Asistente de Biblioteca (apoyo en inventario y gestión de préstamos)
    (5, 14), (5, 19), (5, 20), (5, 21),

-- RRHH (gestión de empleados y roles)
    (6, 2), (6, 11), (6, 3), (6, 12);
    
-- creacion de el admin juan perez
CREATE USER 'juanperez'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON *.* TO 'juanperez'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;

    
