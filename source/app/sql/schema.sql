-- SQL DDL
CREATE TABLE IF NOT EXISTS users (
  user_id INTEGER NOT NULL,
  sigle VARCHAR(4) NOT NULL,
  login VARCHAR(25) NOT NULL,
  passwd_hash VARCHAR(50) NOT NULL,
  passwd_salt VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,

  -- table constraintes
  PRIMARY KEY (user_id)

);

CREATE TABLE IF NOT EXISTS student_groups (
  student_group_id INTEGER NOT NULL,

  -- table constraintes
  PRIMARY KEY (student_group_id)

);

CREATE TABLE IF NOT EXISTS reservation (
  reservation_id INTEGER NOT NULL,

  -- table constraintes
  PRIMARY KEY (reservation_id)

);

CREATE TABLE IF NOT EXISTS users_benefits_reservation (
  users_benefits_reservation_id INTEGER NOT NULL,

  -- table constraintes
  PRIMARY KEY ,(users_benefits_reservation_id)

);

CREATE TABLE IF NOT EXISTS user_owns_reservation (
  user_owns_reservation_id INTEGER NOT NULL,

  -- table constraintes
  PRIMARY KEY (user_owns_reservation_id)

);

CREATE TABLE IF NOT EXISTS rooms (
  rooms_id INTEGER NOT NULL,

  -- table constraintes
  PRIMARY KEY (rooms_id)

);

CREATE TABLE IF NOT EXISTS timeslots (
  timeslot_id INTEGER NOT NULL,

  -- table constraintes
  PRIMARY KEY (timeslot_id)

);

CREATE TABLE IF NOT EXISTS days (
  day_id INTEGER NOT NULL,

  -- table constraintes
  PRIMARY KEY (day_id)

);
