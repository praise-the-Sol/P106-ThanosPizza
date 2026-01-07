-- ADMIN
CREATE ROLE 'admin';
GRANT ALL PRIVILEGES ON db_thanospizza.* TO 'admin' WITH GRANT OPTION;

-- MANAGER
CREATE ROLE 'manager';
GRANT CREATE, DELETE, SELECT ON db_thanospizza.t_commande TO 'manager';
GRANT CREATE, DELETE, SELECT, UPDATE, INSERT ON db_thanospizza.t_livraison TO 'manager';
GRANT SELECT ON db_thanospizza.t_paiement TO 'manager';
GRANT CREATE, DELETE, SELECT, UPDATE, INSERT ON db_thanospizza.t_article TO 'manager';

-- PIZZAIOLO
CREATE ROLE 'pizzaiolo';
GRANT SELECT ON db_thanospizza.t_article to 'pizzaiolo';
GRANT SELECT, UPDATE ON db_thanospizza.t_article to 'pizzaiolo';

-- LIVREUR
CREATE ROLE 'livreur';
GRANT SELECT ON db_thanospizza.t_commande to 'livreur';
GRANT SELECT, UPDATE ON db_thanospizza.t_livraison to 'livreur';
-- CAISSE
CREATE ROLE 'caisse';
GRANT CREATE, DELETE, SELECT, UPDATE ON db_thanospizza.t_paiement to 'caisse';
GRANT SELECT ON db_thanospizza.t_commande to 'caisse';

-- ANALYSTE
CREATE ROLE 'analyste';
GRANT SELECT ON db_thanospizza.* to 'analyste';

-- USERS
CREATE USER 'tony'@'localhost' IDENTIFIED BY  '1234';
CREATE USER 'bruce'@'localhost' IDENTIFIED BY  '1234';
CREATE USER 'steve'@'localhost' IDENTIFIED BY  '1234';
CREATE USER 'samuel'@'localhost' IDENTIFIED BY  '1234';
CREATE USER 'thor'@'localhost' IDENTIFIED BY  '1234';
CREATE USER 'peter'@'localhost' IDENTIFIED BY  '1234';

-- GRANT ROLES
GRANT 'admin' TO 'tony'@'localhost';
GRANT 'analyste' TO 'bruce'@'localhost';
GRANT 'manager' TO 'steve'@'localhost';
GRANT 'caisse' TO 'samuel'@'localhost' ;
GRANT 'pizzaiolo' TO 'thor'@'localhost';
GRANT 'livreur' TO 'peter'@'localhost' ;

