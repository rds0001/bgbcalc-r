
pacht_inventar_ausgleichsdifferenz <- function(uebernommener_gesamtschaetzwert_zu_endpreisen=NULL, zurueckzugewaehrender_gesamtschaetzwert_zu_endpreisen=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(uebernommener_gesamtschaetzwert_zu_endpreisen), .geld(zurueckzugewaehrender_gesamtschaetzwert_zu_endpreisen))
 .text(einordnungsnachweis,"einordnungsnachweis")
 eingaben <- list(uebernommener_gesamtschaetzwert_zu_endpreisen=uebernommener_gesamtschaetzwert_zu_endpreisen, zurueckzugewaehrender_gesamtschaetzwert_zu_endpreisen=zurueckzugewaehrender_gesamtschaetzwert_zu_endpreisen, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(.subtrahieren(werte[[1]],werte[[2]]), "BGB_PACHT_INVENTAR_AUSGLEICHSDIFFERENZ", eingaben, list(list(operation="Gesamtsch\u00e4tzwert des \u00fcbernommenen Inventars minus Gesamtsch\u00e4tzwert des zur\u00fcckzugew\u00e4hrenden Inventars, beide zu Preisen bei Pachtende")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("\u00a7582a Absatz3 bei qualifizierter Inventar\u00fcbernahme/-r\u00fcckgew\u00e4hr zum Sch\u00e4tzwert; entsprechend \u00a7590 Absatz3 bei qualifizierter wesentlicher Inventarverminderung w\u00e4hrend der Pachtzeit ohne gesetzliche Verwendungsausnahme. Im letzteren Fall sind Endpreise die einheitlichen Preise des rechtlich ma\u00dfgeblichen Zwischenabrechnungszeitpunkts; der zweite Bestand ist das dort verbleibende Inventar, nicht ein erfundener k\u00fcnftiger R\u00fcckgabebestand. Positives Ergebnis bezeichnet Ausgleich vom P\u00e4chter an Verp\u00e4chter, negatives Ergebnis den Betrag mit umgekehrter Richtung, null keinen Wertausgleich. Beide Inventarbest\u00e4nde mit Preisen desselben ma\u00dfgeblichen Abrechnungszeitpunkts bewerten, nicht historische Anfangspreise gegen aktuelle Endpreise. Rechtlich wirksam abgelehnte \u00fcberfl\u00fcssige/\u00fcberwertige St\u00fccke zuvor aus dem zur\u00fcckzugew\u00e4hrenden Bestand ausschlie\u00dfen. Keine Inventarbewertung, Eigentumsentscheidung oder zus\u00e4tzliche Schadensersatzrechnung."))
 ergebnis
}

pacht_holzmehrnutzung_wertersatz <- function(eingeschlagene_holzmenge=NULL, ordnungsgemaess_zulaessige_holzmenge=NULL, wert_je_mengeneinheit=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(eingeschlagene_holzmenge), .geld(ordnungsgemaess_zulaessige_holzmenge), .geld(wert_je_mengeneinheit))
 .text(einordnungsnachweis,"einordnungsnachweis")
 eingaben <- list(eingeschlagene_holzmenge=eingeschlagene_holzmenge, ordnungsgemaess_zulaessige_holzmenge=ordnungsgemaess_zulaessige_holzmenge, wert_je_mengeneinheit=wert_je_mengeneinheit, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(.multiplizieren(if(.vergleichen(werte[[1]],werte[[2]])>0) .subtrahieren(werte[[1]],werte[[2]]) else .bruch(0),werte[[3]]), "BGB_PACHT_HOLZMEHRNUTZUNG_WERTERSATZ", eingaben, list(list(operation="Positive Mehrmenge des Holzeinschlags gegen\u00fcber ordnungsgem\u00e4\u00df zul\u00e4ssiger Menge mit qualifiziertem Wert je gleicher Mengeneinheit multiplizieren")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("Nur \u00a7596a Absatz3 Satz2. Mengen beziehen sich auf denselben rechtlich ma\u00dfgeblichen Nutzungsumfang, Zeitraum und dieselbe Holzeinheit/-qualit\u00e4t; zul\u00e4ssige ordnungsgem\u00e4\u00dfe Nutzung und Wert extern qualifizieren. Bei verschiedenen Sortimenten oder Wertstufen getrennte \u00fcberschneidungsfreie Positionen rechnen, keine pauschale Preisannahme. Weiterer Schaden gesondert ohne Doppelz\u00e4hlung. Nicht Ernte-/Holzwertersatz f\u00fcr noch nicht getrennte Fr\u00fcchte nach Absatz1\u20133Satz1."))
 ergebnis
}
