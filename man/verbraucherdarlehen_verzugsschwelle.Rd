\name{verbraucherdarlehen_verzugsschwelle}
\alias{verbraucherdarlehen_verzugsschwelle}
\title{Rückstandsschwellen bei Verbraucherdarlehen}
\description{Bei Teilzahlungsdarlehen: Nennbetrag mal10Prozent bei Vertragslaufzeit bis einschließlich3Jahre, mal5Prozent bei längerer Laufzeit, bei Immobiliar-Verbraucherdarlehen unabhängig davon mal2,5Prozent. Rückstand muss die Schwelle erreichen; zusätzlich mindestens zwei aufeinanderfolgende ganz oder teilweise im Verzug befindliche Teilzahlungen. Beide Merkmale getrennt und gemeinsam ausweisen.}
\usage{
verbraucherdarlehen_verzugsschwelle(nennbetrag = NULL,
  massgeblicher_rueckstand = NULL,
  vertragslaufzeit_jahre = NULL,
  anzahl_aufeinanderfolgender_verzugsraten = NULL,
  immobiliar_verbraucherdarlehen = NULL,
  teilzahlungsdarlehen = NULL)
}
\arguments{
  \item{nennbetrag}{Positiver Nennbetrag des Darlehens in EUR. Dezimalzeichenfolge oder exaktes Bruchobjekt mit den Zeichenfolgenfeldern zaehler und nenner nach NUMERIK.md. Maßstab ist der Nennbetrag, nicht automatisch der aktuelle Restschuldbetrag.}
  \item{massgeblicher_rueckstand}{Nichtnegativer rechtlich maßgeblicher Rückstand nach §498 in EUR. Dezimalzeichenfolge oder exaktes Bruchobjekt mit den Zeichenfolgenfeldern zaehler und nenner nach NUMERIK.md. Verzugszuordnung und einzubeziehende Bestandteile werden ausdrücklich vom Nutzer bestimmt; keine ungeprüfte Summe sämtlicher Nebenforderungen und keine automatische Verzugsberechnung.}
  \item{vertragslaufzeit_jahre}{Gesamte vereinbarte positive Vertragslaufzeit in Jahren, nicht die Restlaufzeit. Dezimalzeichenfolge oder exaktes Bruchobjekt mit den Zeichenfolgenfeldern zaehler und nenner nach NUMERIK.md. Ganze vertragliche Monate können exakt als Monate/12 angegeben werden; keine pauschale Umrechnung von Kalendertagen mit365 oder360. Maßgebliche vertragliche Dauer vorab bestimmen. Bei Immobiliar-Verbraucherdarlehen optional NULL, da dort die Quote unabhängig von der Laufzeit ist; wird ein Wert übergeben, muss er dennoch positiv und gültig sein.}
  \item{anzahl_aufeinanderfolgender_verzugsraten}{Nichtnegative ganze Zahl bis9007199254740991 der unmittelbar aufeinanderfolgenden Teilzahlungen, mit denen der Darlehensnehmer ganz oder teilweise im Verzug ist. Keine bloße Gesamtzahl verstreuter Rückstände; die zeitliche Zuordnung wird vorgegeben.}
  \item{immobiliar_verbraucherdarlehen}{Expliziter Wahrheitswert zur Einordnung als Immobiliar-Verbraucherdarlehen. TRUE wählt unabhängig von der Laufzeit die Quote2,5Prozent nach Abs.2. Anwendungsbereich des Verbraucherdarlehensrechts, einschließlich etwaiger Verweisfälle, vorab bestimmen.}
  \item{teilzahlungsdarlehen}{Expliziter Wahrheitswert, ob das Darlehen in Teilzahlungen zu tilgen ist. FALSE ergibt NICHT_ANWENDBAR; keine automatische Übertragung der Rückstandsregel auf andere Kündigungsfälle.}
}
\details{Nur §498 Abs.1 Satz1 Nr.1 undAbs.2. Der Eingabevertrag setzt den rechtlich bestimmten Anwendungsbereich des Verbraucherdarlehensrechts voraus; Verbrauchereigenschaft wird nicht allein aus einer Rollenbezeichnung abgeleitet. Kein vollständiges Kündigungsrecht, keine Kündigungserklärung und keine Restschuldabrechnung. Die erfolglose zweiwöchige Zahlungsfrist mit Restschuldandrohung nach Nr.2 sowie die Gesprächsangebotsregel und weitere Wirksamkeitsvoraussetzungen sind gesondert zu prüfen. Keine automatische Entscheidung darüber, welche Forderungsbestandteile in den maßgeblichen Rückstand fallen.}
\value{wert enthält rueckstandsquote (dimensionsloser exakter Bruch), mindestrueckstand (exakter EUR-Bruch), rueckstandsschwelle_erreicht, mindestens_zwei_aufeinanderfolgende_raten und voraussetzungen_nummer_1_erfuellt (Wahrheitswerte). BERECHNET bedeutet durchgeführte Teilprüfung, nicht automatisch ein Kündigungsrecht. Bei NICHT_ANWENDBAR ist wert null. Fehler als bgb_berechnungsfehler mit EINGABE_FEHLT oder EINGABE_UNGUELTIG.}
\examples{
verbraucherdarlehen_verzugsschwelle("10000", "1000", "3", 2, FALSE, TRUE)
}
