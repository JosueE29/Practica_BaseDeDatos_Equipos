Create database Practica_Equipos;
GO

USE Practica_Equipos;
GO
--Mediante el NVARCHAR se logra popder agregar cualquier tipo de caracter incluyendo valores especiales o diferentes idiomas
CREATE TABLE Usuarios (
    UsuarioID INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    CorreoElectronico NVARCHAR(100),
    Telefono VARCHAR(20)
);

CREATE TABLE Equipos (
    EquipoID INT PRIMARY KEY,
    TipoEquipo NVARCHAR(50),
    Modelo NVARCHAR(50),
    UsuarioID INT,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);

CREATE TABLE Tecnicos (
    TecnicoID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Especialidad NVARCHAR(50)
);

CREATE TABLE Reparaciones (
    ReparacionID INT PRIMARY KEY,
    EquipoID INT,
    FechaSolicitud DATE,
    Estado VARCHAR(20),
    FOREIGN KEY (EquipoID) REFERENCES Equipos(EquipoID)
);

CREATE TABLE Asignaciones (
    AsignacionID INT PRIMARY KEY,
    ReparacionID INT,
    TecnicoID INT,
    FechaAsignacion DATE,
    FOREIGN KEY (ReparacionID) REFERENCES Reparaciones(ReparacionID),
    FOREIGN KEY (TecnicoID) REFERENCES Tecnicos(TecnicoID)
);

CREATE TABLE DetallesReparacion (
    DetalleID INT PRIMARY KEY,
    ReparacionID INT,
    Descripcion NVARCHAR(255),
    FechaInicio DATE,
    FechaFin DATE,
    FOREIGN KEY (ReparacionID) REFERENCES Reparaciones(ReparacionID)
);
INSERT INTO Usuarios (UsuarioID, Nombre, CorreoElectronico, Telefono)
VALUES (1010, 'Josue', 'Josue092930@gmail.com', '85845076');
INSERT INTO Usuarios (UsuarioID, Nombre, CorreoElectronico, Telefono)
VALUES (1011, 'David0812@gmail.com', 'David081230@gmail.com', '85843076');

INSERT INTO Equipos (EquipoID, TipoEquipo, Modelo, UsuarioID)
VALUES (12201, 'Laptop', 'AsusGamer', 1010	);
INSERT INTO Equipos (EquipoID, TipoEquipo, Modelo, UsuarioID)
VALUES (12202, 'Escritorio', 'IntelCore', 1010	);

INSERT INTO Tecnicos (TecnicoID, Nombre, Especialidad)
VALUES (102, 'Johan', 'PCS GAMER');
INSERT INTO Tecnicos (TecnicoID, Nombre, Especialidad)
VALUES (103, 'Miguel', 'Escritorio');

DELETE FROM Usuarios WHERE UsuarioID = 1011;
DELETE FROM Equipos WHERE EquipoID = 12202;
DELETE FROM Tecnicos WHERE TecnicoID = 103;

SELECT * FROM Usuarios WHERE Nombre LIKE '%Josue%';
SELECT * FROM Equipos WHERE TipoEquipo = 'Laptop';
SELECT * FROM Tecnicos WHERE Especialidad = 'PC´S GAMER';

UPDATE Usuarios
SET CorreoElectronico = 'nuevocorreo@gmail.com', Telefono = '88745200'
WHERE UsuarioID = 1011;

SELECT * FROM Usuarios;
SELECT * FROM Equipos;
SELECT * FROM Tecnicos;