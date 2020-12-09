CREATE USER IF NOT EXISTS authentication identified by 'secret';
CREATE DATABASE IF NOT EXISTS authentication;
GRANT ALL PRIVILEGES ON authentication.* to 'authentication'@'%';

