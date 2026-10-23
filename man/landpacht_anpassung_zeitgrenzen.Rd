% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{landpacht_anpassung_zeitgrenzen}
\alias{landpacht_anpassung_zeitgrenzen}
\title{landpacht anpassung zeitgrenzen}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{landpacht_anpassung_zeitgrenzen(
  pachtbeginn_am = NULL,
  letzte_aenderung_wirksam_am = NULL,
  beginnart = NULL,
  naturereignis_ausnahme = NULL,
  aenderungsverlangen_am = NULL,
  pachtjahr_beginn_am = NULL,
  pachtjahr_ende_am = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{pachtbeginn_am}{Rechtlich maßgeblicher Beginn des Pachtverhältnisses YYYY-MM-DD.}
\item{letzte_aenderung_wirksam_am}{Optionaler Tag der letzten rechtlich wirksamen Änderung der Vertragsleistungen; sonst null. Nicht vor Pachtbeginn.}
\item{beginnart}{ereignis oder tagesbeginn für den maßgeblichen Beginn der Zweijahreswartezeit rechtlich bestimmen.}
\item{naturereignis_ausnahme}{Wahr nur bei vorqualifiziertem Ausnahmefall des593II2; sonst falsch.}
\item{aenderungsverlangen_am}{Tag der Erklärung des Änderungsverlangens YYYY-MM-DD.}
\item{pachtjahr_beginn_am}{Beginn des rechtlich maßgeblichen Pachtjahres, in dem das Verlangen erklärt wird.}
\item{pachtjahr_ende_am}{Letzter Tag dieses Pachtjahres; keine automatische Gleichsetzung mit Kalenderjahr.}
\item{einordnungsnachweis}{Nichtleerer Nachweis der gesetzlichen Anwendbarkeit, Fristbeginnart, Pachtjahresgrenzen und gegebenenfalls Naturereignisausnahme.}
}
\details{Zweijahreswartezeit und Ausnahme rechnerisch verknüpfen, Erklärungstag vergleichen und Rückwirkungsgrenze des zugeordneten Pachtjahres ausweisen. §593II/III: Zweijahreswartezeit ab Beginn beziehungsweise letzter wirksamer Vertragsleistungsänderung, außer qualifiziertem verwüstendem Naturereignis ohne üblichen Versicherungsschutz. Beginnart rechtlich bestimmen; beim Tagesbeginn1.Juli2022 endet die Wartezeit30.Juni2024, erster Folgetag1.Juli2024. Ausgewiesene Rückwirkungsgrenze ist der Beginn des Pachtjahres des tatsächlichen Verlangens, nicht automatisch der Erklärungstag oder Kalenderjahresbeginn. Eine rechnerisch verfrühte Erklärung wird weder verschoben noch als wirksam bestätigt. Grundlegende Verhältnisänderung, grobes Missverhältnis, Ausschlüsse und konkrete neue Vertragsleistung bleiben extern qualifiziert. Keine Änderung der Pachtdauer, kein automatisch berechneter angemessener Pachtzins; weitere gerichtliche/vertragliche Wirkungen separat. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert mit erster_tag_nach_wartezeit (bei gesetzlicher Ausnahme null), rechnerische_rueckwirkungsgrenze als Datum und wartezeit_eingehalten als Wahrheitswert. Einheit: daten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_593_T0003, BGB_593_T0004, BGB_593_T0005}
\examples{
landpacht_anpassung_zeitgrenzen(
  pachtbeginn_am = "2022-07-01",
  letzte_aenderung_wirksam_am = NULL,
  beginnart = "tagesbeginn",
  naturereignis_ausnahme = FALSE,
  aenderungsverlangen_am = "2024-07-01",
  pachtjahr_beginn_am = "2024-07-01",
  pachtjahr_ende_am = "2025-06-30",
  einordnungsnachweis = paste0(
    "§593II/III: Zweijahreswartezeit ab Beginn beziehungsweise le",
    "tzter wirksamer Vertragsleistungsänderung, außer qualifizier",
    "tem verwüstendem Naturereignis ohne üblichen Versicherungssc",
    "hutz. Beginnart rechtlich bestimmen; beim Tagesbeginn1.Juli2",
    "022 endet die Wartezeit30.Juni2024, erster Folgetag1.Juli202",
    "4. Ausgewiesene Rückwirkungsgrenze ist der Beginn des Pachtj",
    "ahres des tatsächlichen Verlangens, nicht automatisch der Er",
    "klärungstag oder Kalenderjahresbeginn. Eine rechnerisch verf",
    "rühte Erklärung wird weder verschoben noch als wirksam bestä",
    "tigt. Grundlegende Verhältnisänderung, grobes Missverhältnis",
    ", Ausschlüsse und konkrete neue Vertragsleistung bleiben ext",
    "ern qualifiziert. Keine Änderung der Pachtdauer, kein automa",
    "tisch berechneter angemessener Pachtzins; weitere gerichtlic",
    "he/vertragliche Wirkungen separat."
  )
)
}
