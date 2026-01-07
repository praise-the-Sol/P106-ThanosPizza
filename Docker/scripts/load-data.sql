-- PREPARER
USE db_thanospizza
SET FOREIGN_KEY_CHECKS = 0;
SET SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO';

-- t_adresse
load data infile '/var/lib/mysql-files/DATA/t_adresse.csv' 
into table t_adresse 
character set utf8mb4 
fields terminated by ',' 
ENCLOSED BY "'"
lines terminated by '\r\n' 
ignore 1 lines 
(adresse_id, t_client_fk, rue, ville, npa, longitude, latitude);

-- t_article
load data infile '/var/lib/mysql-files/DATA/t_article.csv' 
into table t_article 
character set utf8mb4 
fields terminated by ',' 
ENCLOSED BY "'"
lines terminated by '\r\n' 
ignore 1 lines 
(article_id, type, nom, prix_ttc, tva, etat);

-- t_client
load data infile '/var/lib/mysql-files/DATA/t_client.csv' 
into table t_client
character set utf8mb4 
fields terminated by ',' 
ENCLOSED BY "'"
lines terminated by '\r\n' 
ignore 1 lines 
(client_id, nom, prenom, mail, tel);

-- t_commande
load data infile '/var/lib/mysql-files/DATA/t_commande.csv' 
into table t_commande
character set utf8mb4 
fields terminated by ',' 
ENCLOSED BY "'"
lines terminated by '\r\n' 
ignore 1 lines 
(commande_id, t_client_fk, type, t_adresse_fk, date, statut);

-- t_ligne_commande
load data infile '/var/lib/mysql-files/DATA/t_ligne_commande.csv' 
into table t_ligne_commande
character set utf8mb4 
fields terminated by ',' 
ENCLOSED BY "'"
lines terminated by '\r\n' 
ignore 1 lines 
(ligne_commande_id, t_commande_fk, t_article_fk, quanite, prix_unitaire, t_parent_fk);

-- t_livraison
load data infile '/var/lib/mysql-files/DATA/t_livraison.csv' 
into table t_livraison
character set utf8mb4 
fields terminated by ',' 
ENCLOSED BY "'"
lines terminated by '\r\n' 
ignore 1 lines 
(livraison_id, t_commande_fk, t_livreur_fk, statut, depart, arrive);

-- t_livreur
load data infile '/var/lib/mysql-files/DATA/t_livreur.csv' 
into table t_livreur 
character set utf8mb4 
fields terminated by ',' 
ENCLOSED BY "'"
lines terminated by '\r\n' 
ignore 1 lines 
(livreur_id, code, nom, disponible);

-- t_paiement
load data infile '/var/lib/mysql-files/DATA/t_paiement.csv' 
into table t_paiement 
character set utf8mb4 
fields terminated by ',' 
ENCLOSED BY "'"
lines terminated by '\r\n' 
ignore 1 lines
(paiement_id, t_commande_id, mode, montant, t_date_paiement);

-- FINIR
SET FOREIGN_KEY_CHECKS = 1;