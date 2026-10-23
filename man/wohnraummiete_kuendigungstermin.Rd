% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{wohnraummiete_kuendigungstermin}
\alias{wohnraummiete_kuendigungstermin}
\title{wohnraummiete kuendigungstermin}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{wohnraummiete_kuendigungstermin(
  zugang_kuendigung = NULL,
  fristfall = NULL,
  qualifizierte_zugangsgrenze_am = NULL,
  ueberlassungsbeginn_am = NULL,
  kuendigung_nach_573a = NULL,
  fristnachweis = NULL
)}
\arguments{
\item{zugang_kuendigung}{Rechtlich festgestellter Zugangstag als ISO-Datum.}
\item{fristfall}{mieter_standard, vermieter_standard, nebenraum_573b, moebliert_549_2_2, ausserordentlich_gesetzlich oder ausserordentlich_moebliert; gesetzlichen Anwendungsfall vorqualifizieren. Die letzten beiden Fälle entsprechen573dII ohne Vermieter-Jahresstaffel und ohne573a-Verlängerung.}
\item{qualifizierte_zugangsgrenze_am}{Rechtlich maßgeblicher letzter Zugangstag der Dritte-Werktag-Regel im Zugangsmonat, mindestens Tag3; Feiertage und einschlägige Zugangsregeln bereits qualifiziert. Im möblierten Sonderfall null.}
\item{ueberlassungsbeginn_am}{Nur vermieter_standard: Beginn des zusammenhängend anrechenbaren Überlassungszeitraums ab Tagesbeginn, ISO-Datum; sonst null.}
\item{kuendigung_nach_573a}{Expliziter Wahrheitswert zur Anwendung der zusätzlichen drei Monate nach573a; nur im Vermieter-Standardfall zulässig.}
\item{fristnachweis}{Nichtleerer Nachweis des gesetzlichen Fristfalls, normalisierten Zugangs, örtlicher Zugangsgrenze und gegebenenfalls Überlassungszeitraum/573a.}
}
\details{Zugangsgrenze prüfen;3Monate ab Monatsbeginn, bei verspätetem Zugang ein weiterer Monat; Vermieter nach5/8Jahren je3Monate und573a gegebenenfalls3Monate zusätzlich. Möblierter Sonderfall bis15.zum selben Monatsende. Nur gesetzliche Standardfälle nach573bII/573cI,III und qualifizierter573a-Verlängerung. Rechtliche Voraussetzungen, Wirksamkeit, Sperrfristen, abweichende Vereinbarungen und574ff-Fortsetzung getrennt. qualifizierte_zugangsgrenze_am bezeichnet den rechtlich bestimmten letzten Zugangstag der Dritte-Werktag-Regel nach einschlägiger örtlicher Werktags-/Feiertagskonvention; ausdrücklich vorgeben, keine Annahme Montag bis Freitag. Fristnachweis muss diese Grenze belegen; keine automatische193Verschiebung. Überlassungsbeginn bildet einen rechtlich anrechenbaren zusammenhängenden Zeitraum ab Tagesbeginn ab; intratägige Grenzfälle/abweichender Anrechnungsbeginn gesondert qualifizieren. Vermieterzuschläge nach5/8vollendeten Jahren jeweils3Monate,573a zusätzlich3Monate. Keine Staffelverlängerung des gesonderten573bII-Teilkündigungstermins; Bauverzögerung nach573bIII separat. Möblierter549II2-Fall: Zugang bis15.einschließlich zum selben Monatsende, später zum nächsten. Beendigungstermin nicht wegen Wochenende/Feiertag verschieben. §573dII: ausserordentlich_gesetzlich verwendet unabhängig von der Überlassungsdauer die Dreimonatsgrundregel; ausserordentlich_moebliert verwendet die feste15-Tage-Zugangsschwelle. Keine Vermieterverlängerung nach5/8Jahren und keine zusätzliche573a-Dreimonatsfrist. Ein Grund für die außerordentliche Kündigung mit gesetzlicher Frist muss bereits vorliegen, etwa nach544 erst nach Ablauf der Dreißigjahreswartefrist. Beide Parteien können diese qualifizierten573d-Fälle verwenden; Voraussetzungen und573dI bleiben gesondert. Kalenderdaten0001..9999, nichtnegative Jahres-/Monatsanzahlen; keine Rundung.}
\value{wert: zugangsgrenze_im_monat, zugangsgrenze_eingehalten, vollendete_ueberlassungsjahre (sonst null), verlaengerungsmonate, fruehester_beendigungstag. Einheit: datum_und_monate.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_573a_T0001, BGB_573a_T0002, BGB_573a_T0003, BGB_573a_T0004, BGB_573a_T0005, BGB_573b_T0001, BGB_573b_T0002, BGB_573b_T0003, BGB_573b_T0004, BGB_573b_T0005, BGB_573b_T0006, BGB_573b_T0007, BGB_573c_T0001, BGB_573c_T0002, BGB_573c_T0003, BGB_573c_T0004, BGB_573c_T0005, BGB_573d_T0001, BGB_573d_T0002, BGB_573d_T0003, BGB_573d_T0004}
\examples{
wohnraummiete_kuendigungstermin(
  zugang_kuendigung = "2024-01-04",
  fristfall = "mieter_standard",
  qualifizierte_zugangsgrenze_am = "2024-01-04",
  ueberlassungsbeginn_am = NULL,
  kuendigung_nach_573a = FALSE,
  fristnachweis = paste0(
    "Gesetzlicher Fall mit qualifizierter örtlicher Zugangsgrenze",
    "; Überlassung gegebenenfalls ab Tagesbeginn, keine Sonderver",
    "einbarung."
  )
)
}
