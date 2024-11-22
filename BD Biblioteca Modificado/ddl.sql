CREATE DATABASE db_biblioteca;
USE db_biblioteca;

CREATE TABLE departamentos (
    idDepartamento CHAR(2) PRIMARY KEY,
    departamento VARCHAR(25) NOT NULL,
    pais VARCHAR(25) NOT NULL
);

CREATE TABLE cargos (
    idCargo INT PRIMARY KEY AUTO_INCREMENT,
    cargo VARCHAR(40) NOT NULL
);

CREATE TABLE roles (
    idRol INT PRIMARY KEY AUTO_INCREMENT,
    rol VARCHAR(50) NOT NULL
);

CREATE TABLE opciones (
    idOpcion INT PRIMARY KEY AUTO_INCREMENT,
    opcion VARCHAR(50) NOT NULL
);

CREATE TABLE categorias (
    idCategoria INT PRIMARY KEY AUTO_INCREMENT,
    categoria VARCHAR(45) NOT NULL
);

CREATE TABLE editoriales (
    idEditorial INT PRIMARY KEY AUTO_INCREMENT,
    editorial VARCHAR(45) NOT NULL
);

CREATE TABLE condiciones (
    idCondicion INT PRIMARY KEY AUTO_INCREMENT,
    condicion VARCHAR(45) NOT NULL
);

CREATE TABLE municipios (
    idMunicipio CHAR(3) PRIMARY KEY,
    municipio VARCHAR(30) NOT NULL,
    idDepartamento CHAR(2) NOT NULL,
    FOREIGN KEY (idDepartamento) REFERENCES departamentos(idDepartamento) ON DELETE CASCADE
);

CREATE TABLE distritos (
    idDistrito CHAR(5) PRIMARY KEY,
    distrito VARCHAR(50) NOT NULL,
    idMunicipio CHAR(3) NOT NULL,
    FOREIGN KEY (idMunicipio) REFERENCES municipios(idMunicipio) ON DELETE CASCADE
);

CREATE TABLE direcciones (
    idDireccion INT PRIMARY KEY AUTO_INCREMENT,
    linea1 VARCHAR(100) NOT NULL,
    linea2 VARCHAR(50),
    idDistrito CHAR(5),
    codigoPostal VARCHAR(7),
    FOREIGN KEY (idDistrito) REFERENCES distritos(idDistrito) ON DELETE SET NULL
);

CREATE TABLE empleados (
    idEmpleado INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    dui CHAR(10) UNIQUE NOT NULL,
    isss CHAR(9),
    fechaNacimiento DATE NULL,
    telefono VARCHAR(15) DEFAULT '',
    correo VARCHAR(100) NOT NULL,
    idCargo INT NULL,
    idDireccion INT NULL,
    FOREIGN KEY (idCargo) REFERENCES cargos(idCargo) ON DELETE SET NULL,
    FOREIGN KEY (idDireccion) REFERENCES direcciones(idDireccion) ON DELETE SET NULL
);

CREATE TABLE usuarios (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nombreUsuario VARCHAR(50) NOT NULL,
    contrasena VARCHAR(100) NOT NULL,
    idRol INT NULL,
    idEmpleado INT NULL,
    FOREIGN KEY (idRol) REFERENCES roles(idRol) ON DELETE CASCADE,
    FOREIGN KEY (idEmpleado) REFERENCES empleados(idEmpleado) ON DELETE CASCADE
);

CREATE TABLE libros (
    isbn CHAR(13) PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    fechaPublicacion DATE NOT NULL,
    idEditorial INT NULL,
    idCategoria INT NULL,
    idCondicion INT NULL,
    FOREIGN KEY (idEditorial) REFERENCES editoriales(idEditorial) ON DELETE SET NULL,
    FOREIGN KEY (idCategoria) REFERENCES categorias(idCategoria) ON DELETE SET NULL,
    FOREIGN KEY (idCondicion) REFERENCES condiciones(idCondicion) ON DELETE SET NULL
);

CREATE TABLE inventarioLibros (
    isbn CHAR(13) NOT NULL,
    stock INT NOT NULL,
    fechaUltimaActualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (isbn) REFERENCES libros(isbn) ON DELETE CASCADE
);

DELIMITER //

CREATE TRIGGER trg_check_stock
BEFORE INSERT ON inventarioLibros
FOR EACH ROW
BEGIN
    IF NEW.stock < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El stock no puede ser menor que 0.';
    END IF;
END;
//

CREATE TRIGGER trg_check_stock_update
BEFORE UPDATE ON inventarioLibros
FOR EACH ROW
BEGIN
    IF NEW.stock < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El stock no puede ser menor que 0.';
    END IF;
END;
//

DELIMITER ;

CREATE TABLE historialPrecios (
    idHistorialPrecio INT PRIMARY KEY AUTO_INCREMENT,
    isbn CHAR(13) NOT NULL,
    precioAnterior DECIMAL(10,2) NOT NULL,
    precioNuevo DECIMAL(10,2) NOT NULL,
    fechaCambio DATE NOT NULL,
    FOREIGN KEY (isbn) REFERENCES libros(isbn) ON DELETE CASCADE
);

DELIMITER //
CREATE TRIGGER trg_validar_precioNuevo
BEFORE INSERT ON historialPrecios
FOR EACH ROW
BEGIN
    IF NEW.precioNuevo = NEW.precioAnterior THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El precio nuevo debe ser diferente al precio anterior.';
    END IF;
END;
//
DELIMITER ;

CREATE TABLE autores (
    idAutor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    apellido VARCHAR(45) NOT NULL
);

CREATE TABLE autorLibros (
    idAutorLibro INT PRIMARY KEY AUTO_INCREMENT,
    idAutor INT NOT NULL,
    isbn CHAR(13) NOT NULL,
    FOREIGN KEY (idAutor) REFERENCES autores(idAutor) ON DELETE CASCADE,
    FOREIGN KEY (isbn) REFERENCES libros(isbn) ON DELETE CASCADE
);

CREATE TABLE lectores (
    idLector INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    apellido VARCHAR(45) NOT NULL,
    dui CHAR(10) UNIQUE NOT NULL,
    telefono VARCHAR(15) DEFAULT '',
    idDireccion INT NULL,
    FOREIGN KEY (idDireccion) REFERENCES direcciones(idDireccion) ON DELETE SET NULL
);

CREATE TABLE prestamos (
    idPrestamo INT PRIMARY KEY AUTO_INCREMENT,
    fechaPrestamo DATE NOT NULL,
    fechaEntregado DATE,
    fechaRecibido DATE,
    idLector INT NOT NULL,
    idEmpleado INT,
    estado VARCHAR(10) DEFAULT 'Activo',
    FOREIGN KEY (idEmpleado) REFERENCES empleados(idEmpleado) ON DELETE SET NULL,
    FOREIGN KEY (idLector) REFERENCES lectores(idLector) ON DELETE CASCADE
);

CREATE TABLE prestamoLibros (
    idPrestamoLibro INT PRIMARY KEY AUTO_INCREMENT,
    isbn CHAR(13) NOT NULL,
    idPrestamo INT NOT NULL,
    FOREIGN KEY (isbn) REFERENCES libros(isbn) ON DELETE CASCADE,
    FOREIGN KEY (idPrestamo) REFERENCES prestamos(idPrestamo) ON DELETE CASCADE
);

CREATE TABLE moras (
    idMora INT PRIMARY KEY AUTO_INCREMENT,
    cantidadDias INT NOT NULL,
    moraDia DECIMAL(10, 2) NOT NULL,
    cantidadMora DECIMAL(10, 2) AS (cantidadDias * moraDia),
    idPrestamo INT NOT NULL,
    estado VARCHAR(10) DEFAULT 'Pendiente',
    FOREIGN KEY (idPrestamo) REFERENCES prestamos(idPrestamo) ON DELETE CASCADE
);

CREATE TABLE rolOpciones (
    idRolOpcion INT PRIMARY KEY AUTO_INCREMENT,
    idRol INT NOT NULL,
    idOpcion INT NOT NULL,
    FOREIGN KEY (idRol) REFERENCES roles(idRol) ON DELETE CASCADE,
    FOREIGN KEY (idOpcion) REFERENCES opciones(idOpcion) ON DELETE CASCADE
);