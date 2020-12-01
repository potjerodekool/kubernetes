CREATE USER integrations identified by 'secret';
CREATE DATABASE integrations;
GRANT ALL PRIVILEGES ON integrations.* to 'integrations'@'%';