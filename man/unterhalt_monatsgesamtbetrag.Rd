% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{unterhalt_monatsgesamtbetrag}
\alias{unterhalt_monatsgesamtbetrag}
\title{unterhalt monatsgesamtbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{unterhalt_monatsgesamtbetrag(
  monatsbetrag = NULL,
  erster_voller_monat = NULL,
  beendigung_am = NULL,
  zeitraumnachweis = NULL
)}
\arguments{
\item{monatsbetrag}{Konstanter rechtlich qualifizierter voller Monatsunterhalt als nichtnegative exakte EUR-Zahl; keine automatische Bedarfsbemessung.}
\item{erster_voller_monat}{ISO-Datum des ersten vollständig geschuldeten Monats, zwingend erster Tag. Teilweiser Erstmonat bleibt außerhalb.}
\item{beendigung_am}{ISO-Datum des gesetzlich einschlägigen Todes-/Wiederheiratsereignisses. Anspruch und Erhaltung des vollen Endmonats rechtlich vorqualifiziert, nicht vor Anfang.}
\item{zeitraumnachweis}{Nichtleerer Nachweis der einschlägigen Norm, des zulässigen Beendigungsgrundes, Vollmonatsanspruchs und konstanten Monatsbetrags.}
}
\details{Monatszahl=(Endjahr-Anfangsjahr)×12+Endmonat-Anfangsmonat+1; Gesamtbetrag=Monatszahl×konstanter Monatsbetrag. Konstanter qualifizierter voller Monatsbetrag und erster vollständig geschuldeter Monat. Letzter Monat ist rechtlich als voll geschuldeter Monat bestimmt: Tod nach§1361IV/1585I/1612III oder Wiederheirat nach§1585I, gegebenenfalls§1586II. Auch bei Beendigung am ersten oder letzten Tag zählt er voll. Keine tägliche Kürzung dieses Endmonats; kein automatischer voller Anfangsmonat bei erstmaliger Entstehung im Monatslauf. Abweichende Vereinbarungen/Bestimmungen nach§1612II und andere Endgründe nicht abgedeckt. Keine Ermittlung der Unterhaltshöhe, Zahlungsrückstände oder Fälligkeit an Bankarbeitstagen. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält monatsanzahl als Ganzzahl und gesamtbetrag als EUR-Bruch. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1361_T0006, BGB_1361_T0007, BGB_1585_T0002, BGB_1585_T0003, BGB_1612_T0005, BGB_1612_T0006, BGB_1586_T0003}
\examples{
unterhalt_monatsgesamtbetrag(
  monatsbetrag = "300",
  erster_voller_monat = "2030-01-01",
  beendigung_am = "2030-03-15",
  zeitraumnachweis = paste0(
    "Konstanter qualifizierter Vollmonatsanspruch; Tod im Endmona",
    "t, keine abweichende Bestimmung."
  )
)
}
