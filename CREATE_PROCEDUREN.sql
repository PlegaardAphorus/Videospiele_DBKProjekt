use videospiele;

Delimiter //
Create procedure P_Bewertungen (IN P_UserID INT)
Begin 

Select Spiele.Name,Bewertung.* From Bewertung inner join Benutzer using (Benutzer_ID) inner join
Spiele_has_Benutzer using (Benutzer_ID) inner join Spiele ON Spiele.Spiele_ID = Bewertung.Spiele_ID GROUP BY (Bewertung_ID) HAVING Benutzer_ID = P_UserID ;

End //
Delimiter ;

CALL P_Bewertungen(1);

DROP PROCEDURE P_Bewertungen;	