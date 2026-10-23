% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{bau_sicherheitskuendigung_verguetung}
\alias{bau_sicherheitskuendigung_verguetung}
\title{bau sicherheitskuendigung verguetung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{bau_sicherheitskuendigung_verguetung(
  erbrachte_verguetung = NULL,
  nicht_erbrachte_verguetung = NULL,
  abrechnungsart = NULL,
  ersparte_aufwendungen = NULL,
  anderweitiger_erwerb = NULL,
  boeswillig_unterlassener_erwerb = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{erbrachte_verguetung}{Nichtnegative exakte EUR-Vergütung für die bis zur Kündigung erbrachte Leistung.}
\item{nicht_erbrachte_verguetung}{Nichtnegative exakte EUR-Vergütung für den noch nicht erbrachten Teil; zusammen mit erbrachtem Anteil die vereinbarte Vergütung des betrachteten Vertrags.}
\item{abrechnungsart}{Genau vermutung (gesetzliche5Prozent des nicht erbrachten Anteils) oder konkret (gesamte Vergütung minus qualifizierte Abzüge).}
\item{ersparte_aufwendungen}{Nichtnegative exakte EUR-Aufwendungen, die infolge derselben Vertragsaufhebung erspart werden; bei vermutung ausdrücklich0.}
\item{anderweitiger_erwerb}{Nichtnegativer exakter EUR-Erwerb durch anderweitige Verwendung der Arbeitskraft infolge derselben Aufhebung, ohne Überschneidung; bei vermutung0.}
\item{boeswillig_unterlassener_erwerb}{Nichtnegativer exakter EUR-Wert rechtlich böswillig unterlassenen anderweitigen Erwerbs; keine automatische Erwerbsprognose; bei vermutung0.}
\item{einordnungsnachweis}{Nichtleerer Nachweis wirksamer Unternehmerkündigung650fV nach erfolgloser angemessener Sicherheitsfrist, Anwendungsbereich650fVI und zutreffender Vergütungs-/Abzugszuordnung.}
}
\details{Erbrachte Vergütung plus fünf Prozent des nicht erbrachten Anteils oder gesamte Vergütung abzüglich qualifizierter Ersparnis und Erwerbsbeträge. §650fV: Unternehmerkündigung nach erfolgloser angemessener Frist zur Sicherheitsleistung; nicht mit freier Bestellerkündigung648 gleichsetzen.650fVI-Ausnahmen und gegebenenfalls Baubetreuerfall vorqualifizieren. Gesetzliche5Prozent sind widerlegliche Vermutung ausschließlich für den nicht erbrachten Vergütungsanteil; konkrete Abzüge nicht zusätzlich zur Vermutung einsetzen. Konkrete Rechnung: Gesamtvergütung minus kausal zurechenbare Ersparnis, anderweitiger Erwerb und böswillig unterlassener Erwerb, mindestens0. Abzüge überschneidungsfrei, Brutto-/Nettobezug konsistent; keine automatisch negative Vergütungsforderung oder Rückerstattung aus Abzugsüberschuss. Bereits geleistete Zahlungen und sonstige Ansprüche separat. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert: exakter nichtnegativer EUR-Vergütungsbruch vor Anrechnung bereits geleisteter Zahlungen. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_650f_T0011, BGB_650f_T0012, BGB_650f_T0013, BGB_650f_T0014, BGB_650f_T0015, BGB_650f_T0016, BGB_650f_T0017, BGB_650f_T0018}
\examples{
bau_sicherheitskuendigung_verguetung(
  erbrachte_verguetung = "400",
  nicht_erbrachte_verguetung = "600",
  abrechnungsart = "vermutung",
  ersparte_aufwendungen = "0",
  anderweitiger_erwerb = "0",
  boeswillig_unterlassener_erwerb = "0",
  einordnungsnachweis = paste0(
    "§650fV: Unternehmerkündigung nach erfolgloser angemessener F",
    "rist zur Sicherheitsleistung; nicht mit freier Bestellerkünd",
    "igung648 gleichsetzen.650fVI-Ausnahmen und gegebenenfalls Ba",
    "ubetreuerfall vorqualifizieren. Gesetzliche5Prozent sind wid",
    "erlegliche Vermutung ausschließlich für den nicht erbrachten",
    " Vergütungsanteil; konkrete Abzüge nicht zusätzlich zur Verm",
    "utung einsetzen. Konkrete Rechnung: Gesamtvergütung minus ka",
    "usal zurechenbare Ersparnis, anderweitiger Erwerb und böswil",
    "lig unterlassener Erwerb, mindestens0. Abzüge überschneidung",
    "sfrei, Brutto-/Nettobezug konsistent; keine automatisch nega",
    "tive Vergütungsforderung oder Rückerstattung aus Abzugsübers",
    "chuss. Bereits geleistete Zahlungen und sonstige Ansprüche s",
    "eparat."
  )
)
}
