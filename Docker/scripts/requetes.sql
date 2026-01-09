-- REQUÊTE 1
SELECT a.nom, SUM(lc.quantite) AS quantites_totales
FROM t_ligne_commande AS lc
JOIN t_article AS a
ON a.article_id = lc.article_fk
WHERE a.type = 'pizza'
GROUP BY a.article_id, a.nom
ORDER BY quantites_totales DESC
LIMIT 10;

-- REQUÊTE 2
SELECT a.nom, SUM(lc.quantite) AS nombre_toppings
FROM t_ligne_commande AS lc
JOIN t_article AS a
ON a.article_id = lc.article_fk
WHERE a.type = 'topping'
GROUP BY a.article_id, a.nom
ORDER BY nombre_toppings DESC;

-- REQUÊTE 3
SELECT DATE(c.date_) AS date, ROUND(SUM(lc.quantite * lc.prix_unitaire), 2) AS chiffre_affaire
FROM t_commande c
JOIN t_ligne_commande lc
ON lc.commande_fk = c.commande_id
WHERE TRIM(LOWER(c.statut)) LIKE 'livr%'
GROUP BY date
ORDER BY date;

-- REQUÊTE 4
SELECT a.npa, a.ville, ROUND(SUM(lc.quantite * lc.prix_unitaire), 2) AS chiffre_affaire
FROM t_commande AS c
JOIN t_adresse AS a
ON a.adresse_id = c.adresse_fk
JOIN t_ligne_commande AS lc 
ON c.commande_id = lc.commande_fk
WHERE TRIM(LOWER(c.type)) = 'livraison'
AND
TRIM(LOWER(c.statut)) LIKE 'livr%'
GROUP BY a.npa, a.ville
ORDER BY chiffre_affaire DESC;

-- REQUÊTE 5
SELECT HOUR(c.date_) AS heure, COUNT(*) AS nombre_commandes
FROM t_commande c
GROUP BY HOUR(c.date_)
ORDER BY nombre_commandes DESC, heure ASC;

-- REQUÊTE 6
SELECT cl.nom, cl.prenom, COUNT(co.commande_id) AS nombre_commandes
FROM t_client AS cl
JOIN t_commande AS co
ON cl.client_id = co.client_fk
GROUP BY cl.client_id, cl.nom, cl.prenom
HAVING COUNT(co.commande_id) >= 5
ORDER BY nombre_commandes DESC, cl.nom ASC, cl.prenom ASC;

-- REQUÊTE 7
SELECT c.commande_id, ROUND(SUM(lc.quantite * lc.prix_unitaire), 2) AS somme_du
FROM t_commande AS c
JOIN t_ligne_commande AS lc
ON c.commande_id = lc.commande_fk
GROUP BY c.commande_id
ORDER BY c.commande_id ASC;

-- REQUÊTE 8
SELECT p.commande_fk, ROUND(SUM(p.montant_paye), 2) AS total
FROM t_paiement AS p
GROUP BY p.commande_fk
ORDER BY p.commande_fk ASC;

-- REQUÊTE 9
SELECT c.type, COUNT(*) AS type_commandes
FROM t_commande AS c
GROUP BY c.type
ORDER BY type_commandes DESC;

-- REQUÊTE 10
SELECT l.livreur_id, l.nom, ROUND(AVG(TIMESTAMPDIFF(MINUTE, liv.depart, liv.arrive)), 2) AS temps_moyen
FROM t_commande AS c
JOIN t_livraison liv ON liv.livraison_id = c.livraison_fk
JOIN t_livreur AS l
ON l.livreur_id = liv.livreur_fk
WHERE TRIM(LOWER(c.type)) = 'livraison'
AND TRIM(LOWER(c.statut)) LIKE 'livr%'
AND liv.depart IS NOT NULL
AND liv.arrive IS NOT NULL
GROUP BY l.livreur_id, l.nom
ORDER BY temps_moyen ASC;