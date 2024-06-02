use videospiele;

CREATE VIEW V_Benutzer AS SELECT Benutzer_ID, Name, Erstellungsdatum, Anzahl_Freunde, Gesamtspielzeit, Meist_gespieltes_Spiel, Kuerzlich_gespieltes_Spiel FROM Videospiele.Benutzer;
CREATE VIEW V_Verkäufer AS SELECT Verkäufer_ID, Name, Standort, Zahlungsart, Versandoptionen FROM Videospiele.Verkäufer;

Create Role 'Admin', 'Mitarbeiter', 'Praktikant';
Drop Role 'Admin', 'Mitarbeiter', 'Praktikant';

Create User 'F.Lingnau'@'localhost' identified by '2709';
Create User 'L.Graef'@'localhost' identified by '2709';
Create User 'Professor.I.Gidd'@'localhost' identified by '2709';
Create User 'M.Burns'@'localhost'identified by '2709';
Drop User 'F.Lingnau'@'localhost';
Drop User 'L.Graef'@'localhost';
Drop User 'Professor.I.Gidd'@'localhost';
Drop User 'M.Burns'@'localhost';

Grant All Privileges on videospiele.* To 'Admin';
Grant Select on videospiele.* To 'Mitarbeiter';
Grant Delete on videospiele.* To 'Mitarbeiter';
Grant Insert on videospiele.* To 'Mitarbeiter';
Grant Update on videospiele.* To 'Mitarbeiter';
Grant Alter on videospiele.* To 'Mitarbeiter';
Grant Select on achievements To 'Praktikant';
Grant Select on achievements_has_benutzer To 'Praktikant';
Grant Select on bewertung To 'Praktikant';
Grant Select on entwickler To 'Praktikant';
Grant Select on  entwickler_has_genre To 'Praktikant';
Grant Select on entwickler_has_spiele To 'Praktikant';
Grant Select on genre To 'Praktikant';
Grant Select on genre_has_spiele To 'Praktikant';
Grant Select on launcher To 'Praktikant';
Grant Select on launcher_has_spiele To 'Praktikant';
Grant Select on plattformen To 'Praktikant';
Grant Select on plattformen_has_spiele To 'Praktikant';
Grant Select on publisher To 'Praktikant';
Grant Select on publisher_has_spiele To 'Praktikant';
Grant Select on spiele_has_benutzer To 'Praktikant';
Grant Select on spielstände To 'Praktikant';
Grant Select on tags To 'Praktikant';
Grant Select on tags_has_spiele To 'Praktikant';
Grant Select on verkäufer To 'Praktikant';
Grant Select on verkäufer_has_spiele To 'Praktikant';


Grant 'Admin' TO  'Professor.I.Gidd'@'localhost';
Grant 'Mitarbeiter' TO  'L.Graef'@'localhost';
Grant 'Mitarbeiter' TO  'F.Lingnau'@'localhost';
Grant 'Praktikant' TO  'M.Burns'@'localhost';

SET DEFAULT ROLE ALL TO 'Professor.I.Gidd'@'localhost', 'L.Graef'@'localhost', 
'F.Lingnau'@'localhost', 'M.Burns'@'localhost';

flush privileges;