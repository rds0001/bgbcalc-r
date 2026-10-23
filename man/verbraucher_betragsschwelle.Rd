% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{verbraucher_betragsschwelle}
\alias{verbraucher_betragsschwelle}
\title{verbraucher betragsschwelle}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{verbraucher_betragsschwelle(
  schwellenfall = NULL,
  massgeblicher_betrag = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{schwellenfall}{Genau einer der Fälle: sofortgeschaeft_kleinbetrag: §312 Absatz2 Nummer12: Entgelt im qualifizierten sofort erfüllten und bezahlten Außergeschäftsraumvertrag; nur Betragsmerkmal.; einwendungsdurchgriff_mindestentgelt: §359 Absatz2: finanziertes Entgelt mindestens200Euro vermeidet nur diesen Kleinbetragsausschluss; andere Ausschlüsse und Voraussetzungen separat.; allgemeindarlehen_kleinbetrag: §491 Absatz2 Satz2 Nummer1: Nettodarlehensbetrag unter200Euro; kein allgemeiner Ausschluss aller Verbraucherschutzrechte.; existenzgruendung_hoechstbetrag: §513: Nettodarlehensbetrag oder Barzahlungspreis bis75000Euro; Existenzgründungszweck/natürliche Person und EU-Ausnahme separat qualifizieren.; fehlende_sicherheitenangabe_ausnahme: §494 Absatz6 Satz2: Allgemein-Verbraucherdarlehen mit Nettodarlehensbetrag über75000Euro; nur Betragsmerkmal der Ausnahme bei fehlender Sicherheitenangabe. Zusätzlich reisesicherung_alternative_absicherung_umsatz. Zusätzlich reisesicherung_einstandshoechstbetrag_umsatz.}
\item{massgeblicher_betrag}{Nichtnegative exakte EUR-Dezimalzeichenfolge oder Bruchobjekt zaehler/nenner. Je Fall Entgelt, finanziertes Entgelt, Nettodarlehensbetrag oder Barzahlungspreis; keine automatische Bezugsgrößenbestimmung. Bei651r qualifizierter Umsatz des letzten abgeschlossenen Geschäftsjahres, nicht laufender Jahresumsatz.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des rechtlichen Anwendungsbereichs und der passenden Bezugsgröße; qualitative Voraussetzungen gesondert.}
}
\details{312Entgelt<=40;359finanziertesEntgelt>=200;491Nettobetrag<200;513Nettobetrag/Barpreis<=75000;494VI2Nettobetrag>75000. Nur Betragsmerkmal, keine vollständige Anwendungs-/Anspruchsprüfung. EU-Ausnahmen/Finanzinstrumente/sofortige Leistung und Zahlung als qualifizierter Kontext. Kein automatischer Zahlungsanspruch oder gesetzlicher Höchstpreis. Zusatzfall reisesicherung_alternative_absicherung_umsatz: §651rII2: qualifizierter Umsatz im letzten abgeschlossenen Geschäftsjahr strikt unter10MillionenEUR; nur Zahlenvoraussetzung der alternativen Absicherung im folgenden Geschäftsjahr. Umsatzbegriff nachReisesicherungsfondsgesetz vorqualifiziert. Keine automatische Zulässigkeit eines Versicherers/Kreditinstituts. Zusatzfall reisesicherung_einstandshoechstbetrag_umsatz: §651rIII3: qualifizierter Vorjahresumsatz strikt unter3MillionenEUR; nur Umsatzmerkmal einer zulässigen vereinbarten1Million-EUR-Grenze je Insolvenz bei Versicherer/Kreditinstitut. Kein automatischer Deckel oder Schadensbetrag; Reisesicherungsfonds und weitere Voraussetzungen gesondert. Nichtnegative exakte EUR-Beträge im gemeinsamen sicheren Zahlenbereich; feste Fallliste; Nachweis nichtleer.}
\value{wert enthält gesetzlicher_grenzbetrag als exakten Bruch, vergleichsrichtung und betragsmerkmal_erfuellt. Einheit: eur_und_wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_312_T0016, BGB_359_T0004, BGB_491_T0005, BGB_494_T0009, BGB_513_T0001, BGB_651r_T0007, BGB_651r_T0013}
\examples{
verbraucher_betragsschwelle(
  schwellenfall = "sofortgeschaeft_kleinbetrag",
  massgeblicher_betrag = "39.99",
  einordnungsnachweis = paste0(
    "Qualifizierter gesetzlicher Anwendungsfall und richtige Bezu",
    "gsgröße."
  )
)
}
