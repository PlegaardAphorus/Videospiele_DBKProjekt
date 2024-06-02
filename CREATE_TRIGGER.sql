use videospiele;

Delimiter //
Create Trigger T_SpieleDatum before insert on videospiele.Spiele for each row 
Begin 
if new.Erscheinungsdatum > current_date() then 	
	SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Der angegebene Wert kann nicht in der Zukunft liegen", 
    MYSQL_ERRNO = "404";
elseif new.Erscheinungsdatum < "1952-01-01" then 
	SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Es kann kein Spiel vor den Jahre 1952 erscchienen sein! ", 
    MYSQL_ERRNO = "405";
else 
	SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Sie haben einen Wert eingegeben der nicht den erwarteten Parameter entspricht´", MYSQL_ERRNO = "406";
end if ;
End //
Delimiter ;  

Delimiter //
Create Trigger T_Gruendungsjahr_Publisher before insert on Publisher for each row 
Begin 
if new.gründungsjahr > current_date() then
	SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Der angegebene Wert kann nicht in der Zukunft liegen", MYSQL_ERRNO = "404";
else 
	SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Sie haben einen Wert eingegeben der nicht den erwarteten Parameter entspricht´", MYSQL_ERRNO = "406";
End if ;
End //
Delimiter ;

Delimiter //
Create Trigger T_Verkaeufer  before insert on Verkäufer for each row 
Begin 
if new.e-mail not like "%@%" then 
	SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Eine e-mail muss ein @ inhalten und kann auch nur ein @ inhalten", MYSQL_ERRNO = "409";
else 
	SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Der angegebene Wert kann nicht in der Zukunft liegen", MYSQL_ERRNO = "404";

Delimiter //
Create Trigger T_Bewertungs_Datum before insert on Bewertung for each row 
Begin
if  new.bewertungs_datum > current_date() then
	SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Der angegebene Wert kann nicht in der Zukunft liegen", 
    MYSQL_ERRNO = "404";
else 
SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Sie haben einen Wert eingegeben der nicht den erwarteten Parameter entspricht´", MYSQL_ERRNO = "406";
End if ;
End //
Delimiter ;

Delimiter //
Create Trigger T_Spielstaende_Datum before insert on spielstände for each row 
Begin
if  new.Datum > current_date() then
	SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Der angegebene Wert kann nicht in der Zukunft liegen", MYSQL_ERRNO = "404";
else 
SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Sie haben einen Wert eingegeben der nicht den erwarteten Parameter entspricht´", MYSQL_ERRNO = "406";
End if ;
End //
Delimiter ;

Delimiter //
Create Trigger T_Benutzer before insert on Benutzer for each row 
Begin
if new.erstellungsdatum > current_date() then
	SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Der angegebene Wert kann nicht in der Zukunft liegen", MYSQL_ERRNO = "404";
elseif new.Anzahl_Freunde < 0 then 
	SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Der Wert kann nicht kleiner sein als 0", MYSQL_ERRNO = "407";
elseif new.meist_gespieltes_Spiel > new.Gesamtspielzeit then
	SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Der Benutzer kann nicht mehr Spielzeit in einem Spiel haben als er gesamt in allen hat", MYSQL_ERRNO = "408";
elseif new.e-mail not like "%@%" then 
	SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Eine e-mail muss ein @ beinhalten und kann auch nur ein @ inhalten", MYSQL_ERRNO = "409";
elseif new.gebursdatum > current_data() then 
	SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Der angegebene Wert kann nicht in der Zukunft liegen", MYSQL_ERRNO = "404";
else 
	SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Der angegebene Wert kann nicht in der Zukunft liegen", MYSQL_ERRNO = "404";
End if; 
End //
Delimiter ;