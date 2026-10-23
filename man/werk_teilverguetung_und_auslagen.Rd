% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{werk_teilverguetung_und_auslagen}
\alias{werk_teilverguetung_und_auslagen}
\title{werk teilverguetung und auslagen}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{werk_teilverguetung_und_auslagen(
  gesamtverguetung = NULL,
  leistungsanteil_zaehler = NULL,
  leistungsanteil_nenner = NULL,
  nicht_inbegriffene_auslagen = NULL,
  werkbeeintraechtigung_vor_abnahme = NULL,
  bestellerstoffmangel_oder_anweisung_ursaechlich = NULL,
  unternehmer_zu_vertretender_umstand = NULL,
  aufhebung_nach_643 = NULL,
  kuendigung_nach_649 = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{gesamtverguetung}{Nichtnegative rechtlich maßgebliche vereinbarte Gesamtvergütung in EUR für den betrachteten Leistungsumfang. Gleicher Bewertungsumfang wie Leistungsanteil.}
\item{leistungsanteil_zaehler}{Nichtnegative ganze Zahl des rechtlich bestimmten Anteils bisher erbrachter Leistung, höchstens Nenner und2^53-1. Nicht automatisch Zeitanteil; Wert/Umfang der vereinbarten Leistungen bestimmen.}
\item{leistungsanteil_nenner}{Positive ganze Bezugsgröße der gesamten betrachteten Leistung im selben Maßstab, höchstens2^53-1. Leistungsanteil0..1.}
\item{nicht_inbegriffene_auslagen}{Nichtnegative rechtlich ersatzfähige Auslagen in EUR, die in der Vergütung gerade nicht enthalten sind. Bereits im Vergütungsanteil enthaltene Material-/Kostenpositionen nicht nochmals addieren.}
\item{werkbeeintraechtigung_vor_abnahme}{Wahrheitswert: Werk ist vor Abnahme untergegangen, verschlechtert oder unausführbar geworden. Maßgeblichen Zeitraum und tatsächlichen Zustand rechtlich feststellen.}
\item{bestellerstoffmangel_oder_anweisung_ursaechlich}{Wahrheitswert: Beeinträchtigung beruht auf Mangel des vom Besteller gelieferten Stoffs oder dessen für die Ausführung erteilter Anweisung. Bloße Materialbeteiligung nicht automatisch ausreichend.}
\item{unternehmer_zu_vertretender_umstand}{Wahrheitswert eines mitwirkenden Umstands, den der Unternehmer zu vertreten hat. TRUE schließt den hier geprüften Werkbeeinträchtigungsfall§645 Absatz1 Satz1 aus; unabhängige qualifizierte Aufhebung/Kündigung separat.}
\item{aufhebung_nach_643}{Wahrheitswert einer wirksamen Aufhebung gemäß§643: gesetzlicher Mitwirkungsfall§642, angemessene Frist samt Kündigungserklärung, ausgebliebene Nachholung bis Ablauf. Bloß beliebige Vertragsbeendigung nicht einsetzen.}
\item{kuendigung_nach_649}{Wahrheitswert einer Bestellerkündigung gerade wegen wesentlicher Überschreitung eines zugrunde gelegten Kostenanschlags ohne übernommene Richtigkeitsgewähr. Rechtliche Wesentlichkeit und Kündigungsgrund bestimmen; keine erfundene Prozentschwelle.}
\item{bewertungsnachweis}{Nichtleere Beschreibung von Werkbeeinträchtigung, Ursache/Vertretenmüssen oder qualifizierter Aufhebung/Kündigung, bisherigem Leistungsanteil und nicht bereits in Vergütung enthaltenen Auslagen.}
}
\details{Bei Beeinträchtigung vor Abnahme aus Bestellerstoffmangel/Anweisung ohne Unternehmervertretenmüssen ODER Aufhebung§643 ODER qualifizierter Kostenanschlagskündigung§649: Gesamtvergütung×geleisteter Anteil + nicht inbegriffene Auslagen. Nicht freie Kündigung§648. Aufhebungs-/Kündigungstatbestände rechtlich vollständig als Eingabe belegen; Wesentlichkeit einer Kostenüberschreitung nicht durch pauschale Prozentzahl ersetzen. Auslagen überschneidungsfrei. Weitergehende Haftung/Anzeigepflichten gesondert. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakter EUR-Teilvergütungs- und Auslagenbetrag. Fehlender gesetzlicher Fall ergibt NICHT_ANWENDBAR/null. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_645_T0001, BGB_645_T0002, BGB_643_T0001, BGB_643_T0002, BGB_649_T0001}
\examples{
werk_teilverguetung_und_auslagen(
  gesamtverguetung = "1200",
  leistungsanteil_zaehler = 1,
  leistungsanteil_nenner = 3,
  nicht_inbegriffene_auslagen = "50",
  werkbeeintraechtigung_vor_abnahme = FALSE,
  bestellerstoffmangel_oder_anweisung_ursaechlich = FALSE,
  unternehmer_zu_vertretender_umstand = FALSE,
  aufhebung_nach_643 = FALSE,
  kuendigung_nach_649 = TRUE,
  bewertungsnachweis = paste0(
    "Synthetischer gesetzlicher Teilvergütungsfall mit überschnei",
    "dungsfreien Auslagen."
  )
)
}
