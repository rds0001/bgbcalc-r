\name{vergleichsmiete_zeitvoraussetzungen}
\alias{vergleichsmiete_zeitvoraussetzungen}
\title{Zeitvoraussetzungen der Vergleichsmietenerhöhung}
\description{Ein volles Jahr und15Monate unveränderte Miete ab Tagesbeginn berechnen. Frühesten zulässigen Zugang und frühesten Mietbeginn jeweils als Tag nach dem Ablauf ausweisen. Aus dem tatsächlichen Zugang: Zustimmung bis zum Ende des zweiten Folgemonats, Mietbeginn bei Zustimmung am ersten Tag des dritten Folgemonats, reguläres rechnerisches Klagefristende am letzten Tag des fünften Folgemonats. Tatsächlichen Zugang und zugangsbezogenen Mietbeginn getrennt mit den Mindestterminen vergleichen.}
\usage{
vergleichsmiete_zeitvoraussetzungen(letzte_massgebliche_miete_ab = NULL,
  zugang_erhoehungsverlangen = NULL,
  verlangen_formell_ordnungsgemaess = NULL)
}
\arguments{
  \item{letzte_massgebliche_miete_ab}{ISO-Datum YYYY-MM-DD des Tagesbeginns, seit dem die für §558 Abs.1 maßgebliche Miete unverändert gilt; bei der ersten Erhöhung der maßgebliche Beginn der Ausgangsmiete. Erhöhungen nach §§559 bis560 bei Bestimmung dieses Zeitpunkts nicht als fristauslösenden Neubeginn behandeln. Der Beginn darf nicht nach dem Zugang liegen.}
  \item{zugang_erhoehungsverlangen}{ISO-Datum des nachgewiesenen Zugangs des maßgeblichen Erhöhungsverlangens. Versanddatum genügt nicht. Bei Nachholung oder Heilung im Rechtsstreit nach §558b Abs.3 ist der dafür maßgebliche neue Zugang zu bestimmen; die Funktion erkennt oder heilt Mängel nicht.}
  \item{verlangen_formell_ordnungsgemaess}{Expliziter Wahrheitswert zur formellen Ordnungsmäßigkeit nach §558a, insbesondere Textform und Begründung. Die zeitlichen Voraussetzungen sind nicht darin vorwegzunehmen; sie werden separat berechnet. FALSE ergibt NICHT_ANWENDBAR. Materieller Anwendungsbereich des Vergleichsmietenverfahrens ist vorausgesetzt.}
}
\details{Zeitliche Teilprüfung, kein vollständiger Anspruch auf Mieterhöhung. Vergleichsmietbetrag, Kappung, Drittmittel und sonstige Wirksamkeitsvoraussetzungen nicht hier berechnet. Mietbeginn setzt Zustimmung voraus; fehlende Zustimmung nicht durch TRUE bei der formellen Ordnungsmäßigkeit ersetzen. Verfrühtes Verlangen wird nicht automatisch verschoben. Rechnerische Monatsfristenden sind vor einer gesondert zu prüfenden Anwendung von §193 oder einschlägigem Verfahrensrecht angegeben; keine abschließende Klagefristberechnung unter Feiertagsverschiebungen. Bei Nachholung oder Heilung nach §558b Abs.3 ist die neue maßgebliche Erklärung gesondert zugrunde zu legen. Sonderrechte des Mieters, insbesondere Kündigung nach §561, werden hier nicht entschieden.}
\value{wert enthält fünf ISO-Daten: fruehester_zugang_nach_jahresfrist, fruehester_mietbeginn_nach_wartefrist, mietbeginn_bei_zustimmung, rechnerisches_ende_zustimmungsfrist und rechnerisches_ende_klagefrist. Hinzu kommen die getrennten Wahrheitswerte jahresfrist_eingehalten und wartefrist_eingehalten. BERECHNET bedeutet durchgeführte Teilprüfung, nicht automatisch erfüllte Fristen. Bei NICHT_ANWENDBAR ist wert null. Fehler als bgb_berechnungsfehler mit EINGABE_FEHLT oder EINGABE_UNGUELTIG.}
\examples{
vergleichsmiete_zeitvoraussetzungen("2025-01-01", "2026-01-01", TRUE)
}
