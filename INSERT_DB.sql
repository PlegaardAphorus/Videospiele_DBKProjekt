INSERT INTO `achievements` (`Achievements`, `Spiele_ID`, `Name`, `Beschreibung`, `Bedingungen`, `Belohnung`) VALUES
	(1, 1, 'Platin-Trophäe', 'Verdiene alle Trophäen im Spiel.', 'Schließe alle Missionen ab', 'Spezielle In-Game-Belohnungen'),
	(3, 4, 'Überlebenskünstler', 'Überlebe in der postapokalyptischen Welt.', 'Überlebe 100 Tage in der Wildnis', 'In-Game-Trophäe'),
	(4, 5, 'Landwirtschaftsguru', 'Erreiche Meisterschaft in der Landwirtschaft.', 'Ernte 100 Felder', 'Spezielle Fahrzeuge'),
	(6, 2, 'Der erste Start', 'Bekomme deinen ersten Holzstamm', '1 Holzstamm im Inventar', 'Erfahrungspunkte'),
	(7, 3, 'Abenteurer', 'Entdecke die tiefsten Geheimnisse des Ozeans.', 'Erkunde alle Unterwasserhöhlen', 'Exklusive Tauchausrüstung');

INSERT INTO `achievements_has_benutzer` (`Achievements`, `Benutzer_ID`) VALUES
	(1, 1),
	(4, 1),
	(6, 1),
	(6, 2),
	(3, 3),
	(6, 3),
	(3, 4),
	(4, 5),
	(6, 5);

INSERT INTO `benutzer` (`Benutzer_ID`, `Name`, `Erstellungsdatum`, `Anzahl_Freunde`, `Gesamtspielzeit`, `E-mail`, `Gebursdatum`, `Meist_gespieltes_Spiel`, `Kuerzlich_gespieltes_Spiel`) VALUES
	(1, 'Max Mustermann', '2024-05-14', 50, 350.5, 'max.mustermann@example.com', '1990-01-01', 1, 3),
	(2, 'Erika Musterfrau', '2024-05-14', 30, 220.75, 'erika.musterfrau@example.com', '1995-03-15', 2, 5),
	(3, 'John Doe', '2024-05-14', 20, 150.25, 'john.doe@example.com', '1985-07-20', 3, 4),
	(4, 'Jane Doe', '2024-05-14', 40, 280, 'jane.doe@example.com', '1988-12-10', 4, 2),
	(5, 'Alice Wonderland', '2024-05-14', 15, 100, 'alice.wonderland@example.com', '2000-05-05', 5, 1);

INSERT INTO `bewertung` (`Bewertung_ID`, `Benutzer_ID`, `Bewertung`, `Bewertungs_Datum`, `Metacritic-Score`) VALUES
	(1, 1, 'Ein unglaubliches Spiel, das mich seit Jahren fesselt.', '2024-05-14', 95),
	(2, 2, 'Minecraft ist ein zeitloser Klassiker!', '2024-05-14', 93),
	(3, 4, 'Bethesda hat es wieder einmal geschafft, eine immersive Welt zu schaffen.', '2024-05-14', 87),
	(4, 5, 'Der Simulator bietet eine entspannende Landwirtschaftserfahrung.', '2024-05-14', 80),
	(5, 4, 'Ein echtes Meisterwerk!', '2024-05-15', 98);

INSERT INTO `entwickler` (`Entwickler_ID`, `Name`, `Bekannte Spiele`, `Gründungsjahr`, `Main-Engine`, `Hauptsitz`) VALUES
	(1, 'Rockstar Games', 10, '1998-12-01', 'Rockstar Advanced Game Engine', 'New York, USA'),
	(2, 'Mojang Studios', 2, '2009-05-17', 'Java', 'Stockholm, Sweden'),
	(3, 'Dream Haven', 1, '2020-09-01', 'Unreal Engine 4', 'California, USA'),
	(4, 'Bethesda Game Studios', 15, '2001-06-28', 'Creation Engine', 'Maryland, USA'),
	(5, 'GIANTS Software', 10, '2004-08-11', 'GIANTS Engine', 'Switzerland');

INSERT INTO `entwickler_has_genre` (`Entwickler_ID`, `Genre`) VALUES
	(1, 1),
	(2, 1),
	(4, 1),
	(5, 1),
	(2, 2),
	(3, 3),
	(4, 3),
	(5, 4),
	(5, 5);

INSERT INTO `entwickler_has_spiele` (`Entwickler_ID`, `Spiele_ID`) VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5);

INSERT INTO `genre` (`Genre`, `Name`, `Beschreibung`) VALUES
	(1, 'Open World', 'Spiel, das den Spielern eine offene Spielwelt zum Erkunden bietet'),
	(2, 'Survival', 'Spiel, in dem die Spieler ums Überleben kämpfen müssen'),
	(3, 'Fantasy', 'Spiel mit einer fiktiven, magischen Welt'),
	(4, 'Simulation', 'Spiel, das eine realistische Erfahrung in einem bestimmten Bereich bietet'),
	(5, 'Strategie', 'Spiel, das taktisches Denken und strategische Planung erfordert');

INSERT INTO `genre_has_spiele` (`Genre`, `Spiele_ID`) VALUES
	(1, 1),
	(1, 2),
	(2, 2),
	(1, 3),
	(3, 3),
	(1, 4),
	(2, 4),
	(3, 4),
	(1, 5),
	(4, 5),
	(5, 5);

INSERT INTO `launcher` (`Launcher_ID`, `Name`, `Entwickler`, `Erscheinungsdatum`) VALUES
	(1, 'Steam', 1, '2003-09-12'),
	(2, 'Epic Games Launcher', 2, '2018-12-06'),
	(3, 'Origin', 3, '2011-06-03'),
	(4, 'Battle.net', 4, '1996-12-31'),
	(5, 'Uplay', 5, '2012-06-07');

INSERT INTO `launcher_has_spiele` (`Launcher_Launcher_ID`, `Spiele_Spiele_ID`) VALUES
	(1, 1),
	(2, 1),
	(1, 3),
	(2, 3),
	(1, 4),
	(1, 5),
	(2, 5);

INSERT INTO `plattformen` (`Plattformen_ID`, `Name`) VALUES
	(5, 'Mobile'),
	(4, 'Nintendo Switch'),
	(1, 'PC'),
	(2, 'PlayStation'),
	(3, 'Xbox');

INSERT INTO `plattformen_has_spiele` (`Plattformen_ID`, `Spiele_ID`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(1, 2),
	(2, 2),
	(3, 2),
	(4, 2),
	(5, 2),
	(1, 3),
	(2, 3),
	(3, 3),
	(1, 4),
	(2, 4),
	(3, 4),
	(1, 5),
	(2, 5),
	(3, 5),
	(4, 5),
	(5, 5);

INSERT INTO `publisher` (`Publisher_ID`, `Name`, `Bekannte Spiele`, `Gründungsjahr`, `Hauptsitz`) VALUES
	(1, 'Rockstar Games', 20, '1998-12-01', 'New York, USA'),
	(2, 'Microsoft Studios', 15, '2000-03-01', 'Redmond, USA'),
	(3, 'Dream Haven', 5, '2020-09-01', 'California, USA'),
	(4, 'Bethesda Softworks', 25, '1986-06-28', 'Maryland, USA'),
	(5, 'Focus Home Interactive', 30, '1996-08-11', 'Paris, France');

INSERT INTO `publisher_has_spiele` (`Publisher_ID`, `Spiele_ID`) VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5);

INSERT INTO `spiele` (`Spiele_ID`, `Name`, `Erscheinungsdatum`, `Erschienen`, `Deutsch`, `Englisch`, `USK`) VALUES
	(1, 'Grand Theft Auto V', '2013-09-17', 1, 0, 1, 18),
	(2, 'Minecraft', '2011-11-18', 1, 1, 1, 6),
	(3, 'Still Wakes the Deep', '2024-06-18', 0, 0, 1, 16),
	(4, 'Fallout 4', '2015-11-10', 1, 1, 1, 18),
	(5, 'Farming Simulator 22', '2021-11-21', 1, 1, 1, 0);

INSERT INTO `spiele_has_benutzer` (`Spiele_ID`, `Benutzer_ID`) VALUES
	(1, 1),
	(2, 1),
	(4, 1),
	(5, 1),
	(1, 2),
	(2, 2),
	(4, 2),
	(5, 2),
	(1, 3),
	(2, 3),
	(4, 3),
	(5, 3),
	(1, 4),
	(2, 4),
	(4, 4),
	(5, 4),
	(1, 5),
	(2, 5),
	(4, 5),
	(5, 5);

INSERT INTO `spielstände` (`Spielstände_ID`, `Benutzer_ID`, `Name`, `Datum`) VALUES
	(1, 1, 'Letzter Checkpoint', '2024-05-14'),
	(2, 2, 'Gipfel erreicht', '2024-05-14'),
	(3, 4, 'Überlebensmodus', '2024-05-14'),
	(4, 5, 'Erntezeit', '2024-05-14'),
	(5, 4, 'Neues Spiel gestartet', '2024-05-15');

INSERT INTO `tags` (`Tags_ID`, `Name`, `Beschreibung`) VALUES
	(1, 'Action', 'Spiel mit einem Fokus auf Action-Szenen'),
	(2, 'Abenteuer', 'Spiel, das die Spieler auf eine Reise durch eine fesselnde Welt führt'),
	(3, 'RPG', 'Rollenspiel mit tiefgreifenden Charakteranpassungsmöglichkeiten'),
	(4, 'Simulation', 'Spiel, das eine realistische Erfahrung in einem bestimmten Bereich bietet'),
	(5, 'Strategie', 'Spiel, das taktisches Denken und strategische Planung erfordert');

INSERT INTO `tags_has_spiele` (`Tags_ID`, `Spiele_ID`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(2, 2),
	(5, 2),
	(1, 3),
	(2, 3),
	(1, 4),
	(2, 4),
	(3, 4),
	(3, 5),
	(4, 5),
	(5, 5);

INSERT INTO `verkäufer` (`Verkäufer_ID`, `Name`, `Standort`, `Zahlungsart`, `Versandoptionen`, `Email`) VALUES
	(1, 'GameStop', 'USA', 'Kreditkarte, PayPal', 'Standard, Express', 'info@gamestop.com'),
	(2, 'Amazon', 'USA', 'Kreditkarte, Amazon Pay', 'Prime, Standard', 'info@amazon.com'),
	(3, 'Steam Store', 'USA', 'Kreditkarte, Steam Wallet', 'Digital', 'info@steam.com'),
	(4, 'Ubisoft Store', 'Frankreich', 'Kreditkarte, Uplay Points', 'Digital', 'info@ubisoft.com'),
	(5, 'GOG.com', 'Polen', 'Kreditkarte, PayPal, Bitcoin', 'Digital', 'info@gog.com');

INSERT INTO `verkäufer_has_spiele` (`Verkäufer_ID`, `Spiele_ID`) VALUES
	(3, 1),
	(4, 1),
	(5, 1),
	(1, 2),
	(4, 2),
	(5, 2),
	(1, 3),
	(2, 3),
	(5, 3),
	(1, 4),
	(2, 4),
	(3, 4),
	(2, 5),
	(3, 5),
	(4, 5);

INSERT INTO `verkäufer` (`Verkäufer_ID`, `Name`, `Standort`, `Zahlungsart`, `Versandoptionen`, `Email`) VALUES
	(1, 'GameStop', 'USA', 'Kreditkarte, PayPal', 'Standard, Express', 'info@gamestop.com'),
	(2, 'Amazon', 'USA', 'Kreditkarte, Amazon Pay', 'Prime, Standard', 'info@amazon.com'),
	(3, 'Steam Store', 'USA', 'Kreditkarte, Steam Wallet', 'Digital', 'info@steam.com'),
	(4, 'Ubisoft Store', 'Frankreich', 'Kreditkarte, Uplay Points', 'Digital', 'info@ubisoft.com'),
	(5, 'GOG.com', 'Polen', 'Kreditkarte, PayPal, Bitcoin', 'Digital', 'info@gog.com');

INSERT INTO `verkäufer_has_spiele` (`Verkäufer_ID`, `Spiele_ID`) VALUES
	(3, 1),
	(4, 1),
	(5, 1),
	(1, 2),
	(4, 2),
	(5, 2),
	(1, 3),
	(2, 3),
	(5, 3),
	(1, 4),
	(2, 4),
	(3, 4),
	(2, 5),
	(3, 5),
	(4, 5);