maengel_verjaehrungsgrundfrist <- function(regelbereich = NULL, fristgruppe = NULL,
    fristbeginnereignis_am = NULL, arglistig_verschwiegen = NULL,
    regelmaessiger_weg_letzter_tag = NULL, abweichende_sonderregel = NULL, einordnungsnachweis = NULL) {
  .auswahl(regelbereich, "regelbereich", c("kauf", "werk"))
  .auswahl(fristgruppe, "fristgruppe", c("dingliches_drittrecht", "bauwerk", "sonstige_sache", "sonstiges_werk"))
  if ((regelbereich == "kauf" && fristgruppe == "sonstiges_werk") || (regelbereich == "werk" && fristgruppe == "dingliches_drittrecht"))
    .fehler("fristgruppe", "Fristgruppe passt nicht zum gew\u00e4hlten Regelbereich.")
  .wahrheitswert(arglistig_verschwiegen, "arglistig_verschwiegen")
  .wahrheitswert(abweichende_sonderregel, "abweichende_sonderregel")
  .text(einordnungsnachweis, "einordnungsnachweis")
  regelmaessig <- fristgruppe == "sonstiges_werk" || (arglistig_verschwiegen && fristgruppe != "dingliches_drittrecht")
  beginn <- NULL
  if (!is.null(fristbeginnereignis_am) || !regelmaessig || fristgruppe == "bauwerk")
    beginn <- .datum(fristbeginnereignis_am, "fristbeginnereignis_am")
  regelende <- NULL
  if (!is.null(regelmaessiger_weg_letzter_tag) || regelmaessig)
    regelende <- .datum(regelmaessiger_weg_letzter_tag, "regelmaessiger_weg_letzter_tag")
  eingaben <- list(regelbereich = regelbereich, fristgruppe = fristgruppe,
    fristbeginnereignis_am = fristbeginnereignis_am, arglistig_verschwiegen = arglistig_verschwiegen,
    regelmaessiger_weg_letzter_tag = regelmaessiger_weg_letzter_tag,
    abweichende_sonderregel = abweichende_sonderregel, einordnungsnachweis = einordnungsnachweis)
  wert <- NULL
  if (!abweichende_sonderregel) {
    if (regelmaessig) {
      ende <- regelende
      weg <- "regelmaessige_verjaehrung"
      if (fristgruppe == "bauwerk") {
        ende <- max(ende, .frist(.iso(beginn), 5, "jahre", "ereignis"))
        weg <- "regelmaessige_verjaehrung_mindestens_fuenf_jahre"
      }
    } else {
      jahre <- switch(fristgruppe, dingliches_drittrecht = 30, bauwerk = 5, sonstige_sache = 2)
      ende <- .frist(.iso(beginn), jahre, "jahre", "ereignis")
      weg <- switch(as.character(jahre), "30" = "dreissig_jahre", "5" = "fuenf_jahre", "2" = "zwei_jahre")
    }
    wert <- list(verjaehrungsweg = weg, rechnerischer_letzter_tag = .iso(ende))
  }
  ergebnis <- .ergebnis(wert, "fristdaten", "BGB_MAENGEL_VERJAEHRUNGSGRUNDFRIST", eingaben,
    list(list(operation = "Gesetzlichen M\u00e4ngelverj\u00e4hrungsweg w\u00e4hlen; Arglist verdr\u00e4ngt Zweijahresweg, Bauwerksweg bleibt Mindestfrist und dinglicher Drei\u00dfigjahresweg bleibt unber\u00fchrt")), eingaben)
  ergebnis$status <- if (!is.null(wert)) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Konkreter Anspruch nach\u00a7437 Nummer1/3 oder\u00a7634 Nummer1/2/4, Fristgruppe und gesetzliches Beginnereignis rechtlich eingeordnet; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("Kauf: Grundst\u00fccks\u00fcbergabe, sonst Ablieferung; Werk: Abnahme f\u00fcr Zwei-/F\u00fcnfjahresweg. Regelm\u00e4\u00dfigen Weg einschlie\u00dflich zutreffender Entstehung/Kenntnis und einschl\u00e4giger H\u00f6chstgrenzen vorab gesondert bestimmen. Grundfristen ohne Hemmung, Ablaufhemmung, Neubeginn oder abschlie\u00dfende Kalenderkorrektur vergleichen; solche Ver\u00e4nderungen danach in rechtlich zutreffender Reihenfolge pr\u00fcfen. Arglist l\u00e4sst Drei\u00dfigjahresweg\u00a7438 Absatz1 Nummer1 unber\u00fchrt. Keine automatische Verj\u00e4hrung des R\u00fccktritts oder der Minderung: hierf\u00fcr\u00a7218 undAbs\u00e4tze4/5 beachten. Verbrauchsg\u00fcter-, Digital-, Vertrags- und sonstige Sonderregeln separat, insbesondere\u00a7475e.")
  ergebnis
}
