% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{stiftung_uebertragene_vermoegensbestaende}
\alias{stiftung_uebertragene_vermoegensbestaende}
\title{stiftung uebertragene vermoegensbestaende}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{stiftung_uebertragene_vermoegensbestaende(
  grundstock_uebernehmende_stiftung = NULL,
  sonstiges_vermoegen_uebernehmende_stiftung = NULL,
  uebertragende_stiftungen = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{grundstock_uebernehmende_stiftung}{Qualifizierter Grundstockwert der übernehmenden Stiftung unmittelbar vor wirksamer Übertragung in Euro; bei neuer Stiftung ohne Anfangsbestand0.}
\item{sonstiges_vermoegen_uebernehmende_stiftung}{Qualifizierter sonstiger Vermögenswert der übernehmenden Stiftung vor Übertragung in Euro.}
\item{uebertragende_stiftungen}{Liste1..1000 mit genau stiftung_id, grundstockvermoegen, sonstiges_vermoegen; eindeutige Kennungen, nichtnegative Euro-Werte unter gemeinsamem Bewertungsmaßstab.}
\item{einordnungsnachweis}{Nichtleerer Nachweis wirksamer Zulegung/Zusammenlegung86c/86f, vollständiger überschneidungsfreier Bestände und gemeinsamer Bewertung; Mindestzahl einer Zusammenlegung rechtlich vorgeprüft.}
}
\details{Grundstock und sonstige Vermögensbestände wirksam übertragender Stiftungen getrennt zum Bestand der übernehmenden Stiftung addieren. §86cI2/II und86fI/II: vollständig übertragene qualifizierte Vermögensbestände addieren, Grundstock getrennt als Grundstock fortführen. Kein mehrfaches Einrechnen schon in der übernehmenden Stiftung erfasster Übertragungen. Nichtnegative qualifizierte Vermögenswerte, keine automatische Saldierung von Verbindlichkeiten oder konzerninternen Forderungen, keine rechtliche Übertragungswirksamkeit/Neugründung. Genehmigung, Unanfechtbarkeit und Zahl übertragender Stiftungen bei Zusammenlegung gesondert; keine künstliche Umwidmung sonstigen Vermögens in Grundstock. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert.grundstockvermoegen_nach_uebertragung, sonstiges_vermoegen_nach_uebertragung und gesamtvermoegen_nach_uebertragung als exakte Eurobrüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_86c_T0001, BGB_86c_T0002, BGB_86c_T0003, BGB_86c_T0004, BGB_86c_T0005, BGB_86f_T0001, BGB_86f_T0002}
\examples{
stiftung_uebertragene_vermoegensbestaende(
  grundstock_uebernehmende_stiftung = "1000",
  sonstiges_vermoegen_uebernehmende_stiftung = "100",
  uebertragende_stiftungen = list(
    list(
    "stiftung_id" = "A",
    "grundstockvermoegen" = "200",
    "sonstiges_vermoegen" = "20"
  ),
    list(
    "stiftung_id" = "B",
    "grundstockvermoegen" = "300",
    "sonstiges_vermoegen" = "30"
  )
  ),
  einordnungsnachweis = paste0(
    "§86cI2/II und86fI/II: vollständig übertragene qualifizierte ",
    "Vermögensbestände addieren, Grundstock getrennt als Grundsto",
    "ck fortführen. Kein mehrfaches Einrechnen schon in der übern",
    "ehmenden Stiftung erfasster Übertragungen. Nichtnegative qua",
    "lifizierte Vermögenswerte, keine automatische Saldierung von",
    " Verbindlichkeiten oder konzerninternen Forderungen, keine r",
    "echtliche Übertragungswirksamkeit/Neugründung. Genehmigung, ",
    "Unanfechtbarkeit und Zahl übertragender Stiftungen bei Zusam",
    "menlegung gesondert; keine künstliche Umwidmung sonstigen Ve",
    "rmögens in Grundstock."
  )
)
}
