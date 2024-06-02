use videospiele;

-- Überprüfung des Erscheinungsdatums von Spielen

Delimiter //
Create Trigger T_SpieleDatum before insert on Spiele for each row 
Begin 

if spiele.erscheinungsdatum > current_date() then

	SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Der angegebene Wert kann nicht in der Zukunft liegen", 
    MYSQL_ERRNO = "404";
    
elseif year(spiele.erscheinungsdatum) < 1952 then 

	SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Es kann kein Spiel vor den Jahre 1952 erscchienen sein! ", 
    MYSQL_ERRNO = "405";
    
else 

SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Sie haben einen Wert eingegeben der nicht den erwarteten 
 Parameter entspricht´", 
    MYSQL_ERRNO = "406";
    
end if ;
  

End //

Delimiter ;  

-- Überprüfung des Gründungsjahres des Publishers 

Delimiter //
Create Trigger T_Gruendungsjahr_Publisher before insert on Publisher for each row 
Begin 

if publisher.gründungsjahr > current_date() then
	SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Der angegebene Wert kann nicht in der Zukunft liegen", 
    MYSQL_ERRNO = "404";

else 
SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Sie haben einen Wert eingegeben der nicht den erwarteten 
 Parameter entspricht´", 
    MYSQL_ERRNO = "406";

End if ;

End //
Delimiter ;

-- Trigger hinzufügen der die E-mail prüft 
-- Ist das erscheinungsdatum vom Launcher das gleiche wie von Spiele?


-- Überprüfung des Bewertungs_Datum 

Delimiter //
Create Trigger T_Bewertungs_Datum before insert on Bewertung for each row 
Begin

if  bewertungen.bewertungs_datum > current_date() then
	SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Der angegebene Wert kann nicht in der Zukunft liegen", 
    MYSQL_ERRNO = "404";

else 
SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Sie haben einen Wert eingegeben der nicht den erwarteten 
 Parameter entspricht´", 
    MYSQL_ERRNO = "406";

End if ;

End //
Delimiter ;

-- Überprüfung des Spielstaende_Datums

Delimiter //
Create Trigger T_Spielstaende_Datum before insert on spielstände for each row 
Begin

if  spielstände.Datum > current_date() then
	SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Der angegebene Wert kann nicht in der Zukunft liegen", 
    MYSQL_ERRNO = "404";

else 
SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Sie haben einen Wert eingegeben der nicht den erwarteten 
 Parameter entspricht´", 
    MYSQL_ERRNO = "406";

End if ;

End //
Delimiter ;


