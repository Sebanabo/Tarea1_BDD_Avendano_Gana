DROP TABLE IF EXISTS Asignacion;
DROP TABLE IF EXISTS Error;
DROP TABLE IF EXISTS Funcionalidad;
DROP TABLE IF EXISTS Ingeniero;
DROP TABLE IF EXISTS Usuario;




create table Usuario (
    RUT varchar(10) primary key, 
	Nombre varchar(50),
	Email varchar(50)
);

create table Ingeniero (
    RUT varchar(10) primary key, 
	Nombre varchar(50),
	Email varchar(50),
	Especialidad varchar(35)
);

create table Funcionalidad (
    Titulo varchar(100) primary key,
	Ambiente varchar(5),
	Resumen varchar(150) NOT NULL,
	Topico varchar(15) NOT NULL,
	Criterios varchar(100) NOT NULL,
	Solicitante varchar(50) NOT NULL,
	Estado varchar(12),
	Fecha date NOT NULL
);

create table Error (
    Titulo varchar(100) primary key,
	Descripcion varchar(200) NOT NULL,
	Fecha DATE NOT NULL,
	Topico varchar(15) NOT NULL,
	Autor varchar(50) NOT NULL,
	Estado varchar(12)
);


create table Asignacion (
    id_asignacion int identity primary key,
    rut_ingeniero varchar(10) not null,
    titulo_funcionalidad varchar(100) null,
    titulo_error varchar(100) null,
    foreign key (rut_ingeniero) references Ingeniero(RUT),
    foreign key (titulo_funcionalidad) references Funcionalidad(Titulo),
    foreign key (titulo_error) references Error(Titulo)
);









