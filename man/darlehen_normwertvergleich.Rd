% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{darlehen_normwertvergleich}
\alias{darlehen_normwertvergleich}
\title{darlehen normwertvergleich}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{darlehen_normwertvergleich(
  vergleichsfall = NULL,
  zu_pruefender_wert = NULL,
  massgeblicher_vergleichswert = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{vergleichsfall}{arbeitgeber_effektivzins_491: strikt unter Markt-Effektivzins; oeffentlich_sollzins_491: höchstens Markt-Sollzins; umschuldung_effektivzins_655c: höchstens bisheriger Effektivzins ohne Vermittlungskosten; rueckzahlungsvereinbarung_gesamtbetrag_495: Gesamtbetrag strikt unter bisheriger Restschuld.}
\item{zu_pruefender_wert}{Vertragszinssatz als Jahresquote (0.05=5Prozent), bei655c neuer Effektivzins, bei495 neuer Gesamtbetrag inEUR.}
\item{massgeblicher_vergleichswert}{Passender Marktzinssatz, bisheriger Effektivzins ohne Vermittlungskosten oder bisherige Restschuld. Gleiche Bezugsart und Einheit erforderlich.}
\item{einordnungsnachweis}{Vergleichbarkeit, gesetzliche Bezugsgrößen und weitere rechtliche Voraussetzungen belegen. Externe Effektivzins-/Gesamtbetragsermittlung dokumentieren.}
}
\details{Qualifizierte Zins- oder Betragswerte exakt vergleichen; strikte und einschließlich geltende gesetzliche Grenzen unterscheiden. Nur numerische Teilvoraussetzung nach§491II Nr4/5,§495II Nr1 oder§655c. Effektivzinsberechnung nach externem PAngV/EGBGB-Recht nicht neu erfinden; geprüfte Werte eingeben.655c: Vergleichszins des abzulösenden Darlehens ohne Vermittlungskosten, weitere Voraussetzungen Auszahlung/Widerruf/umschuldungsbezogene Vergütung separat.495: Gesamtbetrag nicht bloß neuer Nettodarlehensbetrag; Verfahrensvermeidung und Kündigungsberechtigung gesondert.491: Arbeitgeber-/Personenkreis-/Gemeinwohlbedingungen und weitere günstigere Vertragsbedingungen rechtlich qualifizieren. Zinssätze dürfen negativ sein; EUR-Gesamtbetrag und Restschuld nicht. Keine automatische Entscheidung über Verbraucherschutz oder Vergütungsanspruch. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{Exakte Differenz Prüfwert minus Vergleichswert, Vergleichsrichtung und numerische_bedingung_erfuellt; keine automatische Rechtsfolge. Einheit: differenz_und_wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_491_T0001, BGB_491_T0002, BGB_491_T0003, BGB_491_T0004, BGB_491_T0005, BGB_491_T0006, BGB_491_T0007, BGB_491_T0008, BGB_491_T0009, BGB_491_T0010, BGB_491_T0011, BGB_491_T0012, BGB_491_T0013, BGB_491_T0014, BGB_491_T0015, BGB_491_T0016, BGB_491_T0017, BGB_491_T0018, BGB_495_T0001, BGB_495_T0002, BGB_495_T0003, BGB_495_T0004, BGB_495_T0005, BGB_495_T0006, BGB_495_T0007, BGB_495_T0008, BGB_495_T0009, BGB_495_T0010, BGB_655c_T0001, BGB_655c_T0002}
\examples{
darlehen_normwertvergleich(
  vergleichsfall = "arbeitgeber_effektivzins_491",
  zu_pruefender_wert = "0.04",
  massgeblicher_vergleichswert = "0.05",
  einordnungsnachweis = paste0(
    "Nur numerische Teilvoraussetzung nach§491II Nr4/5,§495II Nr1",
    " oder§655c. Effektivzinsberechnung nach externem PAngV/EGBGB",
    "-Recht nicht neu erfinden; geprüfte Werte eingeben.655c: Ver",
    "gleichszins des abzulösenden Darlehens ohne Vermittlungskost",
    "en, weitere Voraussetzungen Auszahlung/Widerruf/umschuldungs",
    "bezogene Vergütung separat.495: Gesamtbetrag nicht bloß neue",
    "r Nettodarlehensbetrag; Verfahrensvermeidung und Kündigungsb",
    "erechtigung gesondert.491: Arbeitgeber-/Personenkreis-/Gemei",
    "nwohlbedingungen und weitere günstigere Vertragsbedingungen ",
    "rechtlich qualifizieren. Zinssätze dürfen negativ sein; EUR-",
    "Gesamtbetrag und Restschuld nicht. Keine automatische Entsch",
    "eidung über Verbraucherschutz oder Vergütungsanspruch."
  )
)
}
