INSERT INTO  cities (id_city, city_name)
VALUES 
	(1, "Vinnytsa"),
	(2, "Paris"),
	(3, "Kyiv");

INSERT INTO  airports (id_airport, airport_name, city_id)
VALUES 
	(1, "Gavryshivka", 1),
	(2, "Paris airport", 2),
	(3, "Boryspil", 3);

INSERT INTO  airplane_type (id_airplane_type, fuel_volume, carrying_capacity, total_seats)
VALUES 
	(1, 1000, 200, 500),
	(2, 10000, 2000, 5000),
	(3, 100, 20, 50);

INSERT INTO  plane (id_plane, airplane_type_id)
VALUES 
	(1, 1),
	(2, 3),
	(3, 2);

INSERT INTO  document_type (id_doc_type, doc_type)
VALUES 
	(1, "Passport"),
	(2, "ID card"),
	(3, "Internacionale passport");

INSERT INTO  documents (id_document, doc_type_id, series, doc_num)
VALUES 
	(1, 2, 1029719084712847, 240813249081),
	(2, 3, 20494121, 908732723875),
	(3, 1, 58793857398798, 87357254);

INSERT INTO  person (id_person, person_name, surname, fname, document_id)
VALUES 
	(1, "Roman", "Pervachuk", "Yuriiovych", 3),
	(2, "Vitaliy", "Gonchar", "Mykolayvych", 1),
	(3, "Antonov", "Yuriy", "Serhiiovych", 2);

INSERT INTO  customer (id_customer, person_id)
VALUES 
	(1, 3),
	(2, 1),
	(3, 2);

INSERT INTO  class (id_class, class_type, price)
VALUES 
	(1, "Busines", 100000.50),
	(2, "Economy", 123.99),
	(3, "1-st", 30957),
	(4, "2-nd", 437);

INSERT INTO  tickets (id_ticket, customer_id, purchase_time, return_time, flight_id, class_id)
VALUES 
	(1, 3, "2023-01-01-20:30", NULL, 2, 1),
	(2, 1, "2023-01-01-20:30", "2023-01-01-20:30", 1, 3),
	(3, 2, "2022-06-05-22:30", NULL, 3, 2);

INSERT INTO  positions (id_position, position)
VALUES 
	(1, "stewardess"),
	(2, "pilot"),
	(3, "cashier");

INSERT INTO  employees (position_id, person_id)
VALUES 
	(1, 2),
	(2, 1),
	(3, 3);

INSERT INTO  emploee_by_flight (emploee_id, flight_id)
VALUES 
	(1, (2, 3, 1)),
	(2, (2, 3, 1)),
	(3, (2, 3, 1));

INSERT INTO  flight_data (id_flight, flight_num, destination_id, departure_id, destination_time, departure_time, vacant_seats, plane_id)
VALUES 
	(1, 1243124, 1, 3, "2023-01-01-20:30", "2023-01-01-20:30", 0, 1),
	(1, 1243124, 1, 2, "2023-01-01-21:30", "2023-01-02-20:30", 10, 3),
	(1, 1243124, 3, 2, "2023-01-03-20:30", "2023-01-04-20:30", 20, 2);
