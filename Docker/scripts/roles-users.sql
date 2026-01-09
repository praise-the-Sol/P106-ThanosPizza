-- DOP IF EXISTS
DROP USER IF EXISTS 'tony'@'localhost';
DROP USER IF EXISTS 'bruce'@'localhost';
DROP USER IF EXISTS 'steve'@'localhost';
DROP USER IF EXISTS 'samuel'@'localhost';
DROP USER IF EXISTS 'thor'@'localhost';
DROP USER IF EXISTS 'peter'@'localhost';

DROP ROLE IF EXISTS 'admin';
DROP ROLE IF EXISTS 'manager';
DROP ROLE IF EXISTS 'pizzaiolo';
DROP ROLE IF EXISTS 'livreur';
DROP ROLE IF EXISTS 'caisse';
DROP ROLE IF EXISTS 'analyste';

-- ADMIN
CREATE ROLE 'admin';
GRANT ALL PRIVILEGES ON db_thanospizza.* TO 'admin' WITH GRANT OPTION;
GRANT CREATE USER ON *.* TO 'admin';
GRANT RELOAD ON *.* TO 'admin';
GRANT SHOW DATABASES ON *.* TO 'admin';

-- MANAGER
CREATE ROLE 'manager';
GRANT SELECT, INSERT, UPDATE, DELETE ON db_thanospizza.t_commande TO 'manager';
GRANT SELECT, INSERT, UPDATE, DELETE ON db_thanospizza.t_ligne_commande TO 'manager';
GRANT SELECT, INSERT, UPDATE, DELETE ON db_thanospizza.t_livraison TO 'manager';
GRANT SELECT ON db_thanospizza.t_paiement TO 'manager';
GRANT SELECT, INSERT, UPDATE, DELETE ON db_thanospizza.t_article TO 'manager';
GRANT SELECT ON db_thanospizza.t_client TO 'manager';
GRANT SELECT ON db_thanospizza.t_adresse TO 'manager';
GRANT SELECT ON db_thanospizza.t_livreur TO 'manager';

-- PIZZAIOLO
CREATE ROLE 'pizzaiolo';
GRANT SELECT ON db_thanospizza.t_commande TO 'pizzaiolo';
GRANT SELECT ON db_thanospizza.t_ligne_commande TO 'pizzaiolo';
GRANT SELECT ON db_thanospizza.t_article TO 'pizzaiolo';
GRANT UPDATE(statut) ON db_thanospizza.t_commande TO 'pizzaiolo';

-- LIVREUR
CREATE ROLE 'livreur';
GRANT SELECT ON db_thanospizza.t_commande TO 'livreur';
GRANT SELECT ON db_thanospizza.t_adresse TO 'livreur';
GRANT SELECT ON db_thanospizza.t_livraison TO 'livreur';
GRANT SELECT ON db_thanospizza.t_ligne_commande TO 'livreur';
GRANT SELECT, UPDATE ON db_thanospizza.t_livraison TO 'livreur';
GRANT UPDATE(statut) ON db_thanospizza.t_commande TO 'livreur';
GRANT SELECT ON db_thanospizza.t_adresse TO 'livreur';
GRANT SELECT ON db_thanospizza.t_client TO 'livreur';

-- CAISSE
CREATE ROLE 'caisse';
GRANT SELECT ON db_thanospizza.t_commande TO 'caisse';
GRANT INSERT ON db_thanospizza.t_commande TO 'caisse';
GRANT SELECT ON db_thanospizza.t_ligne_commande TO 'caisse';
GRANT INSERT ON db_thanospizza.t_ligne_commande TO 'caisse';
GRANT SELECT ON db_thanospizza.t_client TO 'caisse';
GRANT SELECT ON db_thanospizza.t_article TO 'caisse';
GRANT SELECT, INSERT, UPDATE ON db_thanospizza.t_paiement TO 'caisse';

-- ANALYSTE
CREATE ROLE 'analyste';
GRANT SELECT ON db_thanospizza.* TO 'analyste';

-- USERS
CREATE USER 'tony'@'localhost' IDENTIFIED BY '1234';
CREATE USER 'bruce'@'localhost' IDENTIFIED BY '1234';
CREATE USER 'steve'@'localhost' IDENTIFIED BY '1234';
CREATE USER 'samuel'@'localhost' IDENTIFIED BY '1234';
CREATE USER 'thor'@'localhost' IDENTIFIED BY '1234';
CREATE USER 'peter'@'localhost' IDENTIFIED BY '1234';

-- GRANT ROLES
GRANT 'admin' TO 'tony'@'localhost';
GRANT 'analyste' TO 'bruce'@'localhost';
GRANT 'manager' TO 'steve'@'localhost';
GRANT 'caisse' TO 'samuel'@'localhost' ;
GRANT 'pizzaiolo' TO 'thor'@'localhost';
GRANT 'livreur' TO 'peter'@'localhost' ;

-- SET DEFAULT
SET DEFAULT ROLE 'admin' TO 'tony'@'localhost';
SET DEFAULT ROLE 'analyste' TO 'bruce'@'localhost';
SET DEFAULT ROLE 'manager' TO 'steve'@'localhost';
SET DEFAULT ROLE 'caisse' TO 'samuel'@'localhost';
SET DEFAULT ROLE 'pizzaiolo' TO 'thor'@'localhost';
SET DEFAULT ROLE 'livreur' TO 'peter'@'localhost';