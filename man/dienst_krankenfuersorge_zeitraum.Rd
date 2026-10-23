% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{dienst_krankenfuersorge_zeitraum}
\alias{dienst_krankenfuersorge_zeitraum}
\title{dienst krankenfuersorge zeitraum}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{dienst_krankenfuersorge_zeitraum(
  erkrankungsbeginn_am = NULL,
  beginnart = NULL,
  dienstverhaeltnis_ende_am = NULL,
  dauerndes_hauptdienstverhaeltnis = NULL,
  in_haeusliche_gemeinschaft_aufgenommen = NULL,
  erkrankung_vorsaetzlich_oder_grob_fahrlaessig = NULL,
  versicherung_oder_oeffentliche_krankenpflege = NULL,
  krankheitskuendigung_626_durch_dienstberechtigten = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{erkrankungsbeginn_am}{ISO-Datum0001..9999 des rechtlich maßgeblichen Beginns der konkreten Erkrankung während des Dienstverhältnisses. Keine ungeprüfte Zusammenfassung verschiedener Krankheitsfälle.}
\item{beginnart}{Auswahl tagesbeginn bei mitzuzählendem ersten Krankheitstag ab Tagesbeginn oder ereignis bei rechtlich einschlägigem Ereignisbeginn. Untertägige Tatsachen vorab rechtlich einordnen.}
\item{dienstverhaeltnis_ende_am}{ISO-Datum0001..9999 des rechtlich letzten Diensttags einschließlich, mindestens Erkrankungsbeginn. NULL/None bedeutet im betrachteten Zeitraum fortbestehendes Dienstverhältnis ohne früheren feststehenden Endtag; kein unbekanntes Ende fiktiv ersetzen.}
\item{dauerndes_hauptdienstverhaeltnis}{Wahrheitswert: dauerndes Dienstverhältnis, das Erwerbstätigkeit des Verpflichteten vollständig oder hauptsächlich in Anspruch nimmt. Dauernd/hauptsächlich rechtlich beurteilen, keine erfundene feste Wochenstundengrenze.}
\item{in_haeusliche_gemeinschaft_aufgenommen}{Wahrheitswert der Aufnahme in die häusliche Gemeinschaft des Dienstberechtigten. Bloßer Arbeitsort im Haushalt ist nicht ungeprüft ausreichend.}
\item{erkrankung_vorsaetzlich_oder_grob_fahrlaessig}{Wahrheitswert der vorsätzlichen oder grob fahrlässigen Herbeiführung der konkreten Erkrankung durch Dienstverpflichteten; einfache Fahrlässigkeit nicht gleichsetzen.}
\item{versicherung_oder_oeffentliche_krankenpflege}{Wahrheitswert, dass für gerade erforderliche Verpflegung und ärztliche Behandlung durch Versicherung oder öffentliche Krankenpflege Vorsorge getroffen ist. Nicht jede beliebige Versicherung genügt; dann tritt diese Verpflichtung nicht ein.}
\item{krankheitskuendigung_626_durch_dienstberechtigten}{Wahrheitswert, dass das angegebene Dienstende gerade durch Kündigung des Dienstberechtigten nach§626 wegen der Erkrankung herbeigeführt wurde. Nur dann Dienstende für Fürsorgegrenze außer Betracht lassen.}
\item{einordnungsnachweis}{Nichtleere Begründung von Dienst-/Wohnverhältnissen, Erkrankung/Beginnart, Verschulden, anderweitiger Vorsorge und gegebenenfalls genauer Kündigungsursache.}
}
\details{Qualifizierter Dienst-/Haushaltsfall ohne schweren Eigenverursachungs- oder Vorsorgeausschluss: Sechswochengrenze. Früheres Dienstende begrenzt, außer gerade krankheitsbedingter§626-Kündigung durch Dienstberechtigten. Nur Höchstdauer erforderlicher Fürsorge; Genesung/Erforderlichkeitswegfall kann früher enden. Keine allgemeine Entgeltfortzahlung. Taggenaues Modell, keine automatische§193-Verlängerung. ISO-Daten und berechnete Grenzen0001..9999, explizite Auswahl/Wahrheitswerte und nichtleerer Nachweis.}
\value{wert enthält sechswochengrenze und fuersorge_spaetestens_bis als ISO-Daten. Ohne gesetzlichen Tatbestand NICHT_ANWENDBAR/null. Einheit: fristdaten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_617_T0001, BGB_617_T0004, BGB_617_T0005}
\examples{
dienst_krankenfuersorge_zeitraum(
  erkrankungsbeginn_am = "2024-02-29",
  beginnart = "tagesbeginn",
  dienstverhaeltnis_ende_am = "2024-03-15",
  dauerndes_hauptdienstverhaeltnis = TRUE,
  in_haeusliche_gemeinschaft_aufgenommen = TRUE,
  erkrankung_vorsaetzlich_oder_grob_fahrlaessig = FALSE,
  versicherung_oder_oeffentliche_krankenpflege = FALSE,
  krankheitskuendigung_626_durch_dienstberechtigten = FALSE,
  einordnungsnachweis = paste0(
    "Synthetisch qualifizierter häuslicher Dienstfall mit belegte",
    "r Erkrankung und rechtlichen Ausschluss-/Kündigungstatbestän",
    "den."
  )
)
}
