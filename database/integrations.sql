CREATE USER IF NOT EXISTS integrator identified by 'secret';
CREATE DATABASE IF NOT EXISTS integrations;
GRANT ALL PRIVILEGES ON integrations.* to 'integrator'@'%';