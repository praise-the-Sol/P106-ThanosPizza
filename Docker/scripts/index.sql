-- REQUETE 1
CREATE INDEX idx_cmd_stat_date
ON t_commande (statut, date_creation);

-- REQUETE 2
CREATE INDEX idx_cmd_type_h
ON t_commande (type, date_creation, adresse_livraison_fk);