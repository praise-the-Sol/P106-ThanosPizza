-- CREER DB
CREATE DATABASE db_thanospizza
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
USE db_thanospizza;

-- CREER TABLES
CREATE TABLE t_livreur(
   livreur_id INT AUTO_INCREMENT,
   nom VARCHAR(50) NOT NULL,
   disponible BOOLEAN NOT NULL,
   code VARCHAR(10) NOT NULL,
   PRIMARY KEY(livreur_id),
   UNIQUE(code)
);

CREATE TABLE t_article(
   article_id INT AUTO_INCREMENT,
   nom VARCHAR(50) NOT NULL,
   etat BOOLEAN NOT NULL,
   prix_ttc DECIMAL(19,4) NOT NULL,
   tva DECIMAL(15,2) NOT NULL,
   type VARCHAR(15),
   parent_fk INT NOT NULL,
   PRIMARY KEY(article_id),
   FOREIGN KEY(parent_fk) REFERENCES t_article(article_id)
);

CREATE TABLE t_client(
   client_id INT AUTO_INCREMENT,
   nom VARCHAR(50) NOT NULL,
   prenom VARCHAR(50) NOT NULL,
   mail VARCHAR(50) NOT NULL,
   tel VARCHAR(20) NOT NULL,
   PRIMARY KEY(client_id)
);

CREATE TABLE t_adresse(
   adresse_id INT AUTO_INCREMENT,
   rue VARCHAR(150) NOT NULL,
   ville VARCHAR(50) NOT NULL,
   npa SMALLINT NOT NULL,
   longitude DECIMAL(15,15),
   latitude DECIMAL(15,15),
   PRIMARY KEY(adresse_id)
);

CREATE TABLE t_livraison(
   livraison_id INT AUTO_INCREMENT,
   depart DATETIME,
   arrive DATETIME,
   distance DECIMAL(15,2),
   statut VARCHAR(15),
   livreur_fk INT,
   PRIMARY KEY(livraison_id),
   FOREIGN KEY(livreur_fk) REFERENCES t_livreur(livreur_id)
);

CREATE TABLE t_commande(
   commande_id INT AUTO_INCREMENT,
   date_ DATETIME NOT NULL,
   type VARCHAR(15) NOT NULL,
   statut VARCHAR(15) NOT NULL,
   adresse_fk INT,
   client_fk INT NOT NULL,
   livraison_fk INT,
   PRIMARY KEY(commande_id),
   FOREIGN KEY(adresse_fk) REFERENCES t_adresse(adresse_id),
   FOREIGN KEY(client_fk) REFERENCES t_client(client_id),
   FOREIGN KEY(livraison_fk) REFERENCES t_livraison(livraison_id)
);

CREATE TABLE t_paiement(
   paiement_id INT AUTO_INCREMENT,
   mode VARCHAR(50),
   date_paiement DATETIME,
   montant_paye DECIMAL(19,4),
   commande_fk INT NOT NULL,
   PRIMARY KEY(paiement_id),
   FOREIGN KEY(commande_fk) REFERENCES t_commande(commande_id)
);

CREATE TABLE t_ligne_commande(
   ligne_commande_id INT AUTO_INCREMENT,
   quantite INT,
   prix_unitaire DECIMAL(19,4),
   commande_fk INT NOT NULL,
   article_fk INT NOT NULL,
   PRIMARY KEY(ligne_commande_id),
   FOREIGN KEY(commande_fk) REFERENCES t_commande(commande_id),
   FOREIGN KEY(article_fk) REFERENCES t_article(article_id)
);

CREATE TABLE vivre(
   client_fk INT,
   adresse_fk INT,
   PRIMARY KEY(client_fk, adresse_fk),
   FOREIGN KEY(client_fk) REFERENCES t_client(client_id),
   FOREIGN KEY(adresse_fk) REFERENCES t_adresse(adresse_id)
);
