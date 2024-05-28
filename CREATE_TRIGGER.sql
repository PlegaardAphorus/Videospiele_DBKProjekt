use videospiele;

Delimiter //
Create Trigger T_SpieleDatum before insert on Spiele for each row 
Begin 

if spiele.erscheinungsdatum = current_date() then

	SINGAL SQLSTATE "45000" SET MESSAGE_TEXT = "Es kann kein Spiel in der Zukunft erscheinen", 
    MYSQL_ERRNO = "404";
    
elseif year(spiele.erscheinungsdatum)  1952
    
    




End //

Delimiter ;  