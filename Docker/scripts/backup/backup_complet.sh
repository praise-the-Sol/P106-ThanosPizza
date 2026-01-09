set -e
BASE=/var/lib/mysql-files/backup
mkdir -p "$BASE/complet" "$BASE/diff"
FULL_FILE="$BASE/complet/ complet_$(date +%F).sql"
mysqldump -u root -proot \
  --single-transaction --routines --events --triggers \
  --databases db_thanospizza \
  > "$FULL_FILE"
date "+%F %T" > "$BASE/dernier_complet.txt"
echo "OK FULL: $FULL_FILE"
echo "last_full=$(cat "$BASE/dernier_complet.txt")"
