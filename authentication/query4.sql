-- CREATE TABLE users(
--     id BIGINT UNIQUE GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
--     name VARCHAR(50) NOT NULL
-- );

-- INSERT INTO users (name)VALUES
-- ('Kairn'), ('Flone');
-- SELECT * FROM users

-- -- DROP TABLE users

-- CREATE TABLE accounts(
--     id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
--     user_id INT NOT NULL REFERENCES users(id),
--     email VARCHAR(50) UNIQUE NOT NULL,
--     username VARCHAR(50) UNIQUE,
--     password_hash VARCHAR(255) NOT NULL,
--     created_at DATE DEFAULT CURRENT_DATE
-- );

-- INSERT INTO accounts(user_id, email, username, password_hash) VALUES
-- (1, 'kairn@gmail.com', 'Kairn', 'sgadfbuo8y3891r'),
-- (2, 'flone@gmail.com', 'Flone', 'dshb89981y19');

-- SELECT * FROM accounts

-- -- DROP TABLE accounts

-- CREATE TABLE sessions(
--     id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
--     account_id INT NOT NULL REFERENCES accounts(id),
--     session_token VARCHAR(50) UNIQUE NOT NULL,
--     created_at TIMESTAMPTZ,
--     expired_at TIMESTAMPTZ
-- );

-- INSERT INTO sessions(account_id, session_token, created_at, expired_at) VALUES
-- (1, 'jkadsnfuh103h1', '2026-10-20 10:30:00+02', '2026-10-20 18:45:00-05'),
-- (2, 'sjfejopjnqe139-', '2026-10-24 18:45:00-05', '2026-10-25 18:45:00+07')

-- SELECT * FROM sessions

-- -- DROP TABLE sessions

-- CREATE TABLE roles(
--     id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
--     role_id INT NOT NULL REFERENCES accounts(id),
--     role_name VARCHAR(50)
-- )
-- -- DROP TABLE roles

-- INSERT INTO roles(role_id, role_name) VALUES
-- (1, 'Admin'),
-- (1, 'User'),
-- (2, 'User')
-- SELECT * FROM roles

-- -- INSERT INTO roles (role_id, role_name)VALUES
-- -- (1, 'Admin');

-- SELECT role_name FROM roles;

-- SELECT users.id, sessions.account_id, sessions.session_token, roles.role_name, sessions.created_at, sessions.expired_at
-- FROM users
-- LEFT JOIN accounts
--     ON users.id = accounts.id
-- LEFT JOIN roles
--     ON accounts.id = roles.id
-- LEFT JOIN sessions
--     ON accounts.id = sessions.account_id

SELECT users.id, users.name, accounts.email, sessions.session_token, sessions.created_at, sessions.expired_at, roles.role_name
FROM users
JOIN accounts
    ON users.id = accounts.user_id
JOIN sessions
    on accounts.id = sessions.account_id
JOIN roles
    ON users.id = roles.role_id