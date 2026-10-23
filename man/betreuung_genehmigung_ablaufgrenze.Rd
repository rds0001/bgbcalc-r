% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{betreuung_genehmigung_ablaufgrenze}
\alias{betreuung_genehmigung_ablaufgrenze}
\title{betreuung genehmigung ablaufgrenze}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{betreuung_genehmigung_ablaufgrenze(
  rechnerisches_fristende_ohne_genehmigungsverfahren = NULL,
  genehmigungsverfahren_beginn_am = NULL,
  genehmigung_rechtskraft_am = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{rechnerisches_fristende_ohne_genehmigungsverfahren}{Bereits nach sonstigen einschlägigen Regeln bestimmter letzter Tag der gesetzlichen FristYYYY-MM-DD, ohne die hier betrachtete1858III-Ablaufhemmung.}
\item{genehmigungsverfahren_beginn_am}{Erster rechtlich wirksamer Tag des schützenden GenehmigungsverfahrensYYYY-MM-DD, spätestens am sonstigen letzten Fristtag. Nicht beliebige Kenntnis oder erst nach Fristablauf gestellter Antrag.}
\item{genehmigung_rechtskraft_am}{Feststehender Tag der Rechtskraft des Beschlusses über die Erteilung der nachträglichen GenehmigungYYYY-MM-DD; kein lediglich erwarteter Tag und keine Versagung.}
\item{einordnungsnachweis}{Nichtleerer Nachweis von1858III, rechtzeitigem Schutzbeginn, gesetzlicher Frist und rechtskräftig erteilter nachträglicher Genehmigung.}
}
\details{Rechtzeitig begonnenes Genehmigungsverfahren prüfen; bisherigen letzten Fristtag frühestens auf die Rechtskraft der Erteilung verschieben, ohne Verfahrenstage zu addieren. §1858III: qualifiziertes einseitiges Rechtsgeschäft gegenüber Gericht oder Behörde, für das eine nachträgliche betreuungsgerichtliche Genehmigung rechtskräftig erteilt wird. Gesetzlicher Fristablauf während des wirksamen Genehmigungsverfahrens gehemmt; keine Addition sämtlicher Verfahrenstage nach209 und keine neue volle Frist ab Rechtskraft. Verfahrensbeginn und Rechtskraft der Erteilung bereits rechtlich bestimmt. Rechtskraft einer Versagung, nichtgesetzliche Fristen und andere Genehmigungslagen sind nicht Gegenstand dieses Bausteins. Ein bereits vor Verfahrensbeginn außerhalb des Schutzes eingetretener Fristablauf wird nicht wiederbelebt. Bei laufendem Verfahren ohne Rechtskraft kein fiktiver Endtag. Ereignisse auf rechtlich maßgebliche Kalendertage normalisieren; weitere Fristkorrekturen gesondert. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert.rechnerisches_fristende alsYYYY-MM-DD, im ausdrücklich qualifizierten Erteilungsfall. Einheit: datum.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1858_T0003, BGB_1858_T0004, BGB_1858_T0005, BGB_1858_T0006, BGB_1858_T0007}
\examples{
betreuung_genehmigung_ablaufgrenze(
  rechnerisches_fristende_ohne_genehmigungsverfahren = "2024-02-29",
  genehmigungsverfahren_beginn_am = "2024-02-15",
  genehmigung_rechtskraft_am = "2024-04-10",
  einordnungsnachweis = paste0(
    "§1858III: qualifiziertes einseitiges Rechtsgeschäft gegenübe",
    "r Gericht oder Behörde, für das eine nachträgliche betreuung",
    "sgerichtliche Genehmigung rechtskräftig erteilt wird. Gesetz",
    "licher Fristablauf während des wirksamen Genehmigungsverfahr",
    "ens gehemmt; keine Addition sämtlicher Verfahrenstage nach20",
    "9 und keine neue volle Frist ab Rechtskraft. Verfahrensbegin",
    "n und Rechtskraft der Erteilung bereits rechtlich bestimmt. ",
    "Rechtskraft einer Versagung, nichtgesetzliche Fristen und an",
    "dere Genehmigungslagen sind nicht Gegenstand dieses Baustein",
    "s. Ein bereits vor Verfahrensbeginn außerhalb des Schutzes e",
    "ingetretener Fristablauf wird nicht wiederbelebt. Bei laufen",
    "dem Verfahren ohne Rechtskraft kein fiktiver Endtag. Ereigni",
    "sse auf rechtlich maßgebliche Kalendertage normalisieren; we",
    "itere Fristkorrekturen gesondert."
  )
)
}
