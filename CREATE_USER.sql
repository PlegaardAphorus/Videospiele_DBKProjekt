use videospiele;


Create View V_Admin As Select achievements.Achievements, achievements.Spiele_ID, achievements.name as Achievement_Name, achievements.Beschreibung, achievements.Bedingungen, 
achievements.Belohnung, benutzer.Benutzer_ID, benutzer.name as Benutzer_Name, 
.Erstellungsdatum, benutzer.Anzahl_Freunde, benutzer.Gesamtspielzeit,benutzer.E-mail, 
benutzer.Gebursdatum, benutzer.Meist_gespieltes_Spiel, Kuerzlich_gespieltes_Spiel From achievements 
inner join achievements_has_benutzer using (Achievements) INNER JOIN Benutzer USING (Benutzer_ID);

Drop View V_Admin;

Create View V_Einkauf_Uebersicht_Lieferanten_Teile AS 
Select Lief_Nr,Lieferanten.Name, Count(TNR) From lieferanten inner join lieferprogramme using (Lief_Nr) 
group by Lief_Nr;

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