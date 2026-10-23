% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{bereicherung_entreicherungsrest}
\alias{bereicherung_entreicherungsrest}
\title{bereicherung entreicherungsrest}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{bereicherung_entreicherungsrest(
  qualifizierter_geldherausgabebetrag = NULL,
  anrechenbare_entreicherung = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{qualifizierter_geldherausgabebetrag}{Nichtnegativer exakter EUR-Ausgangsbetrag rechtlich geschuldeter Geldherausgabe/Wertersatzes einschließlich zugeordneter Nutzungen/Surrogate, ohne Doppelzählung. Beispielsweise Summe aus schuldrecht_geldpositionssumme für bereicherung_geldkomponenten.}
\item{anrechenbare_entreicherung}{Nichtnegativer exakter EUR-Betrag des rechtlich anrechenbaren Wegfalls der Bereicherung, höchstens Ausgangsbetrag. Keine beliebigen Ausgaben oder Vermögensverluste; soweit verschärfte Haftung die Einwendung ausschließt, keine solchen Beträge einrechnen.}
\item{einordnungsnachweis}{Nichtleerer Nachweis von Ausgangsbereicherung, noch bestehender Bereicherung und rechtlich anrechenbarem Wegfall. Zeitpunkte und verschärfte Haftung818IV/819/820 gesondert bestimmen.}
}
\details{Qualifizierten Geldherausgabebetrag um rechtlich anrechenbare Entreicherung vermindern. §818III: ausschließlich numerische Begrenzung auf Grundlage bereits rechtlich bestimmter Beträge. Entreicherung nicht automatisch aus vermindertem Kontostand, Konsumausgaben oder Verlusten ablesen. Anrechenbaren Wegfall auf die tatsächlich erfassten Komponenten und den maßgeblichen Haftungszeitraum beziehen. Verschärfte Haftung818IV/819/820, Nutzungsgrenze820II, Drittweitergabe822 und Einreden821 gesondert; ausgeschlossene Entreicherung darf nicht durch positives Eingabefeld wieder eingeführt werden. Keine automatische Saldotheorie oder Verrechnung beider Leistungsrichtungen, keine körperliche Sachherausgabe als Geldrest behandeln. Zahlungen separat. Nichtnegative Eingangswerte, exakter nichtnegativer EUR-Bruch im sicheren gemeinsamen Zahlenbereich.}
\value{wert ist der exakte EUR-Bruch. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_818_T0003}
\examples{
bereicherung_entreicherungsrest(
  qualifizierter_geldherausgabebetrag = "100",
  anrechenbare_entreicherung = "40",
  einordnungsnachweis = paste0(
    "§818III: ausschließlich numerische Begrenzung auf Grundlage ",
    "bereits rechtlich bestimmter Beträge. Entreicherung nicht au",
    "tomatisch aus vermindertem Kontostand, Konsumausgaben oder V",
    "erlusten ablesen. Anrechenbaren Wegfall auf die tatsächlich ",
    "erfassten Komponenten und den maßgeblichen Haftungszeitraum ",
    "beziehen. Verschärfte Haftung818IV/819/820, Nutzungsgrenze82",
    "0II, Drittweitergabe822 und Einreden821 gesondert; ausgeschl",
    "ossene Entreicherung darf nicht durch positives Eingabefeld ",
    "wieder eingeführt werden. Keine automatische Saldotheorie od",
    "er Verrechnung beider Leistungsrichtungen, keine körperliche",
    " Sachherausgabe als Geldrest behandeln. Zahlungen separat."
  )
)
}
