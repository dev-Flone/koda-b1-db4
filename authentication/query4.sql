CREATE TABLE users(
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE accounts(
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(id),
    email VARCHAR(50) UNIQUE NOT NULL,
    username VARCHAR(50) UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at DATE DEFAULT CURRENT_DATE
);

CREATE TABLE sessions(
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    account_id INT NOT NULL REFERENCES accounts(id),
    session_token VARCHAR(50) UNIQUE NOT NULL,
    created_at TIMESTAMPTZ,
    expired_at TIMESTAMPTZ
);
-- DROP TABLE sessions
-- CREATE TABLE roles(
--     id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
--     role_id INT NOT NULL REFERENCES users(id),
--     role_name VARCHAR(50)
-- )
-- DROP TABLE accounts
-- INSERT INTO users(name) VALUES
--     ('kairn'),
--     ('Flone'),
--     ('Kairn'),
--     ('Budi')

-- INSERT INTO accounts(email, username, user_id, password_hash) VALUES
-- ('test3@gmail.com', 'test3', 1, 'ajsdo;hf');
-- SELECT * FROM accounts
-- SELECT users.id, accounts.id
-- FROM users
-- JOIN accounts
--     ON users.id = accounts.id

-- INSERT INTO sessions(account_id, session_token, created_at, expired_at)VALUES
-- (6, 'oiybf81b39r8y', '2026-10-20 10:30:00+02', '2026-10-20 18:45:00-05')
-- SELECT * FROM sessions

-- INSERT INTO roles (role_id, role_name)VALUES
-- (1, 'Admin'),
-- (3, 'User'),
-- (5, 'Admin');

-- SELECT users.id, users.name, sessions.id, sessions.session_token, sessions.created_at, sessions.expired_at, roles.role_name
-- FROM users
-- LEFT JOIN accounts
--     ON users.id = accounts.id
-- LEFT JOIN sessions
--     ON accounts.id = sessions.account_id
-- LEFT JOIN roles
--     ON accounts.id = roles.id