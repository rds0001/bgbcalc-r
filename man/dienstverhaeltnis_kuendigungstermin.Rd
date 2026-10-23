% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{dienstverhaeltnis_kuendigungstermin}
\alias{dienstverhaeltnis_kuendigungstermin}
\title{dienstverhaeltnis kuendigungstermin}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{dienstverhaeltnis_kuendigungstermin(
  zugang_kuendigung = NULL,
  verguetungsbemessung = NULL,
  erwerbstaetigkeit_vollstaendig_oder_hauptsaechlich = NULL,
  erster_werktag_der_zugangswoche = NULL,
  gesetzliche_regel_621_anwendbar = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{zugang_kuendigung}{ISO-Datum0001..9999 des rechtlich maßgeblichen Kündigungszugangs; keine bloße Absendung und keine automatische Zugangsfiktion.}
\item{verguetungsbemessung}{Genau tage, wochen, monate, vierteljahre_oder_laenger oder ohne_zeitabschnitte. Maßgeblich Bemessung der Vergütung, nicht allein Auszahlungsrhythmus.}
\item{erwerbstaetigkeit_vollstaendig_oder_hauptsaechlich}{Wahrheitswert der vollständigen oder hauptsächlichen Inanspruchnahme der Erwerbstätigkeit des Verpflichteten. Bei ohne_zeitabschnitte zwei Wochen statt jederzeit; andere Bemessungen bleiben unverändert.}
\item{erster_werktag_der_zugangswoche}{Bei wochen erforderliches ISO-Datum des rechtlich bestimmten ersten Werktags derselben Kalenderwoche (Montag bis Samstag), unter Berücksichtigung örtlicher Feiertage. Sonst optional NULL; freiwillig angegebener Wert wird validiert. Nicht erster persönlicher Arbeitstag. Feiertagsprüfung im Nachweis belegen.}
\item{gesetzliche_regel_621_anwendbar}{Wahrheitswert: sonstiges Dienstverhältnis außerhalb§622, auf das gesetzliche Kündigungsregel§621 anwendbar ist. Abweichende wirksame Vereinbarung, Befristung und Sonderrecht gesondert prüfen. FALSE ergibt NICHT_ANWENDBAR.}
\item{einordnungsnachweis}{Nichtleere Begründung von Dienstverhältnis, Vergütungsbemessung, rechtlichem Zugang, Erwerbsbeanspruchung und bei Wochenbemessung örtlich bestimmtem erstem Werktag.}
}
\details{Tagesbemessung: Folgetag. Wochenbemessung: bei Zugang bis erstem Werktag Samstag derselben Woche, danach nächster Samstag. Monatsbemessung: bis15. Monatsende, danach Folgemonatsende. Vierteljahre oder länger: sechs Wochen Vorlauf zum nächsten Quartalsende. Ohne Zeitabschnitt: jederzeit oder zwei Wochen bei vollständiger/hauptsächlicher Erwerbsbeanspruchung. Nur gesetzlicher Standard, keine Wirksamkeits-/Sonderrechtsprüfung. Ersten Werktag wegen örtlicher Feiertage qualifiziert vorgeben. Keine automatische§193-Verschiebung. Bei jederzeit Datum=Zugangstag, keine erfundene Bindung bis Tagesende. ISO-Daten und berechnete Termine0001..9999, fünf Vergütungsmodelle, explizite Wahrheitswerte und nichtleerer Nachweis.}
\value{wert enthält fruehester_beendigungstag als ISO-Datum und ohne_kuendigungsfrist als Wahrheitswert. Außerhalb Anwendungsbereich NICHT_ANWENDBAR/null. Einheit: datum_und_wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_621_T0001, BGB_621_T0002, BGB_621_T0003, BGB_621_T0004, BGB_621_T0005, BGB_621_T0006}
\examples{
dienstverhaeltnis_kuendigungstermin(
  zugang_kuendigung = "2030-01-07",
  verguetungsbemessung = "tage",
  erwerbstaetigkeit_vollstaendig_oder_hauptsaechlich = FALSE,
  erster_werktag_der_zugangswoche = NULL,
  gesetzliche_regel_621_anwendbar = TRUE,
  einordnungsnachweis = paste0(
    "Synthetisch sonstiges Dienstverhältnis, gesetzliche Regel, r",
    "echtlich festgestellter Zugang; Wochenwerktag mit örtlicher ",
    "Feiertagsprüfung."
  )
)
}
