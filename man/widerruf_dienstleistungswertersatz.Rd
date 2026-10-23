% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{widerruf_dienstleistungswertersatz}
\alias{widerruf_dienstleistungswertersatz}
\title{widerruf dienstleistungswertersatz}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{widerruf_dienstleistungswertersatz(
  gesamtpreis = NULL,
  leistungsanteil_zaehler = NULL,
  leistungsanteil_nenner = NULL,
  gesamtpreis_unverhaeltnismaessig_hoch = NULL,
  marktwert_erbrachte_leistung = NULL,
  vorzeitiger_leistungsbeginn_verlangt = NULL,
  ausserhalb_geschaeftsraeumen = NULL,
  verlangen_auf_dauerhaftem_datentraeger = NULL,
  ordnungsgemaess_informiert = NULL,
  anwendungsfall_357a_absatz_2 = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{gesamtpreis}{Nichtnegativer vereinbarter Gesamtpreis in EUR für die rechtlich abgegrenzte Dienstleistung beziehungsweise erfasste Versorgung. Getrennt bepreiste oder unterschiedlich zu bewertende Teilleistungen zutreffend abgrenzen.}
\item{leistungsanteil_zaehler}{Nichtnegative ganze Zähleinheiten der bis zum wirksamen Widerruf erbrachten Leistung, höchstens Nenner und2^53-1. Rechtlich zutreffender Anteil am Gesamtpreis; bloßer Zeitablauf genügt nicht bei ungleichmäßiger Leistung oder Sondervergütungen.}
\item{leistungsanteil_nenner}{Positive ganze Bezugsmenge der gesamten vereinbarten Leistung im selben Maßstab, höchstens2^53-1. Anteil0..1. Bei Marktwertalternative typgültig erforderlich, aber Marktwert wird nicht nochmals damit multipliziert.}
\item{gesamtpreis_unverhaeltnismaessig_hoch}{Wahrheitswert einer rechtlich bewerteten Unverhältnismäßigkeit des vereinbarten Gesamtpreises. Keine automatische Prozentgrenze; TRUE wählt Marktwertalternative.}
\item{marktwert_erbrachte_leistung}{Nichtnegativer Marktwert in EUR gerade der bis zum Widerruf bereits erbrachten Leistung, nicht Marktwert der gesamten künftigen Vertragsleistung. Bei unverhältnismäßigem Preis Pflicht, sonst optional; freiwillige Angabe ebenfalls validiert. Keine zweite Anteilskürzung.}
\item{vorzeitiger_leistungsbeginn_verlangt}{Wahrheitswert eines ausdrücklichen Verlangens des Verbrauchers nach Leistungsbeginn vor Ablauf der Widerrufsfrist. Bloße Kenntnis oder Duldung nicht automatisch ausreichend.}
\item{ausserhalb_geschaeftsraeumen}{Wahrheitswert der rechtlichen Einordnung als außerhalb von Geschäftsräumen geschlossener Vertrag. TRUE aktiviert zusätzliche Datenträgeranforderung.}
\item{verlangen_auf_dauerhaftem_datentraeger}{Wahrheitswert, ob das ausdrückliche Verlangen auf dauerhaftem Datenträger übermittelt wurde. Nur bei außerhalb von Geschäftsräumen geschlossenem Vertrag erforderlich; Medium rechtlich prüfen.}
\item{ordnungsgemaess_informiert}{Wahrheitswert ordnungsgemäßer Informationen nach Artikel246a§1 Absatz2 Satz1 Nummer1 und3 EGBGB. Umfang, Inhalt und Zeitpunkt extern prüfen; kein bloßer beliebiger Belehrungstext.}
\item{anwendungsfall_357a_absatz_2}{Wahrheitswert eines wirksamen Widerrufs im sachlich/zeitlich einschlägigen§357a Absatz2: preisgeschuldete Dienstleistungen oder genannte nicht begrenzte Wasser-/Gas-/Stromlieferung beziehungsweise Fernwärme, ohne Finanzdienstleistungen. FALSE ergibt NICHT_ANWENDBAR. Nicht allgemeiner Schadensersatz.}
\item{bewertungsnachweis}{Nichtleere Beschreibung von wirksamem Widerruf, Leistungsart, Preis, bis Widerruf erbrachtem Anteil, gegebenenfalls Marktwert/Unverhältnismäßigkeit und gesetzlichen Informations-/Verlangensvoraussetzungen.}
}
\details{Im Anwendungsfall nur bei ausdrücklichem vorzeitigem Verlangen und ordnungsgemäßer Information sowie außerhalb Geschäftsräumen Übermittlung auf dauerhaftem Datenträger. Dann Gesamtpreis×Leistungsanteil; bei unverhältnismäßigem Gesamtpreis stattdessen Marktwert der bereits erbrachten Leistung. Fehlt Anspruchsvoraussetzung, Betrag0. Nur§357a Absatz2. Marktwert der erbrachten Leistung nicht nochmals anteilig reduzieren. Leistungsanteil nicht automatisch Zeitquote. Keine automatische AGB-/Preisangemessenheitsprüfung; Finanzdienstleistung/Finanzierungshilfe§357b gesondert. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakter EUR-Wertersatz; fehlende gesetzliche Voraussetzung im Anwendungsfall ergibt0/1. Fehlender Anwendungsfall ergibt NICHT_ANWENDBAR mit null. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_357a_T0004, BGB_357a_T0005, BGB_357a_T0006, BGB_357a_T0007, BGB_357a_T0008, BGB_357a_T0009}
\examples{
widerruf_dienstleistungswertersatz(
  gesamtpreis = "1200",
  leistungsanteil_zaehler = 1,
  leistungsanteil_nenner = 3,
  gesamtpreis_unverhaeltnismaessig_hoch = FALSE,
  marktwert_erbrachte_leistung = "250",
  vorzeitiger_leistungsbeginn_verlangt = FALSE,
  ausserhalb_geschaeftsraeumen = FALSE,
  verlangen_auf_dauerhaftem_datentraeger = FALSE,
  ordnungsgemaess_informiert = FALSE,
  anwendungsfall_357a_absatz_2 = TRUE,
  bewertungsnachweis = paste0(
    "Synthetische rechtlich bestimmte Leistung, Preis und Vorauss",
    "etzungen."
  )
)
}
