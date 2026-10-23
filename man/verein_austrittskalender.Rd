% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{verein_austrittskalender}
\alias{verein_austrittskalender}
\title{verein austrittskalender}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{verein_austrittskalender(
  kuendigungszugang_am = NULL,
  fristdauer = NULL,
  fristeinheit = NULL,
  nur_zum_geschaeftsjahresende = NULL,
  geschaeftsjahresenden = NULL,
  satzungsnachweis = NULL
)}
\arguments{
\item{kuendigungszugang_am}{Rechtlich feststehender Zugangstag der AustrittserklärungYYYY-MM-DD.}
\item{fristdauer}{Nichtnegative ganze Zahl der satzungsmäßig vorgesehenen Kündigungsfrist in fristeinheit;0 bedeutet keine zusätzliche Kündigungsfrist. Höchstens3652059, alle berechneten Daten einschließlich Zweijahresvergleich im Kalenderbereich.}
\item{fristeinheit}{tage, wochen, monate oder jahre; satzungsmäßige Dauer, keine freie Wahl zur Änderung der Frist.}
\item{nur_zum_geschaeftsjahresende}{Expliziter Wahrheitswert zur qualifizierten Satzungsbindung an das Geschäftsjahresende.}
\item{geschaeftsjahresenden}{Nur bei Geschäftsjahresbindung vollständige streng aufsteigende Liste1..1000 maßgeblicher Geschäftsjahresenden alsISO-Daten, ab Zugang bis mindestens zum benötigten Termin. Sonst null. Kein Kalenderjahr automatisch unterstellen.}
\item{satzungsnachweis}{Nichtleerer Nachweis von Zugang, satzungsmäßiger Frist, Geschäftsjahr und gegebenenfalls rechtlich qualifizierter Kombination. Ergebnis ist ein Rechenvergleich, kein Wirksamkeitsurteil.}
}
\details{Ereignisfrist und Zweijahresgrenze kalendergenau berechnen; gegebenenfalls erstes einschlägiges Geschäftsjahresende ab Fristende auswählen und beide Termine getrennt mit der Zweijahresgrenze vergleichen. §39II: rechnerischer Vergleich einer satzungsmäßig vorgegebenen Kündigungsfrist mit höchstens zwei Kalenderjahren sowie Auswahl des nächsten einschlägigen Geschäftsjahresendes. Fristdauer0 bedeutet keine zusätzliche Kündigungsfrist. Geschäftsjahr und gegebenenfalls Kombination beider Satzungsbedingungen rechtlich vorqualifizieren; keine automatische Satzungsauslegung. Die beiden Zweijahresvergleiche betreffen getrennt die Kündigungsfrist und den resultierenden Kalendertermin. Eine Überschreitung wird sichtbar gemacht, nicht durch eine erfundene geltungserhaltende Reduktion geheilt; keine automatische Wirksamkeitsentscheidung für die Satzung oder den Austritt. Alle einschlägigen Geschäftsjahresenden ab Zugang bis zum benötigten Termin vollständig und geordnet vorgeben. Keine automatische193-Verschiebung eines Geschäftsjahresendes. Die Zweijahresgrenze wird kalendergenau berechnet, nicht pauschal als730Tage. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält rechnerisches_kuendigungsfristende, rechnerischer_austrittstermin, zweijahresgrenze und zwei getrennte Wahrheitswerte zur zeitlichen Grenzüberschreitung. Kein automatisches Gültigkeitsurteil. Einheit: daten_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_39_T0002}
\examples{
verein_austrittskalender(
  kuendigungszugang_am = "2024-02-29",
  fristdauer = 1,
  fristeinheit = "jahre",
  nur_zum_geschaeftsjahresende = FALSE,
  geschaeftsjahresenden = NULL,
  satzungsnachweis = paste0(
    "§39II: rechnerischer Vergleich einer satzungsmäßig vorgegebe",
    "nen Kündigungsfrist mit höchstens zwei Kalenderjahren sowie ",
    "Auswahl des nächsten einschlägigen Geschäftsjahresendes. Fri",
    "stdauer0 bedeutet keine zusätzliche Kündigungsfrist. Geschäf",
    "tsjahr und gegebenenfalls Kombination beider Satzungsbedingu",
    "ngen rechtlich vorqualifizieren; keine automatische Satzungs",
    "auslegung. Die beiden Zweijahresvergleiche betreffen getrenn",
    "t die Kündigungsfrist und den resultierenden Kalendertermin.",
    " Eine Überschreitung wird sichtbar gemacht, nicht durch eine",
    " erfundene geltungserhaltende Reduktion geheilt; keine autom",
    "atische Wirksamkeitsentscheidung für die Satzung oder den Au",
    "stritt. Alle einschlägigen Geschäftsjahresenden ab Zugang bi",
    "s zum benötigten Termin vollständig und geordnet vorgeben. K",
    "eine automatische193-Verschiebung eines Geschäftsjahresendes",
    ". Die Zweijahresgrenze wird kalendergenau berechnet, nicht p",
    "auschal als730Tage."
  )
)
}
