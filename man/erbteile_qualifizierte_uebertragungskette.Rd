% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{erbteile_qualifizierte_uebertragungskette}
\alias{erbteile_qualifizierte_uebertragungskette}
\title{erbteile qualifizierte uebertragungskette}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{erbteile_qualifizierte_uebertragungskette(
  erben_ids = NULL,
  ursprungsanteile = NULL,
  uebertragungsschritte = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{erben_ids}{1..1000 eindeutige Kennungen aller in der Kette vorkommenden Erben/Ersatzerben.}
\item{ursprungsanteile}{1..1000 Objekte ursprung_id, erbe_id, erbquote; unterschiedliche belastete Sonderteile mit unterschiedlichen Urspruengen, Gesamtquote hoechstens1.}
\item{uebertragungsschritte}{0..1000 chronologisch rechtlich qualifizierte Schritte: abgebender_erbe_id, ursprung_ids, uebertragungsquote (positiv bis1), empfaenger mit erbe_id und positivem verteilungsgewicht.}
\item{einordnungsnachweis}{2094/2098Empfaengerkreise je Stufe, Gruppenvorrang auch bei verschachtelten Gruppen, Ersatzvorrang/Teilsperren und normgerechte relative Gewichte belegen. Keine bereits ausgerechneten Endquoten erforderlich.}
}
\details{Qualifizierte Anteilstransfers chronologisch exakt verteilen, Restanteile fortschreiben und Sonderteile nach Urspruengen erhalten. §§2094/2095/2098/2099: rein rechnerische Fortfuehrung rechtlich bestimmter einzelner Uebertragungsschritte. Je ausgewahltem Ursprungsanteil aktuelle Quote des Abgebenden mit Uebertragungsquote multiplizieren, danach nach qualifizierten relativen Gewichten auf Empfaenger verteilen; Rest beim Abgebenden belassen. Jede spaetere Stufe verwendet den fortgeschriebenen Bestand, jeder angewachsene Sonderteil behaelt seinen Ursprung2095. Verschachtelte Gruppenvorraenge, individuelle Sperren und Ersatzerben bestimmen den rechtlich vorgegebenen Empfaengerkreis je Stufe; sie sind keine automatisch aus Namen erschlossene Familientopologie. Relative Gewichte muessen zum jeweiligen Normfall passen, insbesondere nicht blind aktuelle durch vorherige Anwachsung vergroesserte Gesamtquoten als urspruengliche Einsetzungsgewichte verwenden. Vorhandene2094/2098Grundfunktionen koennen passende Empfaenger-/Quotenbelege liefern. Nicht zu uebertragende oder rechtlich ungeklärte Teile bleiben getrennt; keine automatische Zuteilung an gesetzliche Erben. Gesamtquoten nur Summen, keine Aufhebung von Vermächtnis-/Auflagen-/Ausgleichungslasten am Ursprung. Keine Aussage, dass ein konkreter Wegfallgrund oder eine konkrete Testamentseinsetzung wirksam ist. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{Positive Sonderteile je Ursprung/Erbe, Gesamtquoten aller Erben einschliesslich null und unveraenderte erfasste Gesamtquote. Einheit: erbquoten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2094_T0001, BGB_2094_T0002, BGB_2094_T0003, BGB_2094_T0004, BGB_2095_T0001, BGB_2098_T0001, BGB_2098_T0002, BGB_2099_T0001}
\examples{
erbteile_qualifizierte_uebertragungskette(
  erben_ids = list(
    "A",
    "B",
    "C"
  ),
  ursprungsanteile = list(
    list(
    "ursprung_id" = "UA",
    "erbe_id" = "A",
    "erbquote" = "0.25"
  ),
    list(
    "ursprung_id" = "UB",
    "erbe_id" = "B",
    "erbquote" = "0.25"
  ),
    list(
    "ursprung_id" = "UC",
    "erbe_id" = "C",
    "erbquote" = "0.5"
  )
  ),
  uebertragungsschritte = list(
    list(
    "abgebender_erbe_id" = "A",
    "ursprung_ids" = list(
    "UA"
  ),
    "uebertragungsquote" = "1",
    "empfaenger" = list(
    list(
    "erbe_id" = "B",
    "verteilungsgewicht" = "1"
  )
  )
  ),
    list(
    "abgebender_erbe_id" = "B",
    "ursprung_ids" = list(
    "UA",
    "UB"
  ),
    "uebertragungsquote" = "1",
    "empfaenger" = list(
    list(
    "erbe_id" = "C",
    "verteilungsgewicht" = "1"
  )
  )
  )
  ),
  einordnungsnachweis = paste0(
    "§§2094/2095/2098/2099: rein rechnerische Fortfuehrung rechtl",
    "ich bestimmter einzelner Uebertragungsschritte. Je ausgewahl",
    "tem Ursprungsanteil aktuelle Quote des Abgebenden mit Uebert",
    "ragungsquote multiplizieren, danach nach qualifizierten rela",
    "tiven Gewichten auf Empfaenger verteilen; Rest beim Abgebend",
    "en belassen. Jede spaetere Stufe verwendet den fortgeschrieb",
    "enen Bestand, jeder angewachsene Sonderteil behaelt seinen U",
    "rsprung2095. Verschachtelte Gruppenvorraenge, individuelle S",
    "perren und Ersatzerben bestimmen den rechtlich vorgegebenen ",
    "Empfaengerkreis je Stufe; sie sind keine automatisch aus Nam",
    "en erschlossene Familientopologie. Relative Gewichte muessen",
    " zum jeweiligen Normfall passen, insbesondere nicht blind ak",
    "tuelle durch vorherige Anwachsung vergroesserte Gesamtquoten",
    " als urspruengliche Einsetzungsgewichte verwenden. Vorhanden",
    "e2094/2098Grundfunktionen koennen passende Empfaenger-/Quote",
    "nbelege liefern. Nicht zu uebertragende oder rechtlich ungek",
    "lärte Teile bleiben getrennt; keine automatische Zuteilung a",
    "n gesetzliche Erben. Gesamtquoten nur Summen, keine Aufhebun",
    "g von Vermächtnis-/Auflagen-/Ausgleichungslasten am Ursprung",
    ". Keine Aussage, dass ein konkreter Wegfallgrund oder eine k",
    "onkrete Testamentseinsetzung wirksam ist."
  )
)
}
