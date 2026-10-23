% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{pflichtteilsergaenzung_grundbetrag}
\alias{pflichtteilsergaenzung_grundbetrag}
\title{pflichtteilsergaenzung grundbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{pflichtteilsergaenzung_grundbetrag(
  pflichtteilsnachlass = NULL,
  hinzuzurechnende_schenkungen = NULL,
  gesetzliche_erbquote_zaehler = NULL,
  gesetzliche_erbquote_nenner = NULL,
  pflichtteilsberechtigt = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{pflichtteilsnachlass}{Rechtlich bestimmter tatsächlicher Pflichtteilsnachlass in EUR, auch negativ, vor Hinzurechnung der hier genannten Drittschenkungen. Qualifizierte Nachlassverbindlichkeiten bereits berücksichtigen, keine Schenkungen doppelt hinzufügen.}
\item{hinzuzurechnende_schenkungen}{Nichtnegative Summe rechtlich relevanter Drittschenkungen in EUR, nach Bewertung§2325 Absatz2 und zeitlicher AbschmelzungAbsatz3. Ausnahmen§2330 zuvor ausscheiden. Keine eigenen Geschenke des Berechtigten im Grundmodell ohne§2327.}
\item{gesetzliche_erbquote_zaehler}{Nichtnegative ganze Zahl höchstens Nenner und2^53-1 der zuvor rechtlich bestimmten gesetzlichen Erbquote. Die Funktion halbiert diese Quote selbst zum Pflichtteil.}
\item{gesetzliche_erbquote_nenner}{Positive ganze Zahl höchstens2^53-1 der gesetzlichen Erbquote. Nicht schon die halbierte Pflichtteilsquote eingeben.}
\item{pflichtteilsberechtigt}{Wahrheitswert der Pflichtteilsberechtigung im konkreten Fall. FALSE ergibt NICHT_ANWENDBAR. Erbrechtliche Stellung und besondere Ausschlüsse zuvor prüfen.}
\item{bewertungsnachweis}{Nichtleere Beschreibung der konsistenten Nachlassbewertung, relevanten Drittschenkungen, gesetzlichen Erbquote und Berechtigung. Grundmodell ohne eigene Geschenke oder Ausgleichung; deren Wechselwirkungen separat.}
}
\details{Ordentlicher Pflichtteil=max(Nachlass,0)×gesetzliche Erbquote/2. Erhöhter Pflichtteil=max(Nachlass+qualifizierte Drittschenkungen,0)×gesetzliche Erbquote/2. Ergänzungsgrundbetrag ist Differenz beider Werte. Keine pauschale Quote×Schenkung bei negativem Nachlass. Grundmodell ohne eigene Geschenke§§2315/2327 oder Ausgleichung§2316. Mehrhinterlassung§2326, Schutz des Erben§2328, Beschenktenhaftung§2329 und weitere Anspruchsfragen gesondert. Pflichtteilsnachlass als vorzeichenbehaftete Dezimalzeichenfolge/Bruchobjekt; Schenkungssumme nichtnegativ. Gesetzliche Quote0..1 mit ganzzahligem Zähler und positivem Nenner. Exakte Zwischenwerte höchstens2^53-1.}
\value{wert enthält ordentlicher_pflichtteilswert, erhoehter_pflichtteilswert und ergaenzungsgrundbetrag als exakte EUR-Brüche. Bei fehlender Berechtigung null und NICHT_ANWENDBAR. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2325_T0001, BGB_2303_T0002}
\examples{
pflichtteilsergaenzung_grundbetrag(
  pflichtteilsnachlass = "-800",
  hinzuzurechnende_schenkungen = "0",
  gesetzliche_erbquote_zaehler = 0,
  gesetzliche_erbquote_nenner = 2,
  pflichtteilsberechtigt = TRUE,
  bewertungsnachweis = paste0(
    "Synthetisch vollständig bestimmte Drittschenkung ohne Eigeng",
    "eschenke/Ausgleichung."
  )
)
}
