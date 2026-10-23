% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{gesellschaft_zustimmungsanzahl}
\alias{gesellschaft_zustimmungsanzahl}
\title{gesellschaft zustimmungsanzahl}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{gesellschaft_zustimmungsanzahl(
  erforderliche_personenzahl = NULL,
  zustimmende_personenzahl = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{erforderliche_personenzahl}{Positive ganze Zahl erforderlicher verschiedener Personen im qualifizierten Zustimmungskreis, höchstens2^53-1.}
\item{zustimmende_personenzahl}{Nichtnegative ganze Zahl bereits wirksam zustimmender verschiedener Personen genau dieses Kreises, höchstens erforderliche Personenzahl.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des maßgeblichen Personenkreises, gültiger Zustimmungen/Mitwirkung und rechtlicher Einordnung714/715II/720I; keine Doppelzählung.}
}
\details{Zahl noch fehlender Zustimmungen in einem rechtlich qualifizierten vollständigen Personenkreis bestimmen. Numerischer Vollständigkeitsvergleich714/715II beziehungsweise gemeinsam erforderlicher Mitwirkung720I. Personenkreis, Stimmberechtigung, Stimmverbote, wirksame Zustimmung/Mitwirkung und abweichender Gesellschaftsvertrag vorqualifizieren. Jede Person nur einmal zählen, Zustimmungen fremder Personen nicht hinzufügen. Bei714 alle Stimmberechtigten, nicht lediglich abgegebene Stimmen als Nenner. Ergebnis begründet allein weder einen wirksamen Beschluss noch eine wirksame Gesamtvertretung; für736V/736dI besondere Beteiligtenkreise nicht ungeprüft übernehmen. Exakte nichtnegative Anteile/Stimmgewichte beziehungsweise ganze Personenzahlen nach NUMERIK.md; Nenner positiv, Zustimmung höchstens Bezugsgröße. Keine Rundung.}
\value{wert: fehlende_zustimmungen (ganze Zahl), alle_erforderlichen_zustimmungen_erfasst (Wahrheitswert). Einheit: anzahl_und_wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_714_T0001, BGB_715_T0002, BGB_715_T0003, BGB_720_T0001}
\examples{
gesellschaft_zustimmungsanzahl(
  erforderliche_personenzahl = 3,
  zustimmende_personenzahl = 0,
  einordnungsnachweis = paste0(
    "Rechtlich qualifizierter Anteil beziehungsweise eindeutiger ",
    "Stimm-/Personenkreis mit zutreffender Bezugsbasis; keine aut",
    "omatische Beschlusswirksamkeit."
  )
)
}
