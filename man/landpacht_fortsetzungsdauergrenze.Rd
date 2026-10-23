% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{landpacht_fortsetzungsdauergrenze}
\alias{landpacht_fortsetzungsdauergrenze}
\title{landpacht fortsetzungsdauergrenze}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{landpacht_fortsetzungsdauergrenze(
  pachtbeginn_am = NULL,
  vereinbartes_pachtende_am = NULL,
  pachtart = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{pachtbeginn_am}{Vertraglicher Beginn des laufenden PachtverhältnissesYYYY-MM-DD zum Tagesbeginn; nicht Beginn nur der zuletzt verlangten Verlängerung.}
\item{vereinbartes_pachtende_am}{Vertraglich vereinbartes EndeYYYY-MM-DD einschließlich Endtag, nicht vor Beginn.}
\item{pachtart}{Genau betrieb_oder_kultiviertes_moor_oedland (auch Zupachtung, durch die ein Betrieb entsteht) oder anderes_grundstueck; rechtlich qualifiziert.}
\item{einordnungsnachweis}{Nichtleerer Nachweis von Pachtart, ursprünglichem Beginn des laufenden Pachtverhältnisses und vertraglicher Dauer. Weitere Fortsetzungsvoraussetzungen595 und gerichtliche Abwägung gesondert.}
}
\details{Zwölf- beziehungsweise Achtzehnjahresgrenze ab Beginn des laufenden Pachtverhältnisses berechnen und vereinbarte Dauer damit vergleichen. §595III3/VI:18Jahre für Betriebspacht, betriebsbildende Zupachtung oder vom Pächter kultiviertes Moor-/Ödland, sonst12Jahre. Vereinbarte Dauer mindestens dieser Länge ist eine numerische Ausschlussgrenze nachIII3; keine alleinige Entscheidung über alle Fortsetzungsgründe. Gerichtliche Fortsetzung nachVI höchstens bis zum ausgegebenen Termin, gerechnet ab Beginn des laufenden Pachtverhältnisses, nicht je Verlängerung neu. Weitere Ausschlussgründe, angemessene kürzere Dauer, Teilflächen und Bedingungen extern qualifizieren. Ende einschließlich Endtag; keine193Verschiebung. Kalenderbereich0001..9999 und ausdrücklich qualifizierte Dauer; keine automatische Feiertagsverschiebung.}
\value{wert: dauergrenze_jahre12oder18, gerichtlicher_hoechstterminYYYY-MM-DD, vereinbarte_dauer_erreicht_grenze als Wahrheitswert. Einheit: daten_und_zahlen.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_595_T0001, BGB_595_T0002, BGB_595_T0003, BGB_595_T0004, BGB_595_T0005, BGB_595_T0006, BGB_595_T0007, BGB_595_T0008, BGB_595_T0009, BGB_595_T0010, BGB_595_T0011, BGB_595_T0012, BGB_595_T0013, BGB_595_T0014, BGB_595_T0015, BGB_595_T0016, BGB_595_T0017, BGB_595_T0018, BGB_595_T0019, BGB_595_T0020, BGB_595_T0021, BGB_595_T0022}
\examples{
landpacht_fortsetzungsdauergrenze(
  pachtbeginn_am = "2024-01-01",
  vereinbartes_pachtende_am = "2035-12-30",
  pachtart = "anderes_grundstueck",
  einordnungsnachweis = paste0(
    "§595III3/VI:18Jahre für Betriebspacht, betriebsbildende Zupa",
    "chtung oder vom Pächter kultiviertes Moor-/Ödland, sonst12Ja",
    "hre. Vereinbarte Dauer mindestens dieser Länge ist eine nume",
    "rische Ausschlussgrenze nachIII3; keine alleinige Entscheidu",
    "ng über alle Fortsetzungsgründe. Gerichtliche Fortsetzung na",
    "chVI höchstens bis zum ausgegebenen Termin, gerechnet ab Beg",
    "inn des laufenden Pachtverhältnisses, nicht je Verlängerung ",
    "neu. Weitere Ausschlussgründe, angemessene kürzere Dauer, Te",
    "ilflächen und Bedingungen extern qualifizieren. Ende einschl",
    "ießlich Endtag; keine193Verschiebung."
  )
)
}
