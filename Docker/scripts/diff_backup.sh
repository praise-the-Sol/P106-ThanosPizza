#!/usr/bin/env bash
set -e

LAST=$(cat /var/lib/mysql-files/backup/last_full.txt)
OUT=/var/lib/mysql-files/backup/diff/diff_$(date +%F).sql

mkdir -p /var/lib/mysql-files/backup/diff

echo "SET FOREIGN_KEY_CHECKS=0;" > "$OUT"
echo "USE db_thanospizza;" >> "$OUT"

for T in t_commande t_ligne_commande t_paiement t_livraison t_article t_client t_adresse t_livreur vivre; do
  mysqldump -u root -proot db_thanospizza "$T" \
    --no-create-info --replace --complete-insert \
    --where="backup_date >= '$LAST'" >> "$OUT"
done

echo "SET FOREIGN_KEY_CHECKS=1;" >> "$OUT"
echo "OK: $OUT"
