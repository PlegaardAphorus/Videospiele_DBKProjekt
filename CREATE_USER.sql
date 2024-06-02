use videospiele;

Create Role 'Admin', 'Mitarbeiter', 'Praktikant';

Create User 'F.Lingnau'@'localhost' identified by '2709';
Create User 'L.Graef'@'localhost' identified by '2709';
Create User 'Professor.I.Gidd'@'localhost' identified by '2709';
Create User 'M.Burns'@'localhost'identified by '2709';

GRANT ALL PRIVILEGES ON videospiele.* TO 'Admin';
GRANT SELECT, DELETE, INSERT, UPDATE, ALTER ON videospiele.* TO 'Mitarbeiter';
GRANT SELECT ON videospiele.* TO 'Praktikant';

GRANT 'Admin' TO 'Professor.I.Gidd'@'localhost';
GRANT 'Mitarbeiter' TO 'L.Graef'@'localhost', 'F.Lingnau'@'localhost';
GRANT 'Praktikant' TO 'M.Burns'@'localhost';

flush privileges;