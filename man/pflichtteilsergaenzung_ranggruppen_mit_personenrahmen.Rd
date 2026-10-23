% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{pflichtteilsergaenzung_ranggruppen_mit_personenrahmen}
\alias{pflichtteilsergaenzung_ranggruppen_mit_personenrahmen}
\title{pflichtteilsergaenzung ranggruppen mit personenrahmen}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{pflichtteilsergaenzung_ranggruppen_mit_personenrahmen(
  fehlbetrag = NULL,
  schenkungsgruppen = NULL,
  personenrahmen = NULL,
  kuerzungsmethode = NULL,
  methodennachweis = NULL
)}
\arguments{
\item{fehlbetrag}{Nichtnegativer rechtlich bestimmter Ergänzungsfehlbetrag.}
\item{schenkungsgruppen}{Liste1..1000; je Person und Zeitpunkt genau eine Gruppe: beschenkter_id, schenkungsrang, schenkungswert, einzelhaftungsgrenze. Höherer Rang=spätere Schenkung, gleicher Rang=qualifiziert gleichzeitig. Mehrere Geschenke derselben Person am selben Zeitpunkt vorab als rechtlich einheitliche Gruppe erfassen.}
\item{personenrahmen}{Liste: beschenkter_id, gemeinsame_haftungsgrenze. Genau alle Empfänger; rechtliche Grenze für diesen Anspruch, nicht bloße Zahlungsfähigkeit.}
\item{kuerzungsmethode}{Zwingend rechtlich qualifiziert: anteilige_kuerzung_ohne_umverteilung oder begrenzte_umverteilung. Keine automatische Rechtsentscheidung bei Sonderkürzungen.}
\item{methodennachweis}{Zeitordnung, Schenkungswerte, rechtliche Einzel-/Personengrenzen und Behandlung von Kürzungen innerhalb einer Gleichzeitigkeitsgruppe ausdrücklich begründen.}
}
\details{Chronologische Gruppen mit gleichzeitig wertproportionaler Verteilung und ausdrücklich qualifizierter Kappungsmethode unter einmaligen Personenrahmen abarbeiten. Bedingte arithmetische2329III-Komposition: spätere Gruppen zuerst; gleichzeitig nach Schenkungswerten. Individuelle Kapazität=min(Gruppengrenze,Schenkungswert,noch unverbrauchter Personenrahmen). Bei anteilige_kuerzung_ohne_umverteilung erst Wertquote am kleineren Betrag aus Restfehlbetrag/Gesamtgruppenwert und danach persönliche Kappung; bei begrenzte_umverteilung proportional mit Kappung und Neuverteilung auf übrige Gruppenmitglieder. Nur tatsächlich zugeordnete Beträge verbrauchen den gemeinsamen Personenrahmen; rechtlich nicht gedeckter Rest geht zum früheren Rang. Kein doppelter Personenrahmen über mehrere Ränge. Die beiden Methoden sind ausdrücklich bedingte Rechenmodelle, keine Behauptung, dass beide gesetzlich zulässig sind. Rechtsfrage zusätzlicher Kürzungen bei Gleichzeitigkeit bleibt vom Anwender anhand seines Falls zu entscheiden; bloße Insolvenz macht spätere Verpflichtung nicht automatisch unwirksam. Keine gewöhnliche Geldhaftung statt qualifizierter Sachherausgabe unterstellen. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{Gruppenanteile in Eingabereihenfolge, verbleibende Personenrahmen und ungedeckter Fehlbetrag; keine automatische rechtliche Methodenwahl. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2329_T0001, BGB_2329_T0002, BGB_2329_T0003, BGB_2329_T0004}
\examples{
pflichtteilsergaenzung_ranggruppen_mit_personenrahmen(
  fehlbetrag = "100",
  schenkungsgruppen = list(
    list(
    "beschenkter_id" = "A",
    "schenkungsrang" = 2,
    "schenkungswert" = "60",
    "einzelhaftungsgrenze" = "60"
  ),
    list(
    "beschenkter_id" = "B",
    "schenkungsrang" = 2,
    "schenkungswert" = "40",
    "einzelhaftungsgrenze" = "40"
  ),
    list(
    "beschenkter_id" = "A",
    "schenkungsrang" = 1,
    "schenkungswert" = "100",
    "einzelhaftungsgrenze" = "100"
  ),
    list(
    "beschenkter_id" = "C",
    "schenkungsrang" = 1,
    "schenkungswert" = "100",
    "einzelhaftungsgrenze" = "100"
  )
  ),
  personenrahmen = list(
    list(
    "beschenkter_id" = "A",
    "gemeinsame_haftungsgrenze" = "30"
  ),
    list(
    "beschenkter_id" = "B",
    "gemeinsame_haftungsgrenze" = "100"
  ),
    list(
    "beschenkter_id" = "C",
    "gemeinsame_haftungsgrenze" = "100"
  )
  ),
  kuerzungsmethode = "anteilige_kuerzung_ohne_umverteilung",
  methodennachweis = paste0(
    "Bedingte arithmetische2329III-Komposition: spätere Gruppen z",
    "uerst; gleichzeitig nach Schenkungswerten. Individuelle Kapa",
    "zität=min(Gruppengrenze,Schenkungswert,noch unverbrauchter P",
    "ersonenrahmen). Bei anteilige_kuerzung_ohne_umverteilung ers",
    "t Wertquote am kleineren Betrag aus Restfehlbetrag/Gesamtgru",
    "ppenwert und danach persönliche Kappung; bei begrenzte_umver",
    "teilung proportional mit Kappung und Neuverteilung auf übrig",
    "e Gruppenmitglieder. Nur tatsächlich zugeordnete Beträge ver",
    "brauchen den gemeinsamen Personenrahmen; rechtlich nicht ged",
    "eckter Rest geht zum früheren Rang. Kein doppelter Personenr",
    "ahmen über mehrere Ränge. Die beiden Methoden sind ausdrückl",
    "ich bedingte Rechenmodelle, keine Behauptung, dass beide ges",
    "etzlich zulässig sind. Rechtsfrage zusätzlicher Kürzungen be",
    "i Gleichzeitigkeit bleibt vom Anwender anhand seines Falls z",
    "u entscheiden; bloße Insolvenz macht spätere Verpflichtung n",
    "icht automatisch unwirksam. Keine gewöhnliche Geldhaftung st",
    "att qualifizierter Sachherausgabe unterstellen."
  )
)
}
