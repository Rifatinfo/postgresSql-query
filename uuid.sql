CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL
);

CREATE EXTENSION IF NOT EXISTS "pgcrypto";

INSERT INTO users (name, email)
VALUES ('Alice', 'alice@example.com'),
       ('Bob', 'bob@example.com');

SELECT * FROM users;
