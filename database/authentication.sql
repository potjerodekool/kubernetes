CREATE USER authentication identified by 'secret';
CREATE DATABASE authentication;
GRANT ALL PRIVILEGES ON authentication.* to 'authentication'@'%';

