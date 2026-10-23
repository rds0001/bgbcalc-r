% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{hypothek_wiederkehrende_faelligkeitsgrenze}
\alias{hypothek_wiederkehrende_faelligkeitsgrenze}
\title{hypothek wiederkehrende faelligkeitsgrenze}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{hypothek_wiederkehrende_faelligkeitsgrenze(
  beschlagnahme_am = NULL,
  faelligkeit_am = NULL,
  grenzmethode = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{beschlagnahme_am}{Rechtlich maßgeblicher Beschlagnahmetag.}
\item{faelligkeit_am}{Fälligkeit der einzelnen wiederkehrenden Leistung.}
\item{grenzmethode}{Zwingend rechtlich begründete Wahl: nach_ablauf_dreimonatsfrist oder ab_dreimonatsvergleichstag. Keine voreingestellte Auslegung des1126-Grenztags.}
\item{einordnungsnachweis}{Vor Beschlagnahme erfolgte Verfügung und1126-Anwendbarkeit sowie konkrete Grenztagsauslegung qualifizieren.}
}
\details{Drei Kalendermonate ab Beschlagnahme und Fälligkeitslage nach ausdrücklich gewählter Grenztagsmethode berechnen. 1126Satz3: Vorverfügung über wiederkehrende Leistung, keine Mietzeitraumprüfung nach1124II. Drei Kalendermonate mit bestehendem187/188-Kern rechnen, keine90Tage. Nach_ablauf_dreimonatsfrist vergleicht Fälligkeit streng nach dem letzten Fristtag; ab_dreimonatsvergleichstag bezieht diesen Vergleichstag ein. Die lokale Norm allein klärt die hier strittige Tagesgrenze nicht abschließend; verpflichtende Methodenwahl macht beide bedingten Rechnungen sichtbar, ohne eine allgemein verbindliche Grenztagsauslegung zu behaupten. Übrige rechtliche Unwirksamkeitsvoraussetzungen sind nicht Gegenstand dieser zeitlichen Rechnung. Keine193-Wochenendverschiebung einer Fälligkeitsabgrenzung. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{Dreimonatsvergleichstag, bedingtes zeitliches Unwirksamkeitsmerkmal und verwendete rechtliche Grenzmethode. Einheit: datum_und_wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_187_T0001, BGB_187_T0002, BGB_187_T0003, BGB_188_T0001, BGB_188_T0002, BGB_188_T0003, BGB_1126_T0001, BGB_1126_T0002, BGB_1126_T0003}
\examples{
hypothek_wiederkehrende_faelligkeitsgrenze(
  beschlagnahme_am = "2024-01-15",
  faelligkeit_am = "2024-04-15",
  grenzmethode = "nach_ablauf_dreimonatsfrist",
  einordnungsnachweis = paste0(
    "1126Satz3: Vorverfügung über wiederkehrende Leistung, keine ",
    "Mietzeitraumprüfung nach1124II. Drei Kalendermonate mit best",
    "ehendem187/188-Kern rechnen, keine90Tage. Nach_ablauf_dreimo",
    "natsfrist vergleicht Fälligkeit streng nach dem letzten Fris",
    "ttag; ab_dreimonatsvergleichstag bezieht diesen Vergleichsta",
    "g ein. Die lokale Norm allein klärt die hier strittige Tages",
    "grenze nicht abschließend; verpflichtende Methodenwahl macht",
    " beide bedingten Rechnungen sichtbar, ohne eine allgemein ve",
    "rbindliche Grenztagsauslegung zu behaupten. Übrige rechtlich",
    "e Unwirksamkeitsvoraussetzungen sind nicht Gegenstand dieser",
    " zeitlichen Rechnung. Keine193-Wochenendverschiebung einer F",
    "älligkeitsabgrenzung."
  )
)
}
