use videospiele;

Create Role 'Admin', 'Mitarbeiter', 'Praktikant';

Create User 'F.Lingnau'@'localhost' identified by '2709';
Create User 'L.Graef'@'localhost' identified by '2709';
Create User 'Professor.I.Gidd'@'localhost' identified by '2709';
Create User 'M.Burns'@'localhost'identified by '2709';

Grant All Privileges on videospiele To 'Admin';
Grant Select on videospiele To 'Mitarbeiter';
Grant Delete on videospiele To 'Mitarbeiter';
Grant Insert on videospiele To 'Mitarbeiter';
Grant Update on videospiele To 'Mitarbeiter';
Grant Alter on videospiele To 'Mitarbeiter';
Grant Select on videospiele To 'Praktikant';

Grant 'Admin' TO  'Professor.I.Gidd'@'localhost';
Grant 'Mitarbeiter' TO  'L.Graef'@'localhost';
Grant 'Mitarbeiter' TO  'F.Lingnau'@'localhost';
Grant 'Praktikant' TO  'M.Burns'@'localhost';

flush privileges;