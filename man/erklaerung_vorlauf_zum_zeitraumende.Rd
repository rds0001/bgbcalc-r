% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{erklaerung_vorlauf_zum_zeitraumende}
\alias{erklaerung_vorlauf_zum_zeitraumende}
\title{erklaerung vorlauf zum zeitraumende}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{erklaerung_vorlauf_zum_zeitraumende(
  vorlauffall = NULL,
  erklaerungseingang_am = NULL,
  beendigung_am = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{vorlauffall}{mietwiderspruch_574b, pachterbenwiderspruch_594d, pachtfortsetzung_595 oder pachtgerichtsantrag_595. Zusätzlich darlehen_zinsbindungsende_493, darlehen_vertragsende_493.}
\item{erklaerungseingang_am}{ISO-Datum des rechtlich maßgeblichen tatsächlichen Zugangs beim Vertragspartner beziehungsweise Antragseingangs beim Gericht.}
\item{beendigung_am}{ISO-Datum des letzten eingeschlossenen Vertrags-/Pachttages; Vertragsbeendigung mit Ablauf dieses Tages, nicht bei dessen Beginn. Bei493 auch letzter eingeschlossener Tag der Sollzinsbindung.}
\item{einordnungsnachweis}{Nichtleere Qualifikation des gesetzlichen Regelfalls, richtigen Empfängers, vollständiger Erklärung und Beendigung zu Tagesablauf. Sonderfristen und Ausnahmen gesondert.}
}
\details{Gesetzlichen Vorlauf ab tatsächlichem Erklärungseingang berechnen und mit Beendigung zu Tagesablauf vergleichen. §574bII Zwei-Monats-Vorlauf, §594dII Drei-Monats-Vorlauf, §595V Ein-Jahres-Vorlauf oder §595VII Neun-Monats-Vorlauf. Ereignisbeginn nach§187I und Ablauf nach§188; der volle Vorlauf muss spätestens mit Ablauf des angegebenen letzten Vertragstages enden. Anders als Beginn eines Tages schließt dieser Bezugszeitpunkt den Beendigungstag ein. Keine automatische Anwendung von§193 und keine automatische Unwirksamkeit verspäteter Erklärungen. §574bII2 fehlender rechtzeitiger Vermieterhinweis, §595V/VII Sonderfälle bei höchstens zwölfmonatiger Kündigungsfrist und gerichtliche Nachzulassung gesondert; für diese Sonderfälle existieren eigene Grundfristen. §594dII Bewirtschaftung und vollständige Mitteilung sind rechtliche Voraussetzungen. §493I/II: Unterrichtung spaetestens drei Kalendermonate vor dem rechtlich feststehenden Ende der Sollzinsbindung beziehungsweise des Darlehensvertrags zu Tagesablauf. Tatsaechlichen Zugang vorwaerts gegen Endtag pruefen; erforderliche Informationsinhalte und Verhaeltnis von Zinsbindung zu Rueckzahlungszeit bleiben rechtliche Qualifikation. Keine automatische Informationspflicht oder Wirksamkeitsentscheidung. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert.vorlauf_ablauf_am bezeichnet letzten eingeschlossenen Vorlauftag; wert.vorlauf_zum_zeitraumende_eingehalten ist wahr, wenn der Vertrag erst mit Ablauf dieses oder eines späteren Tages endet. Nur numerische Regelfallprüfung. Einheit: datum_und_wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_493_T0001, BGB_493_T0002, BGB_493_T0003, BGB_493_T0004, BGB_493_T0005, BGB_493_T0006, BGB_493_T0007, BGB_493_T0008, BGB_493_T0009, BGB_493_T0010, BGB_493_T0011, BGB_493_T0012, BGB_493_T0013, BGB_493_T0014, BGB_493_T0015, BGB_493_T0016, BGB_493_T0017, BGB_493_T0018, BGB_493_T0019, BGB_493_T0020, BGB_493_T0021, BGB_493_T0022, BGB_493_T0023, BGB_493_T0024, BGB_493_T0025, BGB_493_T0026, BGB_493_T0027, BGB_493_T0028, BGB_574b_T0001, BGB_574b_T0002, BGB_574b_T0003, BGB_574b_T0004, BGB_574b_T0005, BGB_594d_T0001, BGB_594d_T0002, BGB_594d_T0003, BGB_594d_T0004, BGB_594d_T0005, BGB_594d_T0006, BGB_595_T0001, BGB_595_T0002, BGB_595_T0003, BGB_595_T0004, BGB_595_T0005, BGB_595_T0006, BGB_595_T0007, BGB_595_T0008, BGB_595_T0009, BGB_595_T0010, BGB_595_T0011, BGB_595_T0012, BGB_595_T0013, BGB_595_T0014, BGB_595_T0015, BGB_595_T0016, BGB_595_T0017, BGB_595_T0018, BGB_595_T0019, BGB_595_T0020, BGB_595_T0021, BGB_595_T0022}
\examples{
erklaerung_vorlauf_zum_zeitraumende(
  vorlauffall = "mietwiderspruch_574b",
  erklaerungseingang_am = "2024-07-31",
  beendigung_am = "2024-09-30",
  einordnungsnachweis = paste0(
    "§574bII Zwei-Monats-Vorlauf, §594dII Drei-Monats-Vorlauf, §5",
    "95V Ein-Jahres-Vorlauf oder §595VII Neun-Monats-Vorlauf. Ere",
    "ignisbeginn nach§187I und Ablauf nach§188; der volle Vorlauf",
    " muss spätestens mit Ablauf des angegebenen letzten Vertrags",
    "tages enden. Anders als Beginn eines Tages schließt dieser B",
    "ezugszeitpunkt den Beendigungstag ein. Keine automatische An",
    "wendung von§193 und keine automatische Unwirksamkeit verspät",
    "eter Erklärungen. §574bII2 fehlender rechtzeitiger Vermieter",
    "hinweis, §595V/VII Sonderfälle bei höchstens zwölfmonatiger ",
    "Kündigungsfrist und gerichtliche Nachzulassung gesondert; fü",
    "r diese Sonderfälle existieren eigene Grundfristen. §594dII ",
    "Bewirtschaftung und vollständige Mitteilung sind rechtliche ",
    "Voraussetzungen."
  )
)
}
