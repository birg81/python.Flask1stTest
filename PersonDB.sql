DROP DATABASE IF EXISTS PersonDB;
CREATE DATABASE IF NOT EXISTS PersonDB
	CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE PersonDB;

DROP TABLE IF EXISTS PersonList;
CREATE TABLE IF NOT EXISTS PersonList(
	id	INT	PRIMARY KEY	AUTO_INCREMENT,
	lastname	VARCHAR(24)	NOT NULL,
	firstname	VARCHAR(24)	NOT NULL,
	UNIQUE (firstname,lastname),
	gender	CHAR(1)	NOT NULL	DEFAULT 'm',
	h	INT	NOT NULL	DEFAULT 160,
	age	INT	NOT NULL	DEFAULT 24,
	CONSTRAINT chk_gender	CHECK (gender IN ('m', 'f')),
	CONSTRAINT chk_age	CHECK (age>=17 AND age<=70),
	CONSTRAINT chk_h	CHECK(h>=155 AND h<=220)
) ENGINE=InnoDB;

INSERT INTO PersonList(firstname, lastname, gender, age, h) VALUES
	('Biagio Rosario',	'Greco',	'm',	40,	171),
	('Vincenzo',	'Ravaglioli',	'm',	34,	165),
	('Torquato',	'Camilleri',	'm',	21,	162),
	('Alberico',	'Vianello',	'm',	19,	176),
	('Arnaldo',	'Bianchi',	'm',	45,	164),
	('Antonio',	'Oliva',	'm',	43,	179),
	('Beatrice',	'Petrella',	'f',	52,	170),
	('Adelasia',	'Solari',	'f',	31,	179),
	('Marta',	'Bignardi',	'f',	39,	160),
	('Daria',	'Battimelli',	'f',	41,	165),
	('Fiamma',	'Scala',	'f',	21,	168),
	('Donatella',	'Rossi',	'f',	37,	196),
	('Daria',	'Tuzzolino',	'f',	52,	174),
	('Matilda',	'Catapano',	'f',	19,	199),
	('Edoardo',	'Tognazzi',	'm',	54,	184),
	('Stefano',	'Da Re',	'm',	22,	192),
	('Gemma',	'Cortese',	'f',	34,	184),
	('Bruno',	'Fusani',	'm',	34,	174),
	('Liana',	'Surian',	'f',	54,	191),
	('Amalia',	'Baresi',	'f',	42,	183),
	('Patrizio',	'Saraceno',	'm',	53,	163);