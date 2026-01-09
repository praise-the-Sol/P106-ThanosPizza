set -e
BASE=/var/lib/mysql-files/backup
LAST=$(tr -d '\r\n' < "$BASE/dernier_complet.txt")
OUT="$BASE/diff/diff_$(date +%F).sql"
mkdir -p "$BASE/diff"
echo "SET FOREIGN_KEY_CHECKS=0;" > "$OUT"
echo "USE db_thanospizza;" >> "$OUT"
for T in t_commande t_ligne_commande t_paiement t_livraison t_article t_client t_adresse t_livreur vivre; do
  mysqldump -u root -proot db_thanospizza "$T" \
    --no-create-info --replace --complete-insert \
    --where="backup_date >= '$LAST'" >> "$OUT"
done
echo "SET FOREIGN_KEY_CHECKS=1;" >> "$OUT"
echo "OK: $OUT (depuis $LAST)"
