-- REQUETE 1
CREATE INDEX idx_cmd_stat_date
ON t_commande (statut, date_);

-- REQUETE 2
CREATE INDEX idx_cmd_type_h
ON t_commande (type, date_, adresse_fk);