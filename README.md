# P106-ThanosPizza
P106-DB-ThanosPizza-Gestion d’une pizzeria avec livraisons

Modéliser et implémenter la base de données d’une pizzeria (commandes, pizzas, ingrédients, clients, livreurs, zones de livraison, paiements). 
Charger des données, effectuer des requêtes SQL, définir des rôles et transactions, et mettre en place une stratégie de sauvegardes/restauration.

-------------------------------------------
## Explications
| Fichiers principaux | Description | Status |
|---|---|---|
| `/Docker/docker-compose.yml` | chemin du volume "script" modifié | OK |
| `/Docker/scripts/db-tables.sql` | script de création de la db et des tables | OK |
| `/Docker/scripts/index.sql` | commandes d'indexation | OK |
| `/Docker/scripts/load-data.sql` | charge les données | OK |
| `/Docker/scripts/requetes.sql` | les requêtes 1 à 10 | OK |
| `/Docker/scripts/roles-users.sql` | création des rôles, des users et attribution des rôles | OK |
| `/Docker/scripts/save-rest.sql` | commandes de backup et de resotre | en cours |
| `/Docker/scripts/transactions.sql` | scénario de transaction | OK |

### Données

Emplacement : `/Docker/scripts/DATA/`

- `t_adresse.csv`
- `t_article.csv`
- `t_client.csv`
- `t_commande.csv`
- `t_ligne_commande.csv`
- `t_livraison.csv`
- `t_livreur.csv`
- `t_paiement.csv`
-  `vivre.csv`



