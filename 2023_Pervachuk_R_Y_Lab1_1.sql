CREATE TABLE airplane_type
(
    id_airplane_type BIGINT AUTO_INCREMENT,
    fuel_volume FLOAT NOT NULL,
    carrying_capacity FLOAT NOT NULL,
    total_seats INT,
    PRIMARY KEY (id_airplane_type)
) ENGINE = InnoDB;

CREATE TABLE plane
(
    id_plane BIGINT AUTO_INCREMENT,
    airplane_type_id BIGINT NOT NULL,
    PRIMARY KEY (id_plane),
    FOREIGN KEY (airplane_type_id) REFERENCES airplane_type (id_airplane_type) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE = InnoDB;

CREATE TABLE cities
(
    id_city BIGINT AUTO_INCREMENT,
    city_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_city)
)ENGINE = InnoDB;

CREATE TABLE country
(
    id_country BIGINT AUTO_INCREMENT,
    country_name VARCHAR(100) NOT NULL,
    city_id BIGINT NOT NULL,
    PRIMARY KEY (id_country),
    FOREIGN KEY (city_id) REFERENCES cities(id_city) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE = InnoDB;

CREATE TABLE airports
(
    id_airport BIGINT AUTO_INCREMENT,
    airport_name VARCHAR(100) NOT NULL,
    country_id BIGINT NOT NULL,
    PRIMARY KEY (id_airport),
    FOREIGN KEY (country_id) REFERENCES country(id_country) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE = InnoDB;

CREATE TABLE document_type
(
    id_doc_type BIGINT AUTO_INCREMENT,
    doc_type VARCHAR(100) NOT NULL,
    PRIMARY KEY(id_doc_type),
    UNIQUE KEY(doc_type)
)ENGINE = InnoDB;

CREATE TABLE documents
(
    id_document BIGINT AUTO_INCREMENT,
    doc_type_id BIGINT NOT NULL,
    series BIGINT NOT NULL,
    doc_num BIGINT NOT NULL,
    PRIMARY KEY (id_document),
    UNIQUE KEY (series),
    UNIQUE KEY (doc_num),
    FOREIGN KEY (doc_type_id) REFERENCES document_type (id_doc_type) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE = InnoDB;

CREATE TABLE person
(
    id_person BIGINT AUTO_INCREMENT,
    person_name VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    fname VARCHAR(100) NOT NULL,
    document_id BIGINT NOT NULL,
    PRIMARY KEY(id_person),
    FOREIGN KEY (document_id) REFERENCES documents (id_document) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE = InnoDB;

CREATE TABLE customer
(
    id_customer BIGINT AUTO_INCREMENT,
    person_id BIGINT NOT NULL,
    PRIMARY KEY(id_customer),
    FOREIGN KEY(person_id) REFERENCES person(id_person) ON DELETE RESTRICT ON UPDATE CASCADE

)ENGINE = InnoDB;

CREATE TABLE positions
(
    id_position BIGINT AUTO_INCREMENT,
    position VARCHAR(50) NOT NULL,
    PRIMARY KEY(id_position),
    UNIQUE KEY(position)
)ENGINE = InnoDB;

CREATE TABLE employees
(
    id_employee BIGINT AUTO_INCREMENT,
    position_id BIGINT NOT NULL,
    PRIMARY KEY(id_employee),
    FOREIGN KEY(position_id) REFERENCES positions(id_position) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE = InnoDB;

CREATE TABLE flight_data
(
    id_flight BIGINT AUTO_INCREMENT,
    flight_num INT,
    departure_id BIGINT NOT NULL,
    destination_id BIGINT NOT NULL,
    departure_time DATETIME NOT NULL,
    destination_time DATETIME NOT NULL,
    vacant_seats INT NULL,
    plane_id BIGINT NOT NULL,
    PRIMARY KEY(id_flight),
    FOREIGN KEY(departure_id) REFERENCES airports(id_airport) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY(destination_id) REFERENCES airports(id_airport) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY(plane_id) REFERENCES plane(id_plane) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE employee_by_flight
(
    employee_id BIGINT NOT NULL,
    flight_id BIGINT NOT NULL,
    FOREIGN KEY(employee_id) REFERENCES employees(id_employee) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY(flight_id) REFERENCES flight_data(id_flight) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE class
(
    id_class BIGINT AUTO_INCREMENT,
    class_type VARCHAR(20) NOT NULL,
    price FLOAT NOT NULL,
    PRIMARY KEY(id_class)
)ENGINE=InnoDB;

CREATE TABLE tickets
(
    id_ticket BIGINT AUTO_INCREMENT,
    customer_id BIGINT NOT NULL,
    purchase_time DATETIME NOT NULL,
    return_time DATETIME NULL,
    flight_id BIGINT NOT NULL,
    class_id BIGINT NOT NULL,
    PRIMARY KEY(id_ticket),
    FOREIGN KEY(customer_id) REFERENCES customer(id_customer) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY(flight_id) REFERENCES flight_data(id_flight) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY(class_id) REFERENCES class(id_class) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB;
