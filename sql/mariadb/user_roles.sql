-- Documentation
-- CREATE [OR REPLACE] ROLE [IF NOT EXISTS] role
-- [WITH ADMIN
-- {CURRENT_USER | CURRENT_ROLE | user | role}]

-- Create roles
CREATE ROLE IF NOT EXISTS 'admin';
CREATE ROLE IF NOT EXISTS 'floki_user';

-- admin permissions
GRANT ALL PRIVILEGES ON test.* TO 'admin';

-- user permissions (limited)
GRANT SELECT, INSERT, UPDATE ON test.* TO 'floki_user';

-- Create test users with different roles
CREATE USER IF NOT EXISTS 'admin'@'localhost' IDENTIFIED BY 'admin_pass123';
CREATE USER IF NOT EXISTS 'floki_user'@'localhost' IDENTIFIED BY 'user_pass123';

-- Assign roles to users
GRANT 'admin' TO 'admin'@'localhost';
GRANT 'floki_user' TO 'floki_user'@'localhost';

-- Test users with spesific permissions
CREATE USER IF NOT EXISTS 'test_user'@'localhost' IDENTIFIED BY 'test_pass123';
CREATE USER IF NOT EXISTS 'test_admin'@'localhost' IDENTIFIED BY 'test_admin_pass123';

-- Grant specific permissions to test users
GRANT ALL PRIVILEGES ON test.* TO 'test_admin'@'localhost';
GRANT SELECT, INSERT, UPDATE ON test.* TO 'test_user'@'localhost';

-- Test users with limited permissions
-- Log in as test_user and try to delete all plants
-- DELETE FROM plant WHERE id = 1;

-- Force users to change password on first login
ALTER USER 'test_user'@'localhost' PASSWORD EXPIRE;
ALTER USER 'floki_user'@'localhost' PASSWORD EXPIRE;

-- Verify setup with these queries:
SHOW GRANTS FOR 'admin'@'localhost';
SHOW GRANTS FOR 'floki_user'@'localhost';

-- Creating a new user
CREATE USER IF NOT EXISTS 'Floki_kasutaja'@'localhost' IDENTIFIED BY 'Rakenduse_salas6na';


-- Granting permissions to a new user
GRANT SELECT, INSERT, UPDATE, DELETE ON testdb.* TO 'Floki_kasutaja'@'localhost';

FLUSH PRIVILEGES;

-- display permissions for a user
SHOW GRANTS FOR 'Floki_kasutaja'@'localhost';
