-- lignes de départ (à répéter à la fin de la transaction pour vérifier)
SELECT commande_id, statut FROM t_commande WHERE commande_id = 8;
SELECT * FROM t_paiement WHERE commande_fk = 8;
-- Bonne transaction
START TRANSACTION;
UPDATE t_commande
SET statut = 'annulée'
WHERE commande_id = 8
AND
TRIM(LOWER(statut)) NOT LIKE 'livr%';
INSERT INTO t_paiement (commande_fk, montant_paye)
SELECT 8, -ROUND(SUM(montant_paye), 2)
FROM t_paiement
WHERE commande_fk = 8
HAVING SUM(montant_paye) > 0;
-- COMMIT;

-- lignes de départ (à répéter à la fin de la transaction pour vérifier)
SELECT commande_id, statut FROM t_commande WHERE commande_id = 15;
SELECT * FROM t_paiement WHERE commande_fk = 15;

-- transaction avec rollback
START TRANSACTION;
UPDATE t_commande
SET statut = 'annulée'
WHERE commande_id = 15
AND
TRIM(LOWER(statut)) NOT LIKE 'livr%';
INSERT INTO t_paiement (comande_fk, montant_paye) -- il devrait il y avoir un message d'erreur ici
SELECT 15, -ROUND(SUM(montant_paye), 2)
FROM t_paiement
WHERE commande_fk = 15
HAVING SUM(montant_paye) > 0;

-- ROLLBACK;