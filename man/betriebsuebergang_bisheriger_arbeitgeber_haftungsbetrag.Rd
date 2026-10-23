% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{betriebsuebergang_bisheriger_arbeitgeber_haftungsbetrag}
\alias{betriebsuebergang_bisheriger_arbeitgeber_haftungsbetrag}
\title{betriebsuebergang bisheriger arbeitgeber haftungsbetrag}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{betriebsuebergang_bisheriger_arbeitgeber_haftungsbetrag(
  betriebsuebergang_am = NULL,
  faellig_am = NULL,
  nach_uebergang_faellig = NULL,
  verpflichtungsbetrag = NULL,
  abgelaufene_bemessungseinheiten = NULL,
  gesamte_bemessungseinheiten = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{betriebsuebergang_am}{Qualifizierter Tag des BetriebsübergangsYYYY-MM-DD.}
\item{faellig_am}{Rechtlich maßgeblicher FälligkeitstagYYYY-MM-DD der schon vor Übergang entstandenen Verpflichtung.}
\item{nach_uebergang_faellig}{Wahrheitswert zur zeitlichen Reihenfolge; bei identischem Kalendertag nach tatsächlichem Zeitpunkt rechtlich qualifizieren.}
\item{verpflichtungsbetrag}{Nichtnegativer BetragEUR dieser abgegrenzten Verpflichtung.}
\item{abgelaufene_bemessungseinheiten}{Nichtnegative exakte Zahl rechtlich maßgeblicher, bis zum Übergang abgelaufener Bemessungseinheiten.}
\item{gesamte_bemessungseinheiten}{Positive exakte Zahl derselben Bemessungseinheit im vollständigen Bemessungszeitraum; keine pauschale360/365Tage-Annahme.}
\item{einordnungsnachweis}{Nichtleerer Nachweis613aII: wirksamer Betriebsübergang, Verpflichtung vor Übergang entstanden,613aIII-Ausnahme ausgeschlossen, Fälligkeitsreihenfolge und Bemessungszeitanteil qualifiziert.}
}
\details{Fälligkeitszeitgrenze und zeitanteiligen Haftungsumfang des bisherigen Arbeitgebers berechnen. §613aII: Vor Übergang fällige qualifizierte Verpflichtung in voller Höhe; später fällige nur bis zur gesetzlichen Einjahresgrenze und im Verhältnis des bereits abgelaufenen zum gesamten Bemessungszeitraum. Fristende nach187I/188; Datumsgleichheit zum letzten Tag gilt nur bei rechtlich qualifizierter Fälligkeit vor dessen Ablauf. Ausgabe ist Umfang der gesamtschuldnerischen Haftung des bisherigen Arbeitgebers; keine hälftige Aufteilung und kein zusätzlicher Anspruch neben dem Gesamtbetrag. Übrige Haftungsgrundlagen und Innenausgleich nicht entschieden. Beide Zeiteinheiten auch im Vollhaftungsfall angeben; keine automatische Bewertung oder zeitliche Entstehung der Verpflichtung. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert.einjahresgrenze_letzter_tag alsDatum und haftungsbetrag_bisheriger_arbeitgeber alsEurobruch. Einheit: datum_und_EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_613a_T0005, BGB_613a_T0006}
\examples{
betriebsuebergang_bisheriger_arbeitgeber_haftungsbetrag(
  betriebsuebergang_am = "2024-07-01",
  faellig_am = "2024-12-31",
  nach_uebergang_faellig = TRUE,
  verpflichtungsbetrag = "1200",
  abgelaufene_bemessungseinheiten = "6",
  gesamte_bemessungseinheiten = "12",
  einordnungsnachweis = paste0(
    "§613aII: Vor Übergang fällige qualifizierte Verpflichtung in",
    " voller Höhe; später fällige nur bis zur gesetzlichen Einjah",
    "resgrenze und im Verhältnis des bereits abgelaufenen zum ges",
    "amten Bemessungszeitraum. Fristende nach187I/188; Datumsglei",
    "chheit zum letzten Tag gilt nur bei rechtlich qualifizierter",
    " Fälligkeit vor dessen Ablauf. Ausgabe ist Umfang der gesamt",
    "schuldnerischen Haftung des bisherigen Arbeitgebers; keine h",
    "älftige Aufteilung und kein zusätzlicher Anspruch neben dem ",
    "Gesamtbetrag. Übrige Haftungsgrundlagen und Innenausgleich n",
    "icht entschieden. Beide Zeiteinheiten auch im Vollhaftungsfa",
    "ll angeben; keine automatische Bewertung oder zeitliche Ents",
    "tehung der Verpflichtung."
  )
)
}
