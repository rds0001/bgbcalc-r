% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{mieterhoehung_sonderkuendigung_beendigungsmodell}
\alias{mieterhoehung_sonderkuendigung_beendigungsmodell}
\title{mieterhoehung sonderkuendigung beendigungsmodell}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{mieterhoehung_sonderkuendigung_beendigungsmodell(
  zugang_erhoehungsmitteilung_am = NULL,
  verlangter_erhoehungsbeginn_am = NULL,
  kuendigungseingang_am = NULL,
  beendigungsmodell = NULL,
  bisherige_monatsmiete = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{zugang_erhoehungsmitteilung_am}{Tatsächlicher Zugang der558/559-Erhöhungserklärung.}
\item{verlangter_erhoehungsbeginn_am}{Rechtlich verlangter Beginn am Monatsersten, nicht vor regulärem Beginn.}
\item{kuendigungseingang_am}{Tatsächlicher Eingang der561-Kündigung innerhalb des Erklärungsfensters.}
\item{beendigungsmodell}{Zwingend rechtlich vorgegebener Bezug: kuendigungszugangsmonat oder letzter_ausuebungsmonat. Keine automatische Auslegung einer früher erklärten Kündigung.}
\item{bisherige_monatsmiete}{Unveränderte rechtlich geschuldete Monatsmiete bei wirksamer561-Kündigung.}
\item{einordnungsnachweis}{Wirksame561-Kündigung, rechtlicher Beendigungsbezug und Monatsmiete ausdrücklich qualifizieren; später gewünschte Termine, ordentliche Kündigung und Vertragsaufhebung gesondert.}
}
\details{561-Erklärungsfenster prüfen und zwei Monatsendbezüge berechnen; ausschließlich rechtlich vorgegebenes Modell auswählen und unveränderte Miete ausweisen. 561-Beendigungsrechnung als ausdrücklich bedingtes Modell: Ende des zweiten Monats nach tatsächlichem Kündigungszugangsmonat oder nach letztem Ausübungsmonat. Beide Termine ausweisen, keine stille Gleichsetzung früher Erklärung mit voller Fristausnutzung. Vorhandenes561-Fenster berücksichtigt später verlangte Erhöhung nachBGH25.9.2013VIIIZR280/12; diese Quelle belegt volle Fristausnutzung, nicht universell den früheren Beendigungsbezug. Rechtliche Auswahl daher zwingend. Eingang muss im berechneten Fenster liegen. Bei rechtlich wirksamer561-Kündigung tritt die Erhöhung nicht ein, bisherige Monatsmiete bleibt bis Ende maßgeblich. Keine automatische Wirksamkeitsfeststellung oder taganteilige Schlussabrechnung. Monatsendtermin nicht wegen Wochenende verschieben. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{Beide bedingten Monatsendtermine, ausgewählter Beendigungstermin und bisherige Monatsmiete. Einheit: daten_und_EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_561_T0001, BGB_561_T0002, BGB_561_T0003}
\examples{
mieterhoehung_sonderkuendigung_beendigungsmodell(
  zugang_erhoehungsmitteilung_am = "2024-01-15",
  verlangter_erhoehungsbeginn_am = "2024-04-01",
  kuendigungseingang_am = "2024-02-10",
  beendigungsmodell = "kuendigungszugangsmonat",
  bisherige_monatsmiete = "800",
  einordnungsnachweis = paste0(
    "561-Beendigungsrechnung als ausdrücklich bedingtes Modell: E",
    "nde des zweiten Monats nach tatsächlichem Kündigungszugangsm",
    "onat oder nach letztem Ausübungsmonat. Beide Termine ausweis",
    "en, keine stille Gleichsetzung früher Erklärung mit voller F",
    "ristausnutzung. Vorhandenes561-Fenster berücksichtigt später",
    " verlangte Erhöhung nachBGH25.9.2013VIIIZR280/12; diese Quel",
    "le belegt volle Fristausnutzung, nicht universell den früher",
    "en Beendigungsbezug. Rechtliche Auswahl daher zwingend. Eing",
    "ang muss im berechneten Fenster liegen. Bei rechtlich wirksa",
    "mer561-Kündigung tritt die Erhöhung nicht ein, bisherige Mon",
    "atsmiete bleibt bis Ende maßgeblich. Keine automatische Wirk",
    "samkeitsfeststellung oder taganteilige Schlussabrechnung. Mo",
    "natsendtermin nicht wegen Wochenende verschieben."
  )
)
}
