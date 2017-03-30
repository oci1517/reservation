CREATE TABLE users (
	id INTEGER NOT NULL, 
	sigle VARCHAR(4), 
	name VARCHAR(128), 
	email VARCHAR(64), 
	username VARCHAR(64), 
	password_hash VARCHAR(128) NOT NULL, 
	role_id INTEGER, 
	PRIMARY KEY (id), 
	FOREIGN KEY(role_id) REFERENCES roles (id)
);

CREATE TABLE roles (
	id INTEGER NOT NULL, 
	name VARCHAR(64), 
	level INTEGER, 
	PRIMARY KEY (id)
);

CREATE TABLE reservations (
	id INTEGER NOT NULL, 
	start_date DATE, 
	end_date DATE, 
	reason_short VARCHAR, 
	reason_details VARCHAR, 
	duration INTEGER, 
	student_group VARCHAR(20), 
	owner_id INTEGER, 
	weekday_id INTEGER, 
	room_id INTEGER, 
	PRIMARY KEY (id), 
	FOREIGN KEY(owner_id) REFERENCES users (id), 
	FOREIGN KEY(weekday_id) REFERENCES weekdays (id), 
	FOREIGN KEY(room_id) REFERENCES rooms (id)
);

CREATE TABLE rooms (
	id INTEGER NOT NULL, 
	name VARCHAR(15), 
	PRIMARY KEY (id)
);

CREATE TABLE timeslots (
	id INTEGER NOT NULL, 
	no VARCHAR(10), 
	start_time VARCHAR(5), 
	end_time VARCHAR(5), 
	"order" INTEGER, 
	PRIMARY KEY (id), 
	UNIQUE ("order")
);

CREATE TABLE weekdays (
	id INTEGER NOT NULL, 
	name VARCHAR(15), 
	PRIMARY KEY (id)
);

CREATE TABLE reservations_users (
	reservation_id INTEGER NOT NULL, 
	user_id INTEGER NOT NULL, 
	PRIMARY KEY (reservation_id, user_id), 
	FOREIGN KEY(reservation_id) REFERENCES reservations (id), 
	FOREIGN KEY(user_id) REFERENCES users (id)
);

CREATE TABLE reservations_timeslots (
	reservation_id INTEGER NOT NULL, 
	timeslot_id INTEGER NOT NULL, 
	PRIMARY KEY (reservation_id, timeslot_id), 
	FOREIGN KEY(reservation_id) REFERENCES reservations (id), 
	FOREIGN KEY(timeslot_id) REFERENCES timeslots (id)
);

