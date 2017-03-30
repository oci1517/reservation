import os

from flask import Flask
from flask.ext.sqlalchemy import SQLAlchemy

basedir = os.path.abspath(os.path.dirname(__file__))

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] =\
    'sqlite:///' + os.path.join(basedir, 'data.sqlite3')
app.config['SQLALCHEMY_COMMIT_ON_TEARDOWN'] = True

db = SQLAlchemy(app)

class User(db.Model):
    __tablename__ == 'users'

    id = db.Column(db.Integer, primary_key=True)
    acronym = db.Column(db.String(4), unique=True, index=True)
    first_name = db.Column(db.String(25))
    last_name = db.Column(db.String(25))
    email = db.Column(db.String(25))
    username = db.Column(db.String(64), unique=True, index=True)

    def __repr__(self):
        return '<User %r>' % self.username


class Role(db.Model):
    __tablename__ = 'roles'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(64))
    level = db.Column(db.Integer)

    def __repr__(self):
        return '<Role %r>' % self.name

class StudentGroup(db.Model):
    __tablename__ = 'student_groups'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(20))
    school_level = db.Column(db.Integer)

    def __repr__(self):
        return '<StudentGroup %r>' % self.name


class Reservation(db.Model):
    __tablename__ = 'reservations'

    id = db.Column(db.Integer, primary_key=True)
    start_date = db.Column(db.Date)
    end_date = db.Column(db.Date)
    reason = db.Column(db.Unicode)
    duration = db.Column(db.Integer)

    # todo ... voir comment rajouté des champs calculés ... pour le nom de la réservation : concaténer prof, classe, nb_repetitions, timeslot

    def __repr__(self):
        return '<Reservation %r => %r>' % start_date, end_date


class Room(db.Model):
    __tablename__ = 'rooms'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(15))


    def __repr__(self):
        return '<Room %r>' % self.name


class Timeslot(db.Model):
    __tablename__ = 'timeslots'

    id = db.Column(db.Integer, primary_key=True)
    # Représente le numéro de la page horaire dans un jour donné (nombre entier entre 1 et 10 par exemple)
    day_position = db.Column(db.Integer)
    start_time = db.Column(db.Time)
    end_time = db.Column(db.Time)

    def __repr__(self):
        # TODO : il faut encore rajouter le jour auquel cette plage est liée
        return '<Timeslot %r>' % self.
