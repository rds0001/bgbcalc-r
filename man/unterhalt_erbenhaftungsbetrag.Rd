% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{unterhalt_erbenhaftungsbetrag}
\alias{unterhalt_erbenhaftungsbetrag}
\title{unterhalt erbenhaftungsbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{unterhalt_erbenhaftungsbetrag(
  hypothetischer_pflichtteil = NULL,
  angerechnete_erbenleistungen = NULL,
  offener_unterhalt = NULL,
  haftungsnachweis = NULL
)}
\arguments{
\item{hypothetischer_pflichtteil}{Nichtnegative qualifizierte hypothetische Pflichtteilsgrenze in EUR bei fortbestehend gedachter Ehe, ohne güterstandsbedingte Besonderheiten nach§1586bII.}
\item{angerechnete_erbenleistungen}{Nichtnegative auf dieselbe gemeinsame Haftungsgrenze rechtlich anzurechnende bereits erbrachte Leistungen sämtlicher Erben, EUR. Keine ungeprüften Zahlungen zu Lebzeiten des Verpflichteten.}
\item{offener_unterhalt}{Nichtnegative bereits anderweitig qualifizierte offene Unterhaltsforderung gegen die Erben in EUR.}
\item{haftungsnachweis}{Nichtleerer Nachweis der Pflichtteilsbewertung, konsolidierten Leistungsanrechnung und offenen Forderung.}
}
\details{Restgrenze=max(hypothetischer Pflichtteil-angerechnete Erbenleistungen,0); Betrag=min(offener Unterhalt,Restgrenze); nicht gedeckten Teil und nach Forderung verbleibenden Haftungsrest ausweisen. §1586b: ein qualifiziertes Unterhaltsverhältnis nach Tod des Verpflichteten. Hypothetischer Pflichtteil bei fortbestehend gedachter Ehe bewertet; güterstandsbedingte Besonderheiten nachAbsatz2 außer Betracht lassen. Keine erneute hypothetische Nachlass-/Pflichtteilsbewertung oder Prüfung von Pflichtteilsergänzung. Angerechnete Erbenleistungen sind nur rechtlich auf diese gemeinsame Grenze anzurechnende Leistungen, keine ungeprüften Unterhaltszahlungen des Erblassers zu Lebzeiten. Mehrere Erben haben keine vervielfachte Grenze; alle einschlägigen Leistungen konsolidiert vorgeben, interne Erbenverteilung außerhalb. §1581-Beschränkungen des verstorbenen Verpflichteten nicht fortschreiben. Offene Forderung bereits nach übrigen Unterhaltsregeln bestimmt; weitere gegenständliche Nachlasshaftungsbeschränkungen gesondert. Übersteigende Vorleistungen führen zu Restgrenze0, keinem automatisch festgestellten Rückzahlungsanspruch. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält verbleibende_haftungsgrenze, haftungsbegrenzter_unterhaltsbetrag, nicht_von_dieser_haftung_gedeckt und haftungsrest_nach_forderung als EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1586b_T0003, BGB_1586b_T0004}
\examples{
unterhalt_erbenhaftungsbetrag(
  hypothetischer_pflichtteil = "1000",
  angerechnete_erbenleistungen = "300",
  offener_unterhalt = "900",
  haftungsnachweis = paste0(
    "Hypothetische Pflichtteilsgrenze ohne Güterstandsbesonderhei",
    "ten; anzurechnende Leistungen aller Erben konsolidiert."
  )
)
}
