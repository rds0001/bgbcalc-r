% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{schenkung_unterhaltsrueckforderung}
\alias{schenkung_unterhaltsrueckforderung}
\title{schenkung unterhaltsrueckforderung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{schenkung_unterhaltsrueckforderung(
  unterhaltsbedarf = NULL,
  eigene_deckungsmittel = NULL,
  beschenkte = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{unterhaltsbedarf}{Qualifizierter Unterhaltsbedarf eines einheitlichen Zeitraums in EUR, nichtnegative Dezimalzeichenfolge oder Bruchobjekt.}
\item{eigene_deckungsmittel}{Rechtlich anzurechnende Deckungsmittel für denselben Zeitraum, nichtnegativer exakter EUR-Betrag.}
\item{beschenkte}{Liste höchstens1000 Objekte mit eindeutiger beschenkten_id, eindeutigem ganzzahligem schenkungsrang 1..1000000 (höher bedeutet später), bereicherungsgrenze und leistungsfaehigkeitsgrenze als nichtnegative exakte EUR-Beträge. Jede Person nur einmal mit einer Schenkung; rechtliche Ausschlüsse durch bereicherungsgrenze null berücksichtigen.}
\item{einordnungsnachweis}{Nichtleerer Nachweis der qualifizierten Bedürftigkeit, einheitlichen Bezugsperiode, rechtlichen Grenzen und eindeutigen Schenkungsrangfolge. Keine Schätzung durch Bibliothek.}
}
\details{Positiven Unterhaltsfehlbetrag bilden; absteigende qualifizierte Schenkungsränge, jeweils min(Restfehlbetrag, Bereicherung, Leistungsfähigkeit). Nur qualifizierte Geldbeträge eines einheitlichen Unterhaltszeitraums nach §§528/529. Jede Person genau einmal mit einem eindeutigen Schenkungsrang; höherer Rang bedeutet später beschenkt. Gleichzeitig Beschenkte und mehrere Schenkungen an dieselbe Person mit konkurrierenden Rängen sind nicht erfasst. Bedarf umfasst rechtlich berücksichtigungsfähigen eigenen Unterhalt und gesetzliche Unterhaltspflichten. Bereicherungsgrenze muss Bereicherungsrecht, bereits erfolgte Rückzahlungen und Ausschlüsse nach §529 Absatz1 berücksichtigen; ausgeschlossene Schenkung mit null. Leistungsfähigkeitsgrenze ist nach §529 Absatz2 unter Berücksichtigung sonstiger Verpflichtungen rechtlich bestimmter verfügbarer Geldbetrag. Keine automatische Bewertung von Sachgeschenken, Unterhalt, Leistungsfähigkeit, Bedürftigkeit, Frist oder Anspruchsausschluss; keine wiederholte Nutzung derselben verbleibenden Bereicherung ohne Fortschreibung. Abwendung durch Unterhaltszahlung, Fälligkeit/Rückstände nach §§760/1613 und Tod nach §1615 gesondert qualifizieren. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält unterhaltsfehlbetrag, verteilung je beschenkten_id mit rueckforderungsbetrag in absteigender Rangfolge, gesamtbetrag und ungedeckter_fehlbetrag, jeweils EUR-Bruchobjekte. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_528_T0001, BGB_528_T0004, BGB_529_T0002}
\examples{
schenkung_unterhaltsrueckforderung(
  unterhaltsbedarf = "1000",
  eigene_deckungsmittel = "400",
  beschenkte = list(
    list(
    "beschenkten_id" = "frueher",
    "schenkungsrang" = 1,
    "bereicherungsgrenze" = "1000",
    "leistungsfaehigkeitsgrenze" = "1000"
  ),
    list(
    "beschenkten_id" = "spaeter",
    "schenkungsrang" = 2,
    "bereicherungsgrenze" = "200",
    "leistungsfaehigkeitsgrenze" = "300"
  )
  ),
  einordnungsnachweis = paste0(
    "Qualifizierte Geldgeschenke verschiedener Personen, eindeuti",
    "ge Ränge und rechtliche Grenzen derselben Periode."
  )
)
}
