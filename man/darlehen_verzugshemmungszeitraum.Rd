% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{darlehen_verzugshemmungszeitraum}
\alias{darlehen_verzugshemmungszeitraum}
\title{darlehen verzugshemmungszeitraum}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{darlehen_verzugshemmungszeitraum(
  anspruch_entstanden_am = NULL,
  erster_verzugshemmungstag = NULL,
  feststellung_letzter_hemmungstag = NULL,
  betrachtung_bis = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{anspruch_entstanden_am}{Entstehungstag des einzelnen rechtlich abgegrenzten Rueckzahlungs-/Zinsanspruchs; Zehnjahresgrenze laeuft hiervon, nicht erst vom Verzug.}
\item{erster_verzugshemmungstag}{Rechtlich auf volle Kalendertage normalisierter erster Hemmungstag aus Verzug497I.}
\item{feststellung_letzter_hemmungstag}{Optionaler rechtlich normalisierter letzter Hemmungstag bei qualifizierter Feststellung197I3bis5; None/NULL nur wenn bis Betrachtungsende keine solche Feststellung vorliegt.}
\item{betrachtung_bis}{Letzter tatsaechlich betrachteter Tag; keine Prognose einer kuenftigen Titulierung.}
\item{einordnungsnachweis}{497III3Anwendbarkeit fuer einzelnen Anspruch, Verzug und Tagesnormalisierung belegen; keine bereits abgelaufene Verjaehrung wiederbeleben. Titel-Hauptforderung-Zinsen-Ausnahme beachten.}
}
\details{Zehnjahresgrenze ab Anspruchsentstehung berechnen und beobachtetes Verzugshemmungsintervall an Feststellung beziehungsweise Hoechstgrenze abschneiden. §497III3: vom rechtlich normalisierten Verzugsbeginn bis qualifizierter Feststellung197I3bis5, hoechstens zehn Jahre ab Entstehung des einzelnen Anspruchs. Vorhandener Kalenderkern berechnet Zehnjahresgrenze, Intervall wird am fruehesten von Feststellung, Hoechstgrenze und Betrachtungsende abgeschnitten. Ohne Feststellung nur beobachtetes Intervall, kein behauptetes endgueltiges Verjaehrungsende. Unterschiedlich entstandene Einzelansprueche getrennt behandeln; Hemmung nach209 danach mit vorhandenem Kern kombinieren. Tagesnormalisierung einschliesslich Randtage rechtlich belegen; kein pauschales Aufrunden untertaegiger Ereignisse. Auch497IV nimmt III3nicht aus, wohingegen III5Titel-Hauptforderung-Zinsen-Ausnahme zu beachten ist. Keine persoenliche oder sachliche Anwendbarkeit automatisch feststellen, keine Hemmung einer schon abgelaufenen Frist. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{Zehnjahresgrenze und null oder ein auf beobachtete ganze Tage begrenztes Hemmungsintervall; kein endgueltiger Verjaehrungstag. Einheit: daten_und_intervalle.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_497_T0005, BGB_497_T0006, BGB_497_T0007, BGB_497_T0008, BGB_497_T0009, BGB_497_T0010, BGB_497_T0011, BGB_209_T0001}
\examples{
darlehen_verzugshemmungszeitraum(
  anspruch_entstanden_am = "2020-01-31",
  erster_verzugshemmungstag = "2024-01-01",
  feststellung_letzter_hemmungstag = NULL,
  betrachtung_bis = "2031-01-01",
  einordnungsnachweis = paste0(
    "§497III3: vom rechtlich normalisierten Verzugsbeginn bis qua",
    "lifizierter Feststellung197I3bis5, hoechstens zehn Jahre ab ",
    "Entstehung des einzelnen Anspruchs. Vorhandener Kalenderkern",
    " berechnet Zehnjahresgrenze, Intervall wird am fruehesten vo",
    "n Feststellung, Hoechstgrenze und Betrachtungsende abgeschni",
    "tten. Ohne Feststellung nur beobachtetes Intervall, kein beh",
    "auptetes endgueltiges Verjaehrungsende. Unterschiedlich ents",
    "tandene Einzelansprueche getrennt behandeln; Hemmung nach209",
    " danach mit vorhandenem Kern kombinieren. Tagesnormalisierun",
    "g einschliesslich Randtage rechtlich belegen; kein pauschale",
    "s Aufrunden untertaegiger Ereignisse. Auch497IV nimmt III3ni",
    "cht aus, wohingegen III5Titel-Hauptforderung-Zinsen-Ausnahme",
    " zu beachten ist. Keine persoenliche oder sachliche Anwendba",
    "rkeit automatisch feststellen, keine Hemmung einer schon abg",
    "elaufenen Frist."
  )
)
}
