% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{nachlass_aufgebotseinrede}
\alias{nachlass_aufgebotseinrede}
\title{nachlass aufgebotseinrede}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{nachlass_aufgebotseinrede(
  annahme_erbschaft_am = NULL,
  nachlasspflegerbestellung_am = NULL,
  aufgebotsantrag_am = NULL,
  massgebliches_jahresfristende = NULL,
  antrag_zugelassen = NULL,
  verfahrensbeendigung_am = NULL,
  prueftag = NULL,
  erbe_haftet_unbeschraenkt = NULL,
  glaeubiger_nach_2016_ausgenommen = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{annahme_erbschaft_am}{Optionales ISO-Datum der wirksamen Annahme bis Prüftag; NULL bedeutet noch nicht erfolgt und erfordert Verwaltungspflegerbestellung.}
\item{nachlasspflegerbestellung_am}{Optionales ISO-Datum der Bestellung zur Nachlassverwaltung§2017 bis Prüftag; frühere Bestellung startet Frist, spätere verlängert nicht. NULL bedeutet nicht eingetreten.}
\item{aufgebotsantrag_am}{ISO-Datum rechtlicher Antragstellung auf Einleitung des Aufgebotsverfahrens, spätestens Prüftag; nicht bloß Versand. Vorfristige Anträge bleiben in diesem Modell gesondert offen/NICHT_ANWENDBAR.}
\item{massgebliches_jahresfristende}{ISO-Datum der rechtlich maßgeblichen letzten Antragsgrenze nach Jahresgrundfrist und zulässigen Korrekturen. Mindestens Grundfrist; Verlängerung begründen.}
\item{antrag_zugelassen}{Wahrheitswert, ob der Antrag zum Prüftag zugelassen ist. Antragstellung allein genügt nicht; Zulassung muss nicht innerhalb derselben Jahresfrist liegen.}
\item{verfahrensbeendigung_am}{Optionales ISO-Datum rechtlicher Verfahrensbeendigung bis Prüftag. Bei Ausschließungsbeschluss oder Zurückweisung erst Rechtskraft§2015 Absatz3, nicht Erlass. NULL bedeutet noch nicht rechtlich beendet, auch bei noch nicht rechtskräftigem Beschluss.}
\item{prueftag}{ISO-Datum; Prüfung nach Abschluss dieses Tages. Tatsächlich angegebene Ereignisse dürfen nicht danach liegen.}
\item{erbe_haftet_unbeschraenkt}{Wahrheitswert der unbeschränkten Erbenhaftung; schließt Einrede nach§2016 Absatz1 aus.}
\item{glaeubiger_nach_2016_ausgenommen}{Wahrheitswert der rechtlich qualifizierten Gläubigerausnahme§2016 Absatz2/§1971 einschließlich Einschränkung nachträglich erworbener Sicherungsrechte.}
\item{einordnungsnachweis}{Nichtleere Begründung von Fristbeginn, Antrag, Jahreskorrekturen, Zulassung, Rechtskraft/sonstiger Beendigung sowie Haftung und Gläubigerstatus.}
}
\details{Jahresfrist für Antrag ab Annahme oder früherer Verwaltungspflegerbestellung. Bei rechtzeitigem zugelassenem Antrag besteht Einrede bis rechtlicher Verfahrensbeendigung, vorbehaltlich§2016. Jahresfrist begrenzt Antrag, nicht Dauer der Einrede. Beendigung bei Beschluss erst Rechtskraft als qualifizierte Eingabe. Vorfristige Anträge gesondert offen. Keine automatische Ausübung oder vollständige Haftungsprüfung. ISO-Daten und berechnete Grenzen0001..9999, explizite Wahrheitswerte und nichtleerer Nachweis.}
\value{wert enthält fristbeginnereignis_am, rechnerisches_jahresfristende, aufgebotsantrag_rechtzeitig, verfahren_beendet und verweigerungsrecht_am_prueftag. Vorfristiger Antrag NICHT_ANWENDBAR/null. Einheit: daten_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2015_T0001, BGB_2015_T0003, BGB_2016_T0001, BGB_2016_T0002, BGB_2017_T0001}
\examples{
nachlass_aufgebotseinrede(
  annahme_erbschaft_am = "2030-01-31",
  nachlasspflegerbestellung_am = NULL,
  aufgebotsantrag_am = "2031-01-31",
  massgebliches_jahresfristende = "2031-01-31",
  antrag_zugelassen = FALSE,
  verfahrensbeendigung_am = NULL,
  prueftag = "2032-01-31",
  erbe_haftet_unbeschraenkt = FALSE,
  glaeubiger_nach_2016_ausgenommen = FALSE,
  einordnungsnachweis = paste0(
    "Synthetisch rechtzeitiger zugelassener Antrag, Verfahren noc",
    "h nicht rechtskräftig beendet."
  )
)
}
