# P106-ThanosPizza
P106-DB-ThanosPizza-Gestion d’une pizzeria avec livraisons

Modéliser et implémenter la base de données d’une pizzeria (commandes, pizzas, ingrédients, clients, livreurs, zones de livraison, paiements). 
Charger des données, effectuer des requêtes SQL, définir des rôles et transactions, et mettre en place une stratégie de sauvegardes/restauration.

-------------------------------------------
## Tables des matières
| Fichiers | Description |
|---|---|
| [`/Docker/docker-compose.yml`](https://github.com/praise-the-Sol/P106-ThanosPizza/blob/main/Docker/docker-compose.yml) | Chemin du volume "script" modifié |
| [`/Docker/scripts/db-tables.sql`](https://github.com/praise-the-Sol/P106-ThanosPizza/blob/main/Docker/scripts/db-table.sql) | Script de création de la db et des tables |
| [`/Docker/scripts/index.sql`](https://github.com/praise-the-Sol/P106-ThanosPizza/blob/main/Docker/scripts/index.sql) | Commandes d'indexation |
| [`/Docker/scripts/load-data.sql`](https://github.com/praise-the-Sol/P106-ThanosPizza/blob/main/Docker/scripts/load-data.sql) | Charge les données |
| [`/Docker/scripts/requetes.sql`](https://github.com/praise-the-Sol/P106-ThanosPizza/blob/main/Docker/scripts/requetes.sql) | Requêtes 1 à 10 |
| [`/Docker/scripts/roles-users.sql`](https://github.com/praise-the-Sol/P106-ThanosPizza/blob/main/Docker/scripts/roles-users.sql) | Création des rôles, des users et attribution des rôles |
| [`/Docker/scripts/transactions.sql`](https://github.com/praise-the-Sol/P106-ThanosPizza/blob/main/Docker/scripts/transactions.sql) | Scénario de transaction |
| [`/Docker/scripts/backup/backup_complet.sh`](https://github.com/praise-the-Sol/P106-ThanosPizza/blob/main/Docker/scripts/backup/backup_complet.sh) | Script du backup complet |
| [`/Docker/scripts/backup/backup_diff.sh`](https://github.com/praise-the-Sol/P106-ThanosPizza/blob/main/Docker/scripts/backup/backup_diff.sh) | Script du backup différentiel |
| [`/Docker/scripts/backup/dernier_complet.txt`](https://github.com/praise-the-Sol/P106-ThanosPizza/blob/main/Docker/scripts/backup/dernier_complet.txt) | Enregistre la date du dernier backup complet |
| [`/Docker/scripts/backup/tous_jours.txt`](https://github.com/praise-the-Sol/P106-ThanosPizza/blob/main/Docker/scripts/backup/tous_jours.txt) | Script de programmation de la sauvegarde différentielle (LU-SA) |
| [`/Docker/scripts/backup/tout_dimanche.txt`](https://github.com/praise-the-Sol/P106-ThanosPizza/blob/main/Docker/scripts/backup/tout_dimanche.txt) | Script de programmation de la sauvegarde complète (DI) |
|[`/Docker/scripts/backup/complet/`](https://github.com/praise-the-Sol/P106-ThanosPizza/tree/main/Docker/scripts/backup/complet) | Contient les backup complets |
| [`/Docker/scripts/backup/diff/`](https://github.com/praise-the-Sol/P106-ThanosPizza/tree/main/Docker/scripts/backup/diff) | Contient les backup différentiels |
| [`/Docker/scripts/DATA/`](https://github.com/praise-the-Sol/P106-ThanosPizza/tree/main/Docker/scripts/DATA) | Contient les données |

### Données
| Fichiers |
| --- |
| `t_adresse.csv` |
| `t_article.csv` |
| `t_client.csv` |
| `t_commande.csv` |
| `t_ligne_commande.csv` |
| `t_livraison.csv` |
| `t_livreur.csv` |
| `t_paiement.csv` |
|  `vivre.csv` |











