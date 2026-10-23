% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{mieterhoehung_sonderkuendigungsfenster}
\alias{mieterhoehung_sonderkuendigungsfenster}
\title{mieterhoehung sonderkuendigungsfenster}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{mieterhoehung_sonderkuendigungsfenster(
  zugang_erhoehungsmitteilung_am = NULL,
  verlangter_erhoehungsbeginn_am = NULL,
  kuendigungseingang_am = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{zugang_erhoehungsmitteilung_am}{ISO-Datum des tatsächlichen Zugangs der rechtlich qualifizierten Mieterhöhungsmitteilung nach§558 oder559.}
\item{verlangter_erhoehungsbeginn_am}{Erster Tag eines Monats, ab dem die Erhöhung nach der rechtlich qualifizierten Mitteilung verlangt wird. Nicht vor regulärem Beginn des dritten Folgemonats; spätere Geltendmachung ausdrücklich berücksichtigen.}
\item{kuendigungseingang_am}{ISO-Datum des tatsächlichen Zugangs der Sonderkündigung. Bei gleichem Tag wie Erhöhungsmitteilung tatsächliche Reihenfolge rechtlich qualifizieren.}
\item{einordnungsnachweis}{Nichtleere Qualifikation von§561 und eines wirksamen Erhöhungsverlangens mit Beginn zum Monatsersten. Kündigungsform/Vertretung/inhaltlich gewählter Termin und sonstige Wirksamkeit gesondert.}
}
\details{Ausübungsgrundfrist und bei später verlangter Erhöhung verlängertes Erklärungsfenster sowie Mietende bei voller Fristausnutzung berechnen. §561I mit§558bI; spätere verlangte Erhöhung nach BGH25.9.2013,VIII ZR280/12,Rn17–18. Reguläre Ausübungsgrundfrist endet am letzten Tag des zweiten Folgemonats; bei später verlangter Erhöhung bleibt die Erklärung bis zum Vortag des Erhöhungsbeginns möglich. Mietende bei voller Ausnutzung: Ende des zweiten mit Erhöhungsbeginn beginnenden Kalendermonats. Dieses Datum ist der bei voller Fristausnutzung erreichbare Termin, nicht automatisch das tatsächliche Ende jeder früheren oder anders formulierten Kündigung. Der zeitliche Eingangsvergleich bestätigt keine übrige Wirksamkeit. Bei wirksamer561Kündigung bleibt die bisherige Miete maßgeblich; diese Rechtsfolge ist keine zusätzliche eigenständige Zahlenformel. Sonderkorrekturen des Zugangs/§193 gesondert, keine automatische Verschiebung der erklärten Termine. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält regulaerer_letzter_erklaerungstag, letzter_erklaerungstag_bei_verlangtem_beginn, mietende_bei_voller_fristausnutzung und erklaerung_im_zeitfenster. Kein automatisch festgestelltes tatsächliches Vertragsende. Einheit: daten_und_wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_558b_T0001, BGB_558b_T0002, BGB_558b_T0003, BGB_558b_T0004, BGB_558b_T0005, BGB_558b_T0006, BGB_561_T0001, BGB_561_T0002, BGB_561_T0003}
\examples{
mieterhoehung_sonderkuendigungsfenster(
  zugang_erhoehungsmitteilung_am = "2011-01-07",
  verlangter_erhoehungsbeginn_am = "2011-08-01",
  kuendigungseingang_am = "2011-07-31",
  einordnungsnachweis = paste0(
    "§561I mit§558bI; spätere verlangte Erhöhung nach BGH25.9.201",
    "3,VIII ZR280/12,Rn17–18. Reguläre Ausübungsgrundfrist endet ",
    "am letzten Tag des zweiten Folgemonats; bei später verlangte",
    "r Erhöhung bleibt die Erklärung bis zum Vortag des Erhöhungs",
    "beginns möglich. Mietende bei voller Ausnutzung: Ende des zw",
    "eiten mit Erhöhungsbeginn beginnenden Kalendermonats. Dieses",
    " Datum ist der bei voller Fristausnutzung erreichbare Termin",
    ", nicht automatisch das tatsächliche Ende jeder früheren ode",
    "r anders formulierten Kündigung. Der zeitliche Eingangsvergl",
    "eich bestätigt keine übrige Wirksamkeit. Bei wirksamer561Kün",
    "digung bleibt die bisherige Miete maßgeblich; diese Rechtsfo",
    "lge ist keine zusätzliche eigenständige Zahlenformel. Sonder",
    "korrekturen des Zugangs/§193 gesondert, keine automatische V",
    "erschiebung der erklärten Termine."
  )
)
}
