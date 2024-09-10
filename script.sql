-- 1. Création du type ENUM pour les rôles
CREATE TYPE member_role AS ENUM ('member', 'admin');

-- 2. Création de la table members avec le rôle en ENUM et le nom isadmin_members
CREATE TABLE members (
    id_members SERIAL PRIMARY KEY,
    pseudo_members VARCHAR(255) NOT NULL,
    password_members VARCHAR(255) NOT NULL,
    isadmin_members member_role DEFAULT 'member' NOT NULL
);

-- Création de la table drugs avec une clé étrangère vers members
CREATE TABLE drugs (
    id_drugs SERIAL PRIMARY KEY,
    nom_drugs VARCHAR(255) NOT NULL,
    quantity_drugs INTEGER NOT NULL,
    argent_drugs DECIMAL(10, 2) NOT NULL,
    fk_members_drugs INTEGER NOT NULL,
    date_drugs DATE NOT NULL,
    CONSTRAINT fk_members
      FOREIGN KEY (fk_members_drugs) 
      REFERENCES members(id_members)
      ON DELETE CASCADE
);

-- Création de la table wallet
CREATE TABLE wallet (
    id_wallet SERIAL PRIMARY KEY,
    dirty_money_wallet DECIMAL(15, 2) DEFAULT 0 NOT NULL
);

-- Insertion d'un portefeuille initial
INSERT INTO wallet (dirty_money_wallet) VALUES (0);
