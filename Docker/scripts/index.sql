-- REQUETE 1
CREATE INDEX idx_stat_cmd
ON t_commande (statut, date_);


-- REQUETE 2
CREATE INDEX idx_npa
ON t_commande (type);