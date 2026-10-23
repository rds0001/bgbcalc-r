
bau_nachtragsverguetung_differenz <- function(erforderliche_mehrkosten=NULL, angemessene_zuschlaege_mehrkosten=NULL, entfallende_kosten=NULL, entfallende_zuschlaege=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(erforderliche_mehrkosten), .geld(angemessene_zuschlaege_mehrkosten), .geld(entfallende_kosten), .geld(entfallende_zuschlaege))
 .text(einordnungsnachweis,"einordnungsnachweis")
 eingaben <- list(erforderliche_mehrkosten=erforderliche_mehrkosten, angemessene_zuschlaege_mehrkosten=angemessene_zuschlaege_mehrkosten, entfallende_kosten=entfallende_kosten, entfallende_zuschlaege=entfallende_zuschlaege, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(.subtrahieren(.addieren(werte[[1]],werte[[2]]),.addieren(werte[[3]],werte[[4]])), "BGB_BAU_NACHTRAGSVERGUETUNG_DIFFERENZ", eingaben, list(list(operation="Tats\u00e4chlich erforderliche Mehrkosten und angemessene Zuschl\u00e4ge addieren; entfallende Kosten und zugeh\u00f6rige entfallende Zuschl\u00e4ge abziehen")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("Nur qualifizierte Anordnung nach \u00a7650b Absatz2 und Berechnung nach \u00a7650c Absatz1; positiver Wert bedeutet Mehrverg\u00fctung, negativer Wert Verg\u00fctungsminderung. Die vier nichtnegativen Kostenkomponenten m\u00fcssen in derselben Preisbasis ohne Doppelz\u00e4hlung vorliegen; Zuschl\u00e4ge f\u00fcr Gesch\u00e4ftskosten, Wagnis und Gewinn sind qualifizierte Geldbetr\u00e4ge, keine erfundenen Prozents\u00e4tze. Nach \u00a7650c Absatz1 Satz2 ausgeschlossener vermehrter Planungsaufwand darf nicht enthalten sein. Urkalkulationsmethode nach Absatz2, F\u00e4lligkeit und Abschlagsberechnung gesondert."))
 ergebnis
}

bau_nachtrag_vorlaeufiger_abschlagsansatz <- function(angebotene_mehrverguetung=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(angebotene_mehrverguetung))
 .text(einordnungsnachweis,"einordnungsnachweis")
 eingaben <- list(angebotene_mehrverguetung=angebotene_mehrverguetung, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(.multiplizieren(werte[[1]],.bruch(4,5)), "BGB_BAU_NACHTRAG_VORLAEUFIGER_ABSCHLAGSANSATZ", eingaben, list(list(operation="Qualifizierte angebotene Mehrverg\u00fctung mit vier F\u00fcnfteln multiplizieren")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("Nur gew\u00e4hlter zul\u00e4ssiger80%-Weg nach \u00a7650c Absatz3 Satz1; fehlende Einigung und gerichtliche Entscheidung rechtlich qualifizieren. Ergebnis ist der anzusetzende Nachtragsanteil, nicht automatisch eine f\u00e4llige Gesamtabschlagszahlung. Bereits gezahlte Abschl\u00e4ge und \u00a7632a-Einbehalt sowie \u00a7650m-Grenzen separat anwenden. Keine80%-K\u00fcrzung der endg\u00fcltigen geschuldeten Verg\u00fctung."))
 ergebnis
}

bau_nachtrag_ueberzahlungsbetrag <- function(gezahlte_vorlaeufige_nachtragsverguetung=NULL, geschuldete_mehrverguetung=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(gezahlte_vorlaeufige_nachtragsverguetung), .geld(geschuldete_mehrverguetung))
 .text(einordnungsnachweis,"einordnungsnachweis")
 eingaben <- list(gezahlte_vorlaeufige_nachtragsverguetung=gezahlte_vorlaeufige_nachtragsverguetung, geschuldete_mehrverguetung=geschuldete_mehrverguetung, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(if(.vergleichen(werte[[1]],werte[[2]])>0) .subtrahieren(werte[[1]],werte[[2]]) else .bruch(0), "BGB_BAU_NACHTRAG_UEBERZAHLUNGSBETRAG", eingaben, list(list(operation="Vorl\u00e4ufig gezahlte Nachtragsverg\u00fctung minus endg\u00fcltig geschuldete Mehrverg\u00fctung, mindestens null")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("Nur Zahlungen nach \u00a7650c Absatz3 Satz1 und rechtlich feststehende nichtnegative Mehrverg\u00fctung nach Absatz1/2. Mehrfachzahlungen nur einmal summieren; echte Verg\u00fctungsminderungsf\u00e4lle gesondert abrechnen. \u00dcberzahlungszinsen ab jeweiligem Zahlungseingang nach entsprechend \u00a7288 Absatz1 Satz2/Absatz2 ohne Zinseszins (\u00a7289 Satz1); vorhandene Zinskerne mit qualifizierter \u00dcberzahlungszuordnung und Datumsbasis separat verwenden, nicht pauschal gesamte Bruttozahlung verzinsen."))
 ergebnis
}
