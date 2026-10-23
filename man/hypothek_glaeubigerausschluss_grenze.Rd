% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{hypothek_glaeubigerausschluss_grenze}
\alias{hypothek_glaeubigerausschluss_grenze}
\title{hypothek glaeubigerausschluss grenze}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{hypothek_glaeubigerausschluss_grenze(
  letzte_eintragung_am = NULL,
  letztes_fristwirksames_anerkenntnis_am = NULL,
  kalendertag_zahlung_am = NULL,
  inhaberschuldverschreibung = NULL,
  vorlegungsfristende_am = NULL,
  fristgemaesse_vorlegung_oder_klage = NULL,
  verjaehrungsende_am = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{letzte_eintragung_am}{ISO-Datum der letzten sich auf die Hypothek beziehenden Eintragung, nicht beliebiger späterer Grundbuchvorgang.}
\item{letztes_fristwirksames_anerkenntnis_am}{Optionales ISO-Datum des letzten innerhalb eines noch laufenden Fristlaufs wirksamen Anerkenntnisses212I1. Gegebenenfalls mehrfache vorausgehende Neubeginne rechtlich bereits geprüft; spätes Anerkenntnis nach abgelaufener Frist nicht als Neubeginn erfinden. Ohne solches Ereignis ausdrücklich null.}
\item{kalendertag_zahlung_am}{Optionaler rechtlich bestimmter kalendarischer Zahlungstag der Forderung; Fristbeginn nicht vor dessen Ablauf. Bei keiner kalendermäßig bestimmten Zahlungszeit ausdrücklich null.}
\item{inhaberschuldverschreibung}{Expliziter Wahrheitswert zum zusätzlichen Fall1188II.}
\item{vorlegungsfristende_am}{Bei1188II bereits vollständig berechneter letzter Tag der einschlägigen801-Vorlegungsfrist, einschließlich Urkundenabweichungen und Hemmung. Sonst null.}
\item{fristgemaesse_vorlegung_oder_klage}{Nur bei1188II ausdrücklicher Wahrheitswert: Schuldverschreibung innerhalb der Vorlegungsfrist vorgelegt oder Anspruch gerichtlich geltend gemacht? Sonst null.}
\item{verjaehrungsende_am}{Nur bei1188II und fristgemäßer Vorlegung/Klage: bereits vollständig berechneter letzter Verjährungstag, einschließlich einschlägiger Hemmung/Neubeginn. Sonst null.}
\item{einordnungsnachweis}{Nichtleerer Nachweis von1170, wirksamen Beginn-/Neubeginnereignissen und gegebenenfalls1188II/801-Zusatzgrenzen. Gläubigerunbekanntheit und Aufgebotsvoraussetzungen gesondert.}
}
\details{Spätesten qualifizierten1170-Bezugstag bestimmen und zehnjährige Ereignisfrist berechnen; im1188II-Fall zusätzliche Vorlegungs-/Verjährungsgrenzen als Maximum berücksichtigen, ersten Folgetag ausgeben. §1170I/1188II: nur zeitlicher Grundrahmen für Gläubigerausschluss, kein Ausschließungsbeschluss oder automatischer Eigentumserwerb. Zahlungstag wirkt als früheste Fristbeginnschranke; nicht zusätzlich zehn Jahre nach bereits berechnetem Fristende addieren. Anerkenntnis als letzten rechtlich wirksamen Neubeginn vorqualifizieren; frühere Anerkenntnisse vor späterer maßgeblicher Eintragung ändern deren späteren Beginn nicht. Keine automatische Ermittlung beliebiger Anerkenntnisketten. Bei1188II muss Vorlegungsfrist verstrichen sein; nach fristgemäßer Vorlegung/Klage zusätzlich Verjährung abwarten. Zusatzfristen müssen bereits vollständig gerechnet sein. Ergebnis vor etwaigen weiteren rechtlich festgestellten Korrekturen des1170-Grundlaufs; keine pauschale193-Verschiebung. Keine Prüfung der Unbekanntheit des Gläubigers, des Aufgebotsverfahrens oder der Voraussetzungen des Eigentumserwerbs1170II. Kalenderdaten0001..9999 einschließlich Grenz- und Folgedaten; keine Rundung.}
\value{wert: grundfristende_1170, kombinierte_zeitgrenze und erster_tag_nach_zeitgrenzen alsYYYY-MM-DD. Reine Zeitrechnung, kein automatisches Ausschließungsurteil. Einheit: daten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1170_T0001, BGB_1170_T0002, BGB_1188_T0002, BGB_1188_T0003}
\examples{
hypothek_glaeubigerausschluss_grenze(
  letzte_eintragung_am = "2000-01-31",
  letztes_fristwirksames_anerkenntnis_am = NULL,
  kalendertag_zahlung_am = NULL,
  inhaberschuldverschreibung = FALSE,
  vorlegungsfristende_am = NULL,
  fristgemaesse_vorlegung_oder_klage = NULL,
  verjaehrungsende_am = NULL,
  einordnungsnachweis = paste0(
    "§1170I/1188II: nur zeitlicher Grundrahmen für Gläubigeraussc",
    "hluss, kein Ausschließungsbeschluss oder automatischer Eigen",
    "tumserwerb. Zahlungstag wirkt als früheste Fristbeginnschran",
    "ke; nicht zusätzlich zehn Jahre nach bereits berechnetem Fri",
    "stende addieren. Anerkenntnis als letzten rechtlich wirksame",
    "n Neubeginn vorqualifizieren; frühere Anerkenntnisse vor spä",
    "terer maßgeblicher Eintragung ändern deren späteren Beginn n",
    "icht. Keine automatische Ermittlung beliebiger Anerkenntnisk",
    "etten. Bei1188II muss Vorlegungsfrist verstrichen sein; nach",
    " fristgemäßer Vorlegung/Klage zusätzlich Verjährung abwarten",
    ". Zusatzfristen müssen bereits vollständig gerechnet sein. E",
    "rgebnis vor etwaigen weiteren rechtlich festgestellten Korre",
    "kturen des1170-Grundlaufs; keine pauschale193-Verschiebung. ",
    "Keine Prüfung der Unbekanntheit des Gläubigers, des Aufgebot",
    "sverfahrens oder der Voraussetzungen des Eigentumserwerbs117",
    "0II."
  )
)
}
