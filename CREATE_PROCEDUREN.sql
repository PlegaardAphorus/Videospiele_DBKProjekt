use videospiele;

Delimiter //
Create procedure P_Bewertungen (IN P_UserID INT)
Begin 

Select Spiele.Name,Bewertung.* From Bewertung inner join Benutzer using (Benutzer_ID) inner join
Spiele_has_Benutzer using (Benutzer_ID) inner join Spiele using (Spiele_ID) Where Spiele.Spiele_ID =
Spiele_has_Benutzer.Spiele_ID;

End //
Delimiter ;


	