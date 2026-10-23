.vereins_ergebnis <- function(wert, regel_id, eingaben, operation, hinweis) {
  ergebnis <- .ergebnis(wert, "stimmen_und_wahrheitswerte", regel_id, eingaben,
    list(list(operation = operation)), eingaben)
  ergebnis$status <- if (is.null(wert)) "NICHT_ANWENDBAR" else "BERECHNET"
  ergebnis$annahmen <- list("Rechtlich ma\u00dfgebliche Mitglieder-/Stimmenzahlen und Satzungslage ausdr\u00fccklich vorgegeben; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list(hinweis, "Rechnerische Mehrheit best\u00e4tigt nicht allein die Wirksamkeit eines Beschlusses oder einer Vertretung. Abweichende Satzung f\u00fchrt aus dem gesetzlichen Standardmodell heraus.")
  ergebnis
}

vorstand_vertretungsmehrheit <- function(vorstandsmitglieder = NULL,
    mitwirkende_vorstandsmitglieder = NULL, rechtsform = NULL, abweichende_satzungsregel = NULL,
    bestandsnachweis = NULL) {
  anzahl <- .ganzzahl(vorstandsmitglieder, "vorstandsmitglieder", 1, 9007199254740991)
  mitwirkend <- .ganzzahl(mitwirkende_vorstandsmitglieder, "mitwirkende_vorstandsmitglieder", 0, anzahl)
  .auswahl(rechtsform, "rechtsform", c("verein", "stiftung"))
  .wahrheitswert(abweichende_satzungsregel, "abweichende_satzungsregel")
  .text(bestandsnachweis, "bestandsnachweis")
  eingaben <- list(vorstandsmitglieder = vorstandsmitglieder,
    mitwirkende_vorstandsmitglieder = mitwirkende_vorstandsmitglieder, rechtsform = rechtsform,
    abweichende_satzungsregel = abweichende_satzungsregel, bestandsnachweis = bestandsnachweis)
  wert <- NULL
  if (!abweichende_satzungsregel) {
    minimum <- anzahl %/% 2 + 1
    wert <- list(mindestens_mitwirkende = minimum, vertretungsmehrheit_erreicht = mitwirkend >= minimum)
  }
  .vereins_ergebnis(wert, "BGB_VORSTAND_VERTRETUNGSMEHRHEIT", eingaben,
    "Strikte Mehrheit aller rechtlich ma\u00dfgeblichen Vorstandsmitglieder bestimmen",
    "Aktive Vertretung, keine Beschlussmehrheit und keine Regel f\u00fcr Zugang einer Erkl\u00e4rung gegen\u00fcber dem Vorstand. Satzungsabweichungen nach\u00a740 bzw.\u00a784 Absatz3 gesondert.")
}

vereinsbeschluss_stimmenmehrheit <- function(beschlussart = NULL,
    massgebliche_abgegebene_stimmen = NULL, ja_stimmen = NULL, abweichende_satzungsregel = NULL,
    stimmen_nachweis = NULL) {
  .auswahl(beschlussart, "beschlussart", c("ordentlich", "satzungsaenderung", "aufloesung"))
  stimmen <- .ganzzahl(massgebliche_abgegebene_stimmen, "massgebliche_abgegebene_stimmen", 0, 9007199254740991)
  ja <- .ganzzahl(ja_stimmen, "ja_stimmen", 0, stimmen)
  .wahrheitswert(abweichende_satzungsregel, "abweichende_satzungsregel")
  .text(stimmen_nachweis, "stimmen_nachweis")
  eingaben <- list(beschlussart = beschlussart, massgebliche_abgegebene_stimmen = massgebliche_abgegebene_stimmen,
    ja_stimmen = ja_stimmen, abweichende_satzungsregel = abweichende_satzungsregel, stimmen_nachweis = stimmen_nachweis)
  wert <- NULL
  if (!abweichende_satzungsregel) {
    minimum <- if (beschlussart == "ordentlich") stimmen %/% 2 + 1 else max(1, stimmen - stimmen %/% 4)
    wert <- list(mindestens_ja_stimmen = minimum, stimmenmehrheit_erreicht = ja >= minimum)
  }
  .vereins_ergebnis(wert, "BGB_VEREINSBESCHLUSS_STIMMENMEHRHEIT", eingaben,
    "Einfache Mehrheit oder mindestens drei Viertel der ma\u00dfgeblichen abgegebenen Stimmen berechnen",
    "Zweck\u00e4nderung und Umlaufbeschluss erfordern gesonderte Zustimmungspr\u00fcfung. Bezugsmenge muss g\u00fcltige Stimmen und zwingende Stimmrechtsausschl\u00fcsse\u00a734 bereits korrekt ber\u00fccksichtigen; kein Beschluss allein aus leerer Stimmenmenge.")
}

vereinsbeschluss_zustimmung_aller <- function(beschlussart = NULL, mitgliederzahl = NULL,
    zustimmende_mitglieder = NULL, erforderliche_textform_gewahrt = NULL,
    abweichende_satzungsregel = NULL, zustimmungsnachweis = NULL) {
  .auswahl(beschlussart, "beschlussart", c("ohne_versammlung", "zweckaenderung"))
  anzahl <- .ganzzahl(mitgliederzahl, "mitgliederzahl", 1, 9007199254740991)
  zustimmungen <- .ganzzahl(zustimmende_mitglieder, "zustimmende_mitglieder", 0, anzahl)
  .wahrheitswert(erforderliche_textform_gewahrt, "erforderliche_textform_gewahrt")
  .wahrheitswert(abweichende_satzungsregel, "abweichende_satzungsregel")
  .text(zustimmungsnachweis, "zustimmungsnachweis")
  eingaben <- list(beschlussart = beschlussart, mitgliederzahl = mitgliederzahl,
    zustimmende_mitglieder = zustimmende_mitglieder, erforderliche_textform_gewahrt = erforderliche_textform_gewahrt,
    abweichende_satzungsregel = abweichende_satzungsregel, zustimmungsnachweis = zustimmungsnachweis)
  wert <- NULL
  if (!abweichende_satzungsregel) {
    alle <- zustimmungen == anzahl
    wert <- list(zustimmung_aller_erreicht = alle,
      zustimmungs_und_textformvoraussetzungen_erfuellt = alle && erforderliche_textform_gewahrt)
  }
  .vereins_ergebnis(wert, "BGB_VEREINSBESCHLUSS_ZUSTIMMUNG_ALLER", eingaben,
    "Zustimmende Mitglieder mit vollst\u00e4ndiger Bezugsmenge vergleichen und erforderliche Textform pr\u00fcfen",
    "Ohne Versammlung Textform s\u00e4mtlicher Zustimmungen; bei Zweck\u00e4nderung Textform der nicht erschienenen Mitglieder. Keine blo\u00dfe Einstimmigkeit nur der Anwesenden. Weitere Beschlussvoraussetzungen gesondert.")
}
