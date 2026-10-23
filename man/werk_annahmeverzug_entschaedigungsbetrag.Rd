% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{werk_annahmeverzug_entschaedigungsbetrag}
\alias{werk_annahmeverzug_entschaedigungsbetrag}
\title{werk annahmeverzug entschaedigungsbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{werk_annahmeverzug_entschaedigungsbetrag(
  verzugsbezogene_verguetungsbasis = NULL,
  ersparte_aufwendungen = NULL,
  anderweitiger_arbeitskraft_erwerb = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{verzugsbezogene_verguetungsbasis}{Nichtnegativer exakter EUR-Vergütungsanteil, der rechtlich aus der maßgeblichen Verzugsdauer und vereinbarten Vergütung für vorgehaltene Produktionsmittel bestimmt wurde. Keine ungeprüfte gesamte Vertragssumme oder pauschaler Gesamtschaden.}
\item{ersparte_aufwendungen}{Nichtnegative exakte EUR-Aufwendungen, die infolge desselben Annahmeverzugs im betrachteten Zeitraum erspart werden.}
\item{anderweitiger_arbeitskraft_erwerb}{Nichtnegativer exakter EUR-Betrag des rechtlich anzurechnenden Erwerbs durch mögliche anderweitige Verwendung der Arbeitskraft im selben Verzugszeitraum;642II setzt hierfür nicht zusätzlich böswilliges Unterlassen voraus.}
\item{einordnungsnachweis}{Nichtleerer Nachweis erforderlicher Bestellerhandlung, Annahmeverzug, konkreter Dauer/Vergütungsbasis, Vorhaltung und zugehöriger überschneidungsfreier Abzüge. Keine automatische Bewertung angemessener Entschädigung.}
}
\details{Qualifizierte verzugsbezogene Vergütungsbasis abzüglich ersparter Aufwendungen und anderweitigen Arbeitskrafterwerbs, mindestens null. §642I/II: numerischer Abrechnungsschritt aus rechtlich bestimmter Verzugsdauer-/Vergütungsbasis und zugehörigen Abzügen. Basis nicht blind als gesamte Vergütung geteilt durch gesamte Vertragszeit bilden; tatsächlich betroffene Vorhaltung und rechtlich maßgebliche Bewertungsanteile qualifizieren. Keine automatische Entschädigung sämtlicher Mehrkosten nach Verzugsende und keine Schadensersatzprognose. Ersparnis und anderweitiger Erwerb nur einmal, nicht bereits netto in der Basis und erneut als Abzug. Kein zusätzliches Böswilligkeitserfordernis aus615/648 übertragen. Negative Differenz ergibt0, keinen automatisch begründeten Zahlungsanspruch des Bestellers. Zahlungen separat. Nichtnegative Eingangswerte, exakter nichtnegativer EUR-Bruch im sicheren gemeinsamen Zahlenbereich.}
\value{wert ist der exakte EUR-Bruch. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_642_T0001, BGB_642_T0002}
\examples{
werk_annahmeverzug_entschaedigungsbetrag(
  verzugsbezogene_verguetungsbasis = "1000",
  ersparte_aufwendungen = "200",
  anderweitiger_arbeitskraft_erwerb = "100",
  einordnungsnachweis = paste0(
    "§642I/II: numerischer Abrechnungsschritt aus rechtlich besti",
    "mmter Verzugsdauer-/Vergütungsbasis und zugehörigen Abzügen.",
    " Basis nicht blind als gesamte Vergütung geteilt durch gesam",
    "te Vertragszeit bilden; tatsächlich betroffene Vorhaltung un",
    "d rechtlich maßgebliche Bewertungsanteile qualifizieren. Kei",
    "ne automatische Entschädigung sämtlicher Mehrkosten nach Ver",
    "zugsende und keine Schadensersatzprognose. Ersparnis und and",
    "erweitiger Erwerb nur einmal, nicht bereits netto in der Bas",
    "is und erneut als Abzug. Kein zusätzliches Böswilligkeitserf",
    "ordernis aus615/648 übertragen. Negative Differenz ergibt0, ",
    "keinen automatisch begründeten Zahlungsanspruch des Bestelle",
    "rs. Zahlungen separat."
  )
)
}
