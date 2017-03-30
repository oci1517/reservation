DROP TABLE users;
DROP TABLE rooms;
DROP TABLE student_groups;
DROP TABLE days;
DROP TABLE timeslots;
DROP TABLE reservations;
DROP TABLE reservations_times;
DROP TABLE benefits;

CREATE TABLE IF NOT EXISTS users
(
	id INTEGER PRIMARY KEY,
	privilege INTEGER,
	sigle VARCHAR(4) NOT NULL,
	login VARCHAR(40) NOT NULL,
	password VARCHAR(40) NOT NULL,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	phone VARCHAR(13)
);

CREATE TABLE IF NOT EXISTS rooms
(
	id INTEGER PRIMARY KEY,
	number INTEGER NOT NULL,
	type VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS student_groups
(
	id INTEGER PRIMARY KEY,
	name VARCHAR(6)
);

CREATE TABLE IF NOT EXISTS days
(
	id INTEGER PRIMARY KEY,
	name VARCHAR(8)
);

CREATE TABLE IF NOT EXISTS timeslots
(
	id INTEGER PRIMARY KEY,
	start_time DATE NOT NULL,
	end_time DATE NOT NULL,
	day_id INTEGER NOT NULL,

	FOREIGN KEY (day_id) REFERENCES days (id)
);

CREATE TABLE IF NOT EXISTS reservations
(
	id INTEGER PRIMARY KEY,
	status BOOLEAN,
	start_time DATE NOT NULL,
	end_time DATE NOT NULL,
	reason VARCHAR(140),
	duration TIME NOT NULL,
	owner_id INTEGER NOT NULL,
	student_group_id INTEGER,
	room_id INTEGER NOT NULL,

	FOREIGN KEY (owner_id) REFERENCES users (id),
	FOREIGN KEY (student_group_id) REFERENCES student_groups (id),
	FOREIGN KEY (room_id) REFERENCES rooms (id)
);

CREATE TABLE IF NOT EXISTS reservations_times
(
	rule_id INTEGER NOT NULL,
	timeslot_id INTEGER NOT NULL,

	PRIMARY KEY(rule_id, timeslot_id),

	FOREIGN KEY (rule_id) REFERENCES reservations (id),
	FOREIGN KEY (timeslot_id) REFERENCES timeslots (id)
);

CREATE TABLE IF NOT EXISTS benefits
(
	user_id INTEGER NOT NULL,
	rule_id INTEGER NOT NULL,

	PRIMARY KEY(rule_id, user_id),

	FOREIGN KEY (rule_id) REFERENCES reservations (id),
	FOREIGN KEY (user_id) REFERENCES users (id)
);

INSERT INTO days (id, name) VALUES (0, 'Lundi');
INSERT INTO days (id, name) VALUES (1, 'Mardi');
INSERT INTO days (id, name) VALUES (2, 'Mercredi');
INSERT INTO days (id, name) VALUES (3, 'Jeudi');
INSERT INTO days (id, name) VALUES (4, 'Vendredi');
