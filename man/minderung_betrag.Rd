\name{minderung_betrag}
\alias{minderung_betrag}
\title{Relative Minderung}
\description{Minderungsbetrag = vereinbarter Preis * (1 - wirklicher Wert/mangelfreier Wert) * Mangelzeitanteil. Geminderter Preis = vereinbarter Preis - Minderungsbetrag. Erstattungsbetrag = max(geleistete Zahlung - geminderter Preis, 0). Kauf/Werk und digitale Einmalbereitstellung verlangen Zeitanteil 1; digitale Dauerbereitstellung und Reise berücksichtigen betroffene Dauer.}
\usage{
minderung_betrag(vereinbarter_preis = NULL,
  mangelfreier_wert = NULL,
  wirklicher_wert = NULL,
  geleistete_zahlung = NULL,
  regelbereich = NULL,
  wertzeitpunkt = NULL,
  mangelzeitanteil_zaehler = NULL,
  mangelzeitanteil_nenner = NULL,
  wert_und_zeitnachweis = NULL,
  minderungsrecht = NULL,
  minderungserklaerung = NULL,
  anzeigeausschluss = NULL)
}
\arguments{
\item{vereinbarter_preis}{Nichtnegative Dezimalzeichenfolge des vereinbarten Preises in EUR für die bewertete Leistung oder Bezugsperiode. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{mangelfreier_wert}{Positive Dezimalzeichenfolge des bewerteten Werts in mangelfreiem Zustand zum maßgeblichen Bewertungszeitpunkt. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{wirklicher_wert}{Nichtnegative Dezimalzeichenfolge des tatsächlichen Werts zum selben Bewertungszeitpunkt; höchstens der mangelfreie Wert. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{geleistete_zahlung}{Nichtnegative Dezimalzeichenfolge der auf die ausgewählte Leistung bereits gezahlten Summe in EUR. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{regelbereich}{kauf, werk, digital_einmal, digital_dauer oder reise. Mietminderung gehört nicht zu dieser Funktion.}
\item{wertzeitpunkt}{vertragsschluss für Kauf/Werk/Reise; bereitstellung für digitale Produkte. Beide Vergleichswerte müssen diesem Zeitpunkt zugeordnet sein.}
\item{mangelzeitanteil_zaehler}{Nichtnegative ganze Zahl des betroffenen Zeitanteils. Bei Kauf/Werk/digital_einmal muss der Anteil genau 1 sein.}
\item{mangelzeitanteil_nenner}{Positive ganze Zahl als Nenner; der Zeitanteil darf insgesamt 1 nicht überschreiten.}
\item{wert_und_zeitnachweis}{Nichtleere Beschreibung der Wertansätze und der zeitlichen Zuordnung. Zeitgewichtung nur für passend bepreiste Bezugsperiode; unterschiedliche Preis- oder Mangelabschnitte getrennt bewerten.}
\item{minderungsrecht}{Expliziter Wahrheitswert zu den sonstigen rechtlichen Voraussetzungen und Ausschlüssen; ersetzt keine automatische Rechtsprüfung.}
\item{minderungserklaerung}{Expliziter Wahrheitswert zur wirksamen Erklärung. Im Reisebereich wird keine Erklärung verlangt; der Wert beeinflusst dort die Berechnung nicht.}
\item{anzeigeausschluss}{Nur für Reise: schuldhaft unterlassene Anzeige hat eine Abhilfe verhindert. In anderen Bereichen FALSE. Bloße Verspätung reicht für den Ausschluss nicht aus.}
}
\details{Kauf/Werk/Reise: Bewertungszeitpunkt Vertragsschluss; digitale Produkte: Bereitstellung. Kauf/Werk/Digital: wirksame Minderungserklärung erforderlich; Reise kraft Gesetzes ohne Erklärung. Anzeigeausschluss nur Reise: schuldhaft unterlassene Anzeige hat Abhilfe verhindert, § 651o Abs. 2; bloß verspätete Anzeige genügt nicht. Sonstige Voraussetzungen und Ausschlüsse einschließlich gemeinsamer Erklärung bei mehreren Käufern/Bestellern/Verkäufern/Unternehmern werden in minderungsrecht bewertet eingegeben. Zeitanteil setzt eine entsprechend gleichmäßig bepreiste Bezugsperiode voraus; bei unterschiedlichen Preis-/Mangelabschnitten getrennte Bewertung erforderlich, keine blind nach Tagen verteilte Gesamtreise. Schätzungen sind Nutzervorgaben; kein automatischer Bewertungsalgorithmus. Erstattungsfrist/Zahlungsmittel nach § 327n Abs. 4 sowie Nutzungsherausgabe §§ 346/347 sind gesondert.}
\value{S3-Objekt bgb_ergebnis. wert enthält geminderter_preis, minderungsbetrag, erstattungsbetrag als exakte EUR-Brüche. Bei Nichtanwendbarkeit wert null. Keine automatische Cent-Rundung. Fehlende/ungültige Eingaben erzeugen bgb_berechnungsfehler.}
\examples{
minderung_betrag("800", "1000", "750", "800", "kauf",
  "vertragsschluss", 1, 1, "Bewertete Vertragswerte, Gesamtleistung",
  TRUE, TRUE, FALSE)
}
