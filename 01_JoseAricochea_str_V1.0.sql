-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-07-11 16:54:17.579

-- tables
-- Table: CLIENTE
CREATE TABLE CLIENTE (
    IDCLI int  NOT NULL,
    CODUBI char(6)  NOT NULL,
    IDUSU int  NOT NULL,
    NOMCLI varchar(50)  NOT NULL,
    APECLI varchar(60)  NOT NULL,
    CORCLI varchar(25)  NOT NULL,
    CELCLI varchar(9)  NOT NULL,
    DIRENTCLI varchar(50)  NOT NULL,
    DIRFACCLI varchar(50)  NOT NULL,
    CONSTRAINT Clientes_pk PRIMARY KEY  (IDCLI)
);

-- Table: EMPLEADO
CREATE TABLE EMPLEADO (
    IDEMP int  NOT NULL,
    IDUSU int  NOT NULL,
    NOMEMP varchar(50)  NOT NULL,
    APEEMP varchar(60)  NOT NULL,
    PUEEMP varchar(17)  NOT NULL,
    CONSTRAINT Empleado_pk PRIMARY KEY  (IDEMP)
);

-- Table: PRODUCTO
CREATE TABLE PRODUCTO (
    IDPRO int  NOT NULL,
    NOMPRO varchar(40)  NOT NULL,
    MODPRO varchar(20)  NOT NULL,
    FABPRO varchar(30)  NOT NULL,
    PREUNIPRO decimal(6,2)  NOT NULL,
    STOPRO char(7)  NOT NULL,
    CONSTRAINT Productos_pk PRIMARY KEY  (IDPRO)
);

-- Table: UBIGEO
CREATE TABLE UBIGEO (
    CODUBI char(6)  NOT NULL,
    NOMDEP varchar(60)  NOT NULL,
    NOMPRO varchar(60)  NOT NULL,
    NOMDIS varchar(60)  NOT NULL,
    CONSTRAINT Ubigeo_pk PRIMARY KEY  (CODUBI)
);

-- Table: USUARIO
CREATE TABLE USUARIO (
    IDUSU int  NOT NULL,
    NOMUSU varchar(20)  NOT NULL,
    CONUSU varchar(10)  NOT NULL,
    NIVUSU char(1)  NOT NULL,
    CONSTRAINT Usuarios_pk PRIMARY KEY  (IDUSU)
);

-- Table: VENTA
CREATE TABLE VENTA (
    IDVEN int  NOT NULL,
    IDCLI int  NOT NULL,
    IDEMP int  NOT NULL,
    IDPRO int  NOT NULL,
    CANVEN varchar(4)  NOT NULL,
    PRETOTVEN decimal(8,2)  NOT NULL,
    CONSTRAINT Ventas_pk PRIMARY KEY  (IDVEN)
);

-- foreign keys
-- Reference: Clientes_Ubigeo (table: CLIENTE)
ALTER TABLE CLIENTE ADD CONSTRAINT Clientes_Ubigeo
    FOREIGN KEY (CODUBI)
    REFERENCES UBIGEO (CODUBI);

-- Reference: Clientes_Usuarios (table: CLIENTE)
ALTER TABLE CLIENTE ADD CONSTRAINT Clientes_Usuarios
    FOREIGN KEY (IDUSU)
    REFERENCES USUARIO (IDUSU);

-- Reference: Empleado_Usuarios (table: EMPLEADO)
ALTER TABLE EMPLEADO ADD CONSTRAINT Empleado_Usuarios
    FOREIGN KEY (IDUSU)
    REFERENCES USUARIO (IDUSU);

-- Reference: Ventas_Clientes (table: VENTA)
ALTER TABLE VENTA ADD CONSTRAINT Ventas_Clientes
    FOREIGN KEY (IDCLI)
    REFERENCES CLIENTE (IDCLI);

-- Reference: Ventas_Empleado (table: VENTA)
ALTER TABLE VENTA ADD CONSTRAINT Ventas_Empleado
    FOREIGN KEY (IDEMP)
    REFERENCES EMPLEADO (IDEMP);

-- Reference: Ventas_Productos (table: VENTA)
ALTER TABLE VENTA ADD CONSTRAINT Ventas_Productos
    FOREIGN KEY (IDPRO)
    REFERENCES PRODUCTO (IDPRO);

-- sequences
-- Sequence: Clientes_seq
CREATE SEQUENCE Clientes_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: Empleado_seq
CREATE SEQUENCE Empleado_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: Productos_seq
CREATE SEQUENCE Productos_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: Usuarios_seq
CREATE SEQUENCE Usuarios_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: Ventas_seq
CREATE SEQUENCE Ventas_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- End of file.

