START TRANSACTION;
UPDATE t_commande
SET statut = 'annulée'
WHERE commande_id = 7
AND
TRIM(LOWER(statut)) NOT LIKE 'livr%';
INSERT INTO t_paiement (commande_fk, montant_paye)
SELECT 7, -ROUND(SUM(montant_paye), 2)
FROM t_paiement
WHERE commande_fk = 7
HAVING SUM(montant_paye) > 0;
COMMIT;