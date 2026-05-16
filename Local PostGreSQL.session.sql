CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(250) NOT NULL UNIQUE,
    password VARCHAR(250) NOT NULL,
    access_token TEXT,
    session_start TIMESTAMP
);

-- Indice esplicito su email (oltre al vincolo UNIQUE)
CREATE INDEX idx_users_email ON users(email);