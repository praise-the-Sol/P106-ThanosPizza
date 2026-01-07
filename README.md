# P106-ThanosPizza
P106-DB-ThanosPizza-Gestion d’une pizzeria avec livraisons
----------------------------------------------------------
Modéliser et implémenter la base de données d’une pizzeria (commandes, pizzas, ingrédients, clients, livreurs, zones de livraison, paiements). 
Charger des données, effectuer des requêtes SQL, définir des rôles et transactions, et mettre en place une stratégie de sauvegardes/restauration.
----------------------------------------------------------
# Explications
CHEMIN & FICHIERS				DESCRIPTION													STATUS
/Docker
	docker-compose.yml			-> chemin du volume script modifié 
	/scripts
		db-tables.sql			-> script de création de la db et des tables				OK
		index.sql				-> commandes d'index										à vérifier
		load-data.sql			-> charge les données										en cours
		requetes.sql			-> les requêtes 1 à 10										à vérifier
		roles-users.sql			-> création des rôles, des users et attribution des rôles	OK
		save-rest.sql			-> commandes de backup et de resotre						pas commencé
		transactions.sql		-> scénario de transaction									pas commencé
		/DATA					-> les fichiers .csv utilisés pour le load data
			t_adresse.csv
			t_article.csv
			t_client.csv
			t_commande.csv
			t_ligne_commande.csv
			t_livraison.csv
			t_livreur.csv
			t_paiement.csv
