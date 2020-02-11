create database practice;
create user 'practice'@'localhost' identified by 'practice';
grant all privileges on practice.* to 'practice'@'localhost';
flush privileges;