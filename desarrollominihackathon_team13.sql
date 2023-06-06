/* eliminamos la base de datos */
USE master;
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'desarrollominihackathon_team13')
BEGIN
    ALTER DATABASE desarrollominihackathon_team13 SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE desarrollominihackathon_team13;
END

/* Creamos la base de datos */
CREATE DATABASE desarrollominihackathon_team13;
USE desarrollominihackathon_team13;


-- Table: ADMINISTROR
CREATE TABLE ADMINISTROR (
    id int NOT NULL,
    names varchar(60) NOT NULL,
    surnames varchar(60) NOT NULL,
    type_document varchar(3) NOT NULL,
	number_document char(20) NOT NULL,
    email varchar(150) NOT NULL,
    keys varchar(150) NOT NULL,
    states char(1) default 'A',
    CONSTRAINT ADMINISTROR_pk PRIMARY KEY (id)
);

-- Restricciones adicionales
ALTER TABLE ADMINISTROR
    ADD CONSTRAINT ADMINISTROR_names_check CHECK (LEN(names) > 0);

ALTER TABLE ADMINISTROR
    ADD CONSTRAINT ADMINISTROR_type_document_check CHECK (type_document IN ('DNI', 'CDE'));

ALTER TABLE ADMINISTROR
    ADD CONSTRAINT ADMINISTROR_email_check CHECK (email LIKE '%@%.%');

ALTER TABLE ADMINISTROR
    ADD CONSTRAINT ADMINISTROR_states_check CHECK (states IN ('A', 'I'));

-- Registros
INSERT INTO ADMINISTROR (id, names, surnames, type_document, number_document, email, keys)
VALUES
    (1, 'John', 'Doe', 'DNI', '12345678', 'john.doe@example.com', 'abc123'),
    (2, 'Jane', 'Smith', 'CDE', '98765432', 'jane.smith@example.com', 'xyz789'),
    (3, 'Robert', 'Johnson', 'DNI', '87654321', 'robert.johnson@example.com', 'def456'),
    (4, 'Emily', 'Davis', 'CDE', '56789012', 'emily.davis@example.com', 'pqr987'),
    (5, 'Michael', 'Brown', 'DNI', '43218765', 'michael.brown@example.com', 'ghi654'),
    (6, 'Sarah', 'Wilson', 'CDE', '34567890', 'sarah.wilson@example.com', 'jkl321'),
    (7, 'David', 'Taylor', 'DNI', '87654321', 'david.taylor@example.com', 'mno789'),
    (8, 'Olivia', 'Thomas', 'CDE', '56789012', 'olivia.thomas@example.com', 'stu654'),
    (9, 'Daniel', 'Clark', 'DNI', '43218765', 'daniel.clark@example.com', 'vwx321'),
    (10, 'Sophia', 'Anderson', 'CDE', '34567890', 'sophia.anderson@example.com', 'yzx987');





-- Table: BRANCH
CREATE TABLE BRANCH (
    id int NOT NULL,
    names varchar(60) NOT NULL,
    descriptions varchar(120) NOT NULL,
    surname varchar(80) NOT NULL,
    type_document varchar(3) NOT NULL,
    number_document char(20) NOT NULL,
    email varchar(150) NOT NULL,
    administrator_id int NOT NULL,
    states char(1) default 'A',
    CONSTRAINT BRANCH_pk PRIMARY KEY (id)
);

-- Restricciones adicionales
ALTER TABLE BRANCH
    ADD CONSTRAINT BRANCH_names_check CHECK (LEN(names) > 0);

ALTER TABLE BRANCH
    ADD CONSTRAINT BRANCH_descriptions_check CHECK (LEN(descriptions) > 0);

ALTER TABLE BRANCH
    ADD CONSTRAINT BRANCH_surname_check CHECK (LEN(surname) > 0);

ALTER TABLE BRANCH
    ADD CONSTRAINT BRANCH_type_document_check CHECK (type_document IN ('DNI', 'CDE'));

ALTER TABLE BRANCH
    ADD CONSTRAINT BRANCH_number_document_check CHECK (LEN(number_document) = 9);

ALTER TABLE BRANCH
    ADD CONSTRAINT BRANCH_email_check CHECK (email LIKE '%@%.%');

ALTER TABLE BRANCH
    ADD CONSTRAINT BRANCH_administrator_id_check CHECK (administrator_id > 0);

ALTER TABLE BRANCH
    ADD CONSTRAINT BRANCH_states_check CHECK (states IN ('A', 'I'));

-- Registros
INSERT INTO BRANCH (id, names, descriptions, surname, type_document, number_document, email, administrator_id)
VALUES
    (1, 'Branch 1', 'Description 1', 'Surname 1', 'DNI', '123456789', 'branch1@example.com', 1),
    (2, 'Branch 2', 'Description 2', 'Surname 2', 'CDE', '987654321', 'branch2@example.com', 2),
    (3, 'Branch 3', 'Description 3', 'Surname 3', 'DNI', '876543210', 'branch3@example.com', 3),
    (4, 'Branch 4', 'Description 4', 'Surname 4', 'CDE', '567890123', 'branch4@example.com', 4),
    (5, 'Branch 5', 'Description 5', 'Surname 5', 'DNI', '432187654', 'branch5@example.com', 5),
    (6, 'Branch 6', 'Description 6', 'Surname 6', 'CDE', '345678901', 'branch6@example.com', 6),
    (7, 'Branch 7', 'Description 7', 'Surname 7', 'DNI', '210987654', 'branch7@example.com', 7),
    (8, 'Branch 8', 'Description 8', 'Surname 8', 'CDE', '901234567', 'branch8@example.com', 8),
    (9, 'Branch 9', 'Description 9', 'Surname 9', 'DNI', '654321098', 'branch9@example.com', 9),
    (10, 'Branch 10', 'Description 10', 'Surname 10', 'CDE', '345678912', 'branch10@example.com', 10);




-- Table: DASHBOARD
CREATE TABLE DASHBOARD (
    id int NOT NULL,
    widget_names varchar(50) NOT NULL,
    widget_type varchar(50) NOT NULL,
    widget_data decimal(10,2) NOT NULL,
    created_at timestamp NOT NULL,
    ADMINISTROR_id int NOT NULL,
    SALE_id int NOT NULL,
    CONSTRAINT DASHBOARD_pk PRIMARY KEY (id)
);

-- Restricciones adicionales
ALTER TABLE DASHBOARD
    ADD CONSTRAINT DASHBOARD_widget_names_check CHECK (LEN(widget_names) > 0);

ALTER TABLE DASHBOARD
    ADD CONSTRAINT DASHBOARD_widget_type_check CHECK (LEN(widget_type) > 0);

ALTER TABLE DASHBOARD
    ADD CONSTRAINT DASHBOARD_widget_data_check CHECK (widget_data >= 0);

ALTER TABLE DASHBOARD
    ADD CONSTRAINT DASHBOARD_created_at_check CHECK (created_at <= GETDATE());

ALTER TABLE DASHBOARD
    ADD CONSTRAINT DASHBOARD_ADMINISTROR_id_check CHECK (ADMINISTROR_id > 0);

ALTER TABLE DASHBOARD
    ADD CONSTRAINT DASHBOARD_SALE_id_check CHECK (SALE_id > 0);
-- Registros
INSERT INTO DASHBOARD (id, widget_names, widget_type, widget_data, ADMINISTROR_id, SALE_id)
VALUES
    (1, 'Widget 1', 'Type 1', 100.50, 1, 1),
    (2, 'Widget 2', 'Type 2', 200.75, 2, 2),
    (3, 'Widget 3', 'Type 3', 300.25, 3, 3),
    (4, 'Widget 4', 'Type 4', 150.00, 4, 4),
    (5, 'Widget 5', 'Type 5', 50.50, 5, 5),
    (6, 'Widget 6', 'Type 6', 250.25, 6, 6),
    (7, 'Widget 7', 'Type 7', 350.75, 7, 7),
    (8, 'Widget 8', 'Type 8', 180.50, 8, 8),
    (9, 'Widget 9', 'Type 9', 90.25, 9, 9),
    (10, 'Widget 10', 'Type 10', 280.00, 10, 10);




-- Table: DELIVERY
CREATE TABLE DELIVERY (
    id int NOT NULL,
    direction varchar(150) NOT NULL,
    names varchar(60) NOT NULL,
    surnames char(1) NOT NULL,
    type_sale char(1) NOT NULL,
    SELLER_id int NOT NULL,
    date_time datetime NOT NULL,
    type_document varchar(3) NOT NULL,
	number_document varchar(20) NOT NULL,
    cellphone char(9) NOT NULL,
    CONSTRAINT DELIVERY_pk PRIMARY KEY (id)
);

-- Restricciones adicionales
ALTER TABLE DELIVERY
    ADD CONSTRAINT DELIVERY_direction_check CHECK (LEN(direction) > 0);

ALTER TABLE DELIVERY
    ADD CONSTRAINT DELIVERY_names_check CHECK (names <> '');

ALTER TABLE DELIVERY
    ADD CONSTRAINT DELIVERY_surnames_check CHECK (LEN(surnames) > 0);

ALTER TABLE DELIVERY
    ADD CONSTRAINT DELIVERY_type_sale_check CHECK (type_sale IN ('A', 'B', 'C'));

ALTER TABLE DELIVERY
    ADD CONSTRAINT DELIVERY_SELLER_id_check CHECK (SELLER_id > 0);

ALTER TABLE DELIVERY
    ADD CONSTRAINT DELIVERY_type_document_check CHECK (type_document IN ('DNI', 'CDE'));

ALTER TABLE DELIVERY
    ADD CONSTRAINT DELIVERY_cellphone_check CHECK (LEN(cellphone) = 9);

ALTER TABLE DELIVERY
    ADD CONSTRAINT DELIVERY_number_document_check CHECK (LEN(number_document) = 8);

-- Registros
INSERT INTO DELIVERY (id, direction, names, surnames, type_sale, SELLER_id, date_time, type_document, number_document, cellphone)
VALUES
    (1, 'Calle Principal 123', 'John', 'D', 'A', 1, '2023-06-06 09:00:00', 'DNI', '12345678', '123456789'),
    (2, 'Avenida Central 456', 'Jane', 'S', 'B', 2, '2023-06-07 10:30:00', 'DNI', '23456789', '234567890'),
    (3, 'Calle Secundaria 789', 'David', 'H', 'C', 3, '2023-06-08 14:45:00', 'CDE', '34567890', '345678901'),
    (4, 'Avenida Principal 987', 'Sarah', 'L', 'A', 4, '2023-06-09 11:15:00', 'DNI', '45678901', '456789012'),
    (5, 'Calle Central 654', 'Michael', 'T', 'B', 5, '2023-06-10 16:30:00', 'DNI', '56789012', '567890123'),
    (6, 'Avenida Secundaria 321', 'Emily', 'W', 'C', 6, '2023-06-11 13:20:00', 'CDE', '67890123', '678901234'),
    (7, 'Calle Principal 789', 'Daniel', 'R', 'A', 7, '2023-06-12 17:45:00', 'DNI', '78901234', '789012345'),
    (8, 'Avenida Central 654', 'Olivia', 'G', 'B', 8, '2023-06-13 12:00:00', 'DNI', '89012345', '890123456'),
    (9, 'Calle Secundaria 321', 'Jacob', 'K', 'C', 9, '2023-06-14 18:15:00', 'CDE', '90123456', '901234567'),
    (10, 'Avenida Principal 987', 'Sophia', 'M', 'A', 10, '2023-06-15 15:30:00', 'DNI', '01234567', '012345678');







-- Table: PRODUCT
CREATE TABLE PRODUCT (
    id int NOT NULL,
    names varchar(60) NOT NULL,
    descriptions varchar(120) NOT NULL,
    cost decimal(4,2) NOT NULL,
    amount int NOT NULL,
    DASHBOARD_id int NOT NULL,
    BRANCH_id int NOT NULL,
    CONSTRAINT PRODUCT_pk PRIMARY KEY (id)
);

-- Restricciones adicionales
ALTER TABLE PRODUCT
    ADD CONSTRAINT PRODUCT_names_check CHECK (LEN(names) > 0);

ALTER TABLE PRODUCT
    ADD CONSTRAINT PRODUCT_descriptions_check CHECK (LEN(descriptions) > 0);

ALTER TABLE PRODUCT
    ADD CONSTRAINT PRODUCT_cost_check CHECK (cost >= 0);

ALTER TABLE PRODUCT
    ADD CONSTRAINT PRODUCT_amount_check CHECK (amount >= 0);

ALTER TABLE PRODUCT
    ADD CONSTRAINT PRODUCT_DASHBOARD_id_check CHECK (DASHBOARD_id > 0);

ALTER TABLE PRODUCT
    ADD CONSTRAINT PRODUCT_BRANCH_id_check CHECK (BRANCH_id > 0);


-- Table: SALE
CREATE TABLE SALE (
    id int NOT NULL,
    dates date NOT NULL,
    amount int NOT NULL,
    cost decimal(4,2) NOT NULL,
    seller_id int NOT NULL,
    product_id int NOT NULL,
    states char(1) NOT NULL,
    DELIVERY_id int NOT NULL,
    CONSTRAINT SALE_pk PRIMARY KEY (id)
);

-- Restricciones adicionales
ALTER TABLE SALE
    ADD CONSTRAINT SALE_date_check CHECK (dates <= GETDATE());

ALTER TABLE SALE
    ADD CONSTRAINT SALE_amount_check CHECK (amount >= 0);

ALTER TABLE SALE
    ADD CONSTRAINT SALE_cost_check CHECK (cost >= 0);

ALTER TABLE SALE
    ADD CONSTRAINT SALE_states_check CHECK (states IN ('A', 'I'));

ALTER TABLE SALE
    ADD CONSTRAINT SALE_seller_id_check CHECK (seller_id > 0);

ALTER TABLE SALE
    ADD CONSTRAINT SALE_product_id_check CHECK (product_id > 0);

ALTER TABLE SALE
    ADD CONSTRAINT SALE_DELIVERY_id_check CHECK (DELIVERY_id > 0);


-- Table: SELLER
CREATE TABLE SELLER (
    id int NOT NULL,
    names varchar(60) NOT NULL,
    surnames varchar(60) NOT NULL,
    type_document varchar(3) NOT NULL,
    email varchar(150) NOT NULL,
    keys varchar(150) NOT NULL,
    states char(1) NOT NULL,
    CONSTRAINT SELLER_pk PRIMARY KEY (id)
);

-- Restricciones adicionales
ALTER TABLE SELLER
    ADD CONSTRAINT SELLER_names_check CHECK (LEN(names) > 0);

ALTER TABLE SELLER
    ADD CONSTRAINT SELLER_type_document_check CHECK (type_document IN ('DNI', 'CDE'));

ALTER TABLE SELLER
    ADD CONSTRAINT SELLER_email_check CHECK (email LIKE '%@%.%');

ALTER TABLE SELLER
    ADD CONSTRAINT SELLER_states_check CHECK (states IN ('A', 'I'));

