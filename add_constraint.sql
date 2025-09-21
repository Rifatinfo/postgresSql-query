
-- Adding a primary key 

CREATE TABLE links (
    link_id INT,
    url VARCHAR(255)
)

ALTER TABLE links
ADD CONSTRAINT link_id_pk PRIMARY KEY(link_id);


--  Adding a Foreign key 

ALTER TABLE links
ADD COLUMN email VARCHAR(200),
ADD CONSTRAINT users_email_unique UNIQUE (email);


