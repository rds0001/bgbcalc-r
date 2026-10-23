% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{nachlass_dreimonatseinrede}
\alias{nachlass_dreimonatseinrede}
\title{nachlass dreimonatseinrede}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{nachlass_dreimonatseinrede(
  annahme_erbschaft_am = NULL,
  nachlasspflegerbestellung_am = NULL,
  inventarerrichtung_am = NULL,
  prueftag = NULL,
  erbe_haftet_unbeschraenkt = NULL,
  glaeubiger_nach_2016_ausgenommen = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{annahme_erbschaft_am}{Optionales ISO-Datum der wirksamen Annahme, spätestens Prüftag. NULL bedeutet noch nicht eingetreten, nicht unbekannt; dann ist qualifizierte vorherige Pflegerbestellung erforderlich.}
\item{nachlasspflegerbestellung_am}{Optionales ISO-Datum der Bestellung zur Verwaltung des Nachlasses nach§2017, spätestens Prüftag. Keine beliebige Pflegschaft. Frühere Bestellung startet Frist; spätere Bestellung verlängert nicht. NULL bedeutet nicht eingetreten.}
\item{inventarerrichtung_am}{Optionales ISO-Datum der rechtlich wirksamen Inventarerrichtung, spätestens Prüftag; beendet Einrede bereits ab diesem Ereignis. NULL bedeutet bis Prüftag nicht errichtet, nicht unbekannte Aktenlage.}
\item{prueftag}{ISO-Datum des Prüftags; Ergebnis gilt nach Abschluss dieses Tages. Eingetragene tatsächliche Ereignisse dürfen nicht danach liegen.}
\item{erbe_haftet_unbeschraenkt}{Expliziter Wahrheitswert der unbeschränkten Erbenhaftung nach§2016 Absatz1; TRUE schließt diese Einrede aus.}
\item{glaeubiger_nach_2016_ausgenommen}{Expliziter Wahrheitswert der Ausnahme§2016 Absatz2/§1971 einschließlich gesetzlicher Einschränkung für erst nach Erbfall erlangte Vollstreckungs-/Arrestrechte oder einstweilige Vormerkung. Nicht jede Sicherheit ist automatisch Ausnahme.}
\item{einordnungsnachweis}{Nichtleere Begründung von Annahme/Verwaltungspfleger, Inventar, Haftung und Gläubigerstatus.}
}
\details{Drei Monate ab Annahme oder früherer Verwaltungspflegerbestellung; Einrede am Prüftag nur innerhalb Frist, ohne bereits errichtetes Inventar, ohne unbeschränkte Haftung und ohne Gläubigerausnahme. Keine automatische Ausübung oder Aussage über andere Einreden. Inventar beendet ab Ereignis; Modell taggenau zum Tagesende. Keine pauschale Frist ab Erbfall und keine erneute Frist durch spätere Pflegerbestellung. ISO-Daten und berechnete Grenzen0001..9999, explizite Wahrheitswerte und nichtleerer Nachweis.}
\value{wert enthält fristbeginnereignis_am, dreimonatsfristende, inventar_beendet_einrede und verweigerungsrecht_am_prueftag. Negative Voraussetzung ergibt BERECHNET mit FALSE. Einheit: daten_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2014_T0001, BGB_2016_T0001, BGB_2016_T0002, BGB_2017_T0001}
\examples{
nachlass_dreimonatseinrede(
  annahme_erbschaft_am = "2030-01-31",
  nachlasspflegerbestellung_am = NULL,
  inventarerrichtung_am = NULL,
  prueftag = "2030-04-30",
  erbe_haftet_unbeschraenkt = FALSE,
  glaeubiger_nach_2016_ausgenommen = FALSE,
  einordnungsnachweis = paste0(
    "Synthetisch qualifizierte Annahme und Gläubigerstatus; kein ",
    "Inventar bis Prüftag."
  )
)
}
