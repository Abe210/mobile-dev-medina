USE cinema;

-- Personne
CREATE TABLE Personne (
    id uuid NOT NULL DEFAULT UUID(),
    nom VARCHAR(30) NOT NULL,
    prenom VARCHAR(30) NOT NULL,
    naissance DATE NOT NULL,
    deces DATE NULL,
    nationalite VARCHAR(30) NOT NULL,
    artiste VARCHAR(30) NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB;

LOAD DATA INFILE '/docker-entrypoint-initdb.d/cinema-personne.csv'
REPLACE INTO TABLE Personne
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(id, nom, prenom, naissance, @deces, nationalite, @artiste)
SET deces = NULLIF(@deces, ''),
    artiste = NULLIF(@artiste, '');

-- Etablissement
CREATE TABLE Etablissement (
    id INT NOT NULL,
    nom VARCHAR(120) NOT NULL,
    voie VARCHAR(120) NOT NULL,
    ville VARCHAR(120) NOT NULL,
    geom POINT NOT NULL
) ENGINE=InnoDB;


LOAD DATA INFILE '/docker-entrypoint-initdb.d/cinema-etablissement.csv'
REPLACE INTO TABLE Etablissement
FIELDS TERMINATED BY ',' ENCLOSED BY '\"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(id, nom, voie, ville, @st_y, @st_x)
SET 
geom = POINT(@st_y, @st_x);

