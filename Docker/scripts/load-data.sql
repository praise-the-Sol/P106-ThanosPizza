-- t_adresse
load data infile 't_adresse.csv' 
into table t_adresse 
character set utf8mb4 
fields terminated by ',' 
ENCLOSED BY "'"
lines terminated by '\r\n' 
ignore 1 lines 
(adresse_id, client_fk, rue, ville, npa, longitude, latitude);

-- t_article
load data infile 't_article.csv' 
into table t_article 
character set utf8mb4 
fields terminated by ',' 
ENCLOSED BY "'"
lines terminated by '\r\n' 
ignore 1 lines 
(article_id, type, nom, prix_ttc, tva, etat);

-- t_client
load data infile 't_client.csv' 
into table t_client
character set utf8mb4 
fields terminated by ',' 
ENCLOSED BY "'"
lines terminated by '\r\n' 
ignore 1 lines 
(client_id, nom, prenom, mail, tel);

-- t_commande
load data infile 't_commande.csv' 
into table t_commande
character set utf8mb4 
fields terminated by ',' 
ENCLOSED BY "'"
lines terminated by '\r\n' 
ignore 1 lines 
(commande_id, client_fk, type, adresse_fk, date, statut);

-- t_ligne_commande
load data infile 't_ligne_commande.csv' 
into table t_ligne_commande
character set utf8mb4 
fields terminated by ',' 
ENCLOSED BY "'"
lines terminated by '\r\n' 
ignore 1 lines 
(ligne_commande_id, commande_fk, article_fk, quanite, prix_unitaire, parent_fk);

-- t_livraison
load data infile 't_livraison.csv' 
into table t_livraison
character set utf8mb4 
fields terminated by ',' 
ENCLOSED BY "'"
lines terminated by '\r\n' 
ignore 1 lines 
(livraison_id, commande_fk, livreur_fk, statut, depart, arrive);

-- t_livreur
load data infile 't_livreur.csv' 
into table t_livreur 
character set utf8mb4 
fields terminated by ',' 
ENCLOSED BY "'"
lines terminated by '\r\n' 
ignore 1 lines 
(livreur_id, code, nom, disponible);

-- t_paiement
load data infile 't_paiement.csv' 
into table t_paiement 
character set utf8mb4 
fields terminated by ',' 
ENCLOSED BY "'"
lines terminated by '\r\n' 
ignore 1 lines
(paiement_id, commande_id, mode, montant, date_paiement);