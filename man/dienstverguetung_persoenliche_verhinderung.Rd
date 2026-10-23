% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{dienstverguetung_persoenliche_verhinderung}
\alias{dienstverguetung_persoenliche_verhinderung}
\title{dienstverguetung persoenliche verhinderung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{dienstverguetung_persoenliche_verhinderung(
  vereinbarte_verguetung = NULL,
  gesetzliche_kranken_unfallversicherungsleistung = NULL,
  grund_in_der_person = NULL,
  ohne_verschulden = NULL,
  zeit_verhaeltnismaessig_nicht_erheblich = NULL,
  regel_616_anwendbar = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{vereinbarte_verguetung}{Nichtnegative Vergütung in EUR für den gesamten rechtlich betrachteten persönlichen Verhinderungszeitraum. Nicht künstlich einen kurzen vergüteten Teil aus einem insgesamt erheblichen Zeitraum bilden.}
\item{gesetzliche_kranken_unfallversicherungsleistung}{Nichtnegativer anrechenbarer Betrag in EUR, der gerade für dieselbe Verhinderungszeit aus einer aufgrund gesetzlicher Verpflichtung bestehenden Kranken- oder Unfallversicherung zukommt. Nicht beliebige private Versicherung, Sozialleistung oder andere Zeiträume.}
\item{grund_in_der_person}{Wahrheitswert eines rechtlich in der Person des Dienstverpflichteten liegenden Verhinderungsgrundes. Allgemeine äußere Hindernisse nicht ungeprüft gleichsetzen.}
\item{ohne_verschulden}{Wahrheitswert fehlenden Verschuldens des Dienstverpflichteten an der konkreten Verhinderung. Rechtliche Bewertung ausdrücklich dokumentieren.}
\item{zeit_verhaeltnismaessig_nicht_erheblich}{Wahrheitswert der rechtlich verhältnismäßig nicht erheblichen Dauer im konkreten Dienstverhältnis. Keine allgemeine Tageszahl vorgegeben; gesamten Verhinderungsfall und maßgebliche Umstände beurteilen.}
\item{regel_616_anwendbar}{Wahrheitswert der sachlich/zeitlich einschlägigen§616-Regel ohne wirksamen Vertrags-/Tarifausschluss oder vorrangige Sonderregel. FALSE ergibt NICHT_ANWENDBAR.}
\item{bewertungsnachweis}{Nichtleere Beschreibung von Dienstverhältnis, persönlichem Grund, Verschulden, Dauerbewertung und qualifizierter Versicherungsleistung desselben Zeitraums. Andere Anspruchsgrundlagen separat.}
}
\details{Nur bei anwendbarem§616 und persönlichem Grund ohne Verschulden für rechtlich verhältnismäßig nicht erhebliche Zeit: Vergütung minus qualifizierte Kranken-/Unfallversicherungsleistung, mindestens0. Keine feste Tagesgrenze und keine automatische medizinische Bewertung. Ganze Dauer rechtlich beurteilen; nicht einen kurzen Teil eines insgesamt erheblichen Falls auswählen. Anrechnung nur aus gesetzlich verpflichtender Kranken-/Unfallversicherung für dieselbe Verhinderungszeit. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakter EUR-Vergütungsrest mindestens0. Fehlende Voraussetzungen ergeben NICHT_ANWENDBAR/null, nicht zwingend vollständigen Verlust anderer Vergütungsansprüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_616_T0001, BGB_616_T0002}
\examples{
dienstverguetung_persoenliche_verhinderung(
  vereinbarte_verguetung = "500",
  gesetzliche_kranken_unfallversicherungsleistung = "0",
  grund_in_der_person = TRUE,
  ohne_verschulden = TRUE,
  zeit_verhaeltnismaessig_nicht_erheblich = TRUE,
  regel_616_anwendbar = TRUE,
  bewertungsnachweis = paste0(
    "Synthetisch rechtlich bewertete kurze persönliche Verhinderu",
    "ng ohne Verschulden."
  )
)
}
