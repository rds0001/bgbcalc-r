% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{staffelmiete_flexible_betragsfolge}
\alias{staffelmiete_flexible_betragsfolge}
\title{staffelmiete flexible betragsfolge}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{staffelmiete_flexible_betragsfolge(
  staffeln = NULL,
  schutzmodell = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{staffeln}{Geordnete Liste2..1000: staffelbeginn_am, vereinbarte_monatsmiete, zulaessige_monatsmiete_ohne_vorstaffelschutz. Auch sinkende Vereinbarungsbeträge zulässig.}
\item{schutzmodell}{Zwingend rechtlich begründete Fortgeltung: hoechste_wirksame_vorstaffel oder unmittelbar_vorherige_staffel. Keine automatische Wirkung einer Neuvereinbarung.}
\item{einordnungsnachweis}{Gültige557a-Folge und Schutzmodell bei Absenkung/Neuvereinbarung rechtlich qualifizieren; individuelle556d–g-Grenzen auf jeweilige erste Fälligkeit beziehen.}
}
\details{Vereinbarte Staffelbeträge mit aktueller Grenze und rechtlich gewähltem historischen Schutz vergleichen, ohne niedrigere Vereinbarung anzuheben. Jede vereinbarte Staffel wird nur nach oben durch ihre individuelle556d–g-Grenze samt qualifiziertem Vorstaffelschutz begrenzt. Geschützte frühere Miete darf eine niedriger vereinbarte Miete nicht erhöhen. Modell höchste_wirksame_Vorstaffel hält den höchsten tatsächlich zulässigen früheren Betrag; Modell unmittelbar_vorherige_Staffel schreibt nur den zuletzt wirksam begründeten Betrag fort. Rechtliche Fortgeltung bei sinkenden/neu vereinbarten Beträgen ist ausdrücklich vorzugeben, keine allgemeine Entscheidung dieser Auslegungsfrage. In keiner Variante anfänglich unzulässige Überhöhung schützen. Eine rechtlich eigenständige neue Folge gesondert rechnen und etwaiges556e-Vormietprivileg mit vorhandenem Vormietkern bestimmen; nicht ungeprüft historischen Höchstwert übertragen. Mindestjahresabstände mit vorhandenem Kalenderkern.556g-Auskunft/Privilegnutzbarkeit und Rüge gesondert; keine automatische10\%-Grenze ohne556e-Ausnahmen. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{Je Staffel Monatsgrenze, gedeckelter Vereinbarungsbetrag und Überhöhung. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_556d_T0001, BGB_556d_T0002, BGB_556d_T0003, BGB_556d_T0004, BGB_556d_T0005, BGB_556d_T0006, BGB_556d_T0007, BGB_556d_T0008, BGB_556d_T0009, BGB_556d_T0010, BGB_556d_T0011, BGB_556d_T0012, BGB_556e_T0001, BGB_556e_T0002, BGB_556e_T0003, BGB_556e_T0004, BGB_556g_T0001, BGB_556g_T0002, BGB_556g_T0003, BGB_556g_T0004, BGB_556g_T0005, BGB_556g_T0006, BGB_556g_T0007, BGB_556g_T0008, BGB_556g_T0009, BGB_556g_T0010, BGB_556g_T0011, BGB_556g_T0012, BGB_556g_T0013, BGB_556g_T0014, BGB_556g_T0015, BGB_556g_T0016, BGB_556g_T0017, BGB_556g_T0018, BGB_557a_T0001, BGB_557a_T0002, BGB_557a_T0003, BGB_557a_T0004, BGB_557a_T0005, BGB_557a_T0006, BGB_557a_T0007, BGB_557a_T0008, BGB_557a_T0009}
\examples{
staffelmiete_flexible_betragsfolge(
  staffeln = list(
    list(
    "staffelbeginn_am" = "2024-01-01",
    "vereinbarte_monatsmiete" = "1000",
    "zulaessige_monatsmiete_ohne_vorstaffelschutz" = "900"
  ),
    list(
    "staffelbeginn_am" = "2025-01-01",
    "vereinbarte_monatsmiete" = "850",
    "zulaessige_monatsmiete_ohne_vorstaffelschutz" = "800"
  ),
    list(
    "staffelbeginn_am" = "2026-01-01",
    "vereinbarte_monatsmiete" = "950",
    "zulaessige_monatsmiete_ohne_vorstaffelschutz" = "800"
  )
  ),
  schutzmodell = "hoechste_wirksame_vorstaffel",
  einordnungsnachweis = paste0(
    "Jede vereinbarte Staffel wird nur nach oben durch ihre indiv",
    "iduelle556d–g-Grenze samt qualifiziertem Vorstaffelschutz be",
    "grenzt. Geschützte frühere Miete darf eine niedriger vereinb",
    "arte Miete nicht erhöhen. Modell höchste_wirksame_Vorstaffel",
    " hält den höchsten tatsächlich zulässigen früheren Betrag; M",
    "odell unmittelbar_vorherige_Staffel schreibt nur den zuletzt",
    " wirksam begründeten Betrag fort. Rechtliche Fortgeltung bei",
    " sinkenden/neu vereinbarten Beträgen ist ausdrücklich vorzug",
    "eben, keine allgemeine Entscheidung dieser Auslegungsfrage. ",
    "In keiner Variante anfänglich unzulässige Überhöhung schütze",
    "n. Eine rechtlich eigenständige neue Folge gesondert rechnen",
    " und etwaiges556e-Vormietprivileg mit vorhandenem Vormietker",
    "n bestimmen; nicht ungeprüft historischen Höchstwert übertra",
    "gen. Mindestjahresabstände mit vorhandenem Kalenderkern.556g",
    "-Auskunft/Privilegnutzbarkeit und Rüge gesondert; keine auto",
    "matische10\%-Grenze ohne556e-Ausnahmen."
  )
)
}
