INSERT INTO `poste` (`nom_poste`) VALUES
('Responsable dépôt'),
('Sécurité'),
('Magasinier'),
('Comptable');



-- Insérer un utilisateur avec le poste "Responsable dépôt"
INSERT INTO `tusers` (`id_user`,`login`, `password`, `salt`, `firstname`, `lastname`, `profile`, `mail`, `phone`, `mobile`, `fax`, `function`, `company`, `address1`, `address2`, `zip`, `city`, `custom1`, `custom2`, `disable`, `chgpwd`, `last_login`, `last_pwd_chg`, `auth_attempt`, `ip`, `skin`, `default_ticket_state`, `dashboard_ticket_order`, `limit_ticket_number`, `limit_ticket_days`, `limit_ticket_date_start`, `language`, `ldap_guid`, `ldap_sid`, `azure_ad_id`, `planning_color`,`numero_poste`)
VALUES (68,'utilisateur1', 'motdepasse1', 'salt1', 'John', 'Doe', 1, 'john.doe@example.com', '123456789', '987654321', '0123456789', 'Responsable dépôt', 1, 'Adresse1', 'Adresse2', '12345', 'Ville1', 'customA', 'customB', 0, 0, '2023-01-01 12:00:00', '2023-01-01', 0, '127.0.0.1', 'skin1', 'open', 'order1', 10, 5, '2023-01-01', 'fr_FR', 'guid1', 'sid1', 'azure1', '#FF0000', 1);

-- Insérer un utilisateur avec le poste "Sécurité"
INSERT INTO `tusers` (`id_user`,`login`, `password`, `salt`, `firstname`, `lastname`, `profile`, `mail`, `phone`, `mobile`, `fax`, `function`, `company`, `address1`, `address2`, `zip`, `city`, `custom1`, `custom2`, `disable`, `chgpwd`, `last_login`, `last_pwd_chg`, `auth_attempt`, `ip`, `skin`, `default_ticket_state`, `dashboard_ticket_order`, `limit_ticket_number`, `limit_ticket_days`, `limit_ticket_date_start`, `language`, `ldap_guid`, `ldap_sid`, `azure_ad_id`, `planning_color`,`numero_poste`)
VALUES (69,'utilisateur2', 'motdepasse2', 'salt2', 'Jane', 'Smith', 2, 'jane.smith@example.com', '987654321', '123456789', '9876543210', 'Sécurité', 2, 'Adresse3', 'Adresse4', '54321', 'Ville2', 'customX', 'customY', 0, 0, '2023-01-02 12:00:00', '2023-01-02', 0, '192.168.1.1', 'skin2', 'closed', 'order2', 20, 7, '2023-01-02', 'en_US', 'guid2', 'sid2', 'azure2', '#00FF00', 2);

INSERT INTO `tusers` (`id_user`,`login`, `password`, `salt`, `firstname`, `lastname`, `profile`, `mail`, `phone`, `mobile`, `fax`, `function`, `company`, `address1`, `address2`, `zip`, `city`, `custom1`, `custom2`, `disable`, `chgpwd`, `last_login`, `last_pwd_chg`, `auth_attempt`, `ip`, `skin`, `default_ticket_state`, `dashboard_ticket_order`, `limit_ticket_number`, `limit_ticket_days`, `limit_ticket_date_start`, `language`, `ldap_guid`, `ldap_sid`, `azure_ad_id`, `planning_color`,`numero_poste`)
VALUES (70,'5664', 'motdepasse2', 'salt2', 'Rakotosoa', 'Jao', 2, 'jao.rakotosoa@dzama.com', '987654321', '123456789', '9876543210', 'Sécurité', 2, 'Adresse3', 'Adresse4', '54321', 'Ville2', 'customX', 'customY', 0, 0, '2023-01-02 12:00:00', '2023-01-02', 0, '192.168.1.1', 'skin2', 'closed', 'order2', 20, 7, '2023-01-02', 'en_US', 'guid2', 'sid2', 'azure2', '#00FF00', 2);

INSERT INTO `tusers` (`id_user`,`login`, `password`, `salt`, `firstname`, `lastname`, `profile`, `mail`, `phone`, `mobile`, `fax`, `function`, `company`, `address1`, `address2`, `zip`, `city`, `custom1`, `custom2`, `disable`, `chgpwd`, `last_login`, `last_pwd_chg`, `auth_attempt`, `ip`, `skin`, `default_ticket_state`, `dashboard_ticket_order`, `limit_ticket_number`, `limit_ticket_days`, `limit_ticket_date_start`, `language`, `ldap_guid`, `ldap_sid`, `azure_ad_id`, `planning_color`,`numero_poste`)
VALUES (71,'1225', 'motdepasse2', 'salt2', 'Rajaonarivelo', 'Lova', 2, 'lova.rajaonarivelo@dzama.com', '987654321', '123456789', '9876543210', 'Sécurité', 2, 'Adresse3', 'Adresse4', '54321', 'Ville2', 'customX', 'customY', 0, 0, '2023-01-02 12:00:00', '2023-01-02', 0, '192.168.1.1', 'skin2', 'closed', 'order2', 20, 7, '2023-01-02', 'en_US', 'guid2', 'sid2', 'azure2', '#00FF00', 2);

INSERT INTO `tusers` (`id_user`,`login`, `password`, `salt`, `firstname`, `lastname`, `profile`, `mail`, `phone`, `mobile`, `fax`, `function`, `company`, `address1`, `address2`, `zip`, `city`, `custom1`, `custom2`, `disable`, `chgpwd`, `last_login`, `last_pwd_chg`, `auth_attempt`, `ip`, `skin`, `default_ticket_state`, `dashboard_ticket_order`, `limit_ticket_number`, `limit_ticket_days`, `limit_ticket_date_start`, `language`, `ldap_guid`, `ldap_sid`, `azure_ad_id`, `planning_color`,`numero_poste`)
VALUES (72,'2523', 'motdepasse2', 'salt2', 'Rakotovao', 'Rivo Tonny', 2, 'rivotonny.rakotovao@dzama.com', '987654321', '123456789', '9876543210', 'Sécurité', 2, 'Adresse3', 'Adresse4', '54321', 'Ville2', 'customX', 'customY', 0, 0, '2023-01-02 12:00:00', '2023-01-02', 0, '192.168.1.1', 'skin2', 'closed', 'order2', 20, 7, '2023-01-02', 'en_US', 'guid2', 'sid2', 'azure2', '#00FF00', 2);

DELETE FROM portail;
INSERT INTO portail (numero_portail) values (1), (2), (3);

INSERT INTO securiser (numero_portail, numero_securite) values 
    (1, 69), (1, 70), (2, 71), (3, 72);

INSERT INTO transport_depot (numero_immatricule, designe_transport) VALUES 
    (1, '2674 TBN'),
    (2, '2675 TBN'),
    (3, '2688 TBN'),
    (4, '2111 TBN');

ALTER TABLE sortie_depot drop column numero_immatricule;
ALTER TABLE sortie_depot add column numero_immatricule INTEGER DEFAULT NULL;

create or replace view securite_details as 
    select 
        users_details.*,
        securiser.numero_portail
    from users_details
    join securiser on users_details.id_user = securiser.numero_securite;

create or replace view responsabledepot as
    select 
        tusers.*,
        poste.nom_poste as poste
    from tusers
    join poste on tusers.numero_poste = poste.numero_poste
    where poste.numero_poste = 1;

create or replace view entree_depot_details as
    select 
        entree_depot.*,
        CONCAT(tusers.firstname , ' ' , tusers.lastname) as responsable
    from entree_depot
    join tusers on tusers.id_user = entree_depot.id_user;


create or replace view users_details as
    select 
        tusers.*,
        poste.nom_poste as poste
    from tusers
    join poste on tusers.numero_poste = poste.numero_poste;


create or replace view sortie_depot_details as
    select 
        sortie_depot.*,
        CONCAT(tusers.firstname , ' ' , tusers.lastname) as responsable,
        sortie_count.nombre >= 1 as passage_securite1,
        sortie_count.nombre >= 2 as passage_securite2,
        sortie_count.nombre >= 3 as passage_securite3,
        sortie_count.nombre as nombre_validation,
        transport_depot.designe_transport as transport
    from sortie_depot
    join (
        select 
            sortie_depot.numero_sortie,
            CASE WHEN confirmer.numero_sortie IS NOT NULL 
                THEN COUNT(confirmer.numero_sortie)
                ELSE 0
            END AS nombre
        from sortie_depot
        left join confirmer on confirmer.numero_sortie = sortie_depot.numero_sortie
        GROUP BY sortie_depot.numero_sortie
    ) as sortie_count on sortie_count.numero_sortie = sortie_depot.numero_sortie
    join tusers on tusers.id_user = sortie_depot.id_user
    left join transport_depot on transport_depot.numero_immatricule = sortie_depot.numero_immatricule;

