vereins_liquidationsueberschuss <- function(verfuegbares_liquidationsvermoegen = NULL,
    noch_zu_befriedigende_verbindlichkeiten = NULL, bestandsnachweis = NULL) {
  vermoegen <- .geld(verfuegbares_liquidationsvermoegen)
  schulden <- .geld(noch_zu_befriedigende_verbindlichkeiten)
  .text(bestandsnachweis, "bestandsnachweis")
  eingaben <- list(verfuegbares_liquidationsvermoegen = verfuegbares_liquidationsvermoegen,
    noch_zu_befriedigende_verbindlichkeiten = noch_zu_befriedigende_verbindlichkeiten,
    bestandsnachweis = bestandsnachweis)
  differenz <- .subtrahieren(vermoegen, schulden)
  ergebnis <- .geld_ergebnis(.bruch(0), "BGB_VEREINS_LIQUIDATIONSUEBERSCHUSS", eingaben,
    list(list(operation = "Abgegrenztes verf\u00fcgbares Verm\u00f6gen und noch zu befriedigende Verbindlichkeiten gegen\u00fcberstellen")))
  ueberschuss <- if (differenz$zaehler > 0) differenz else .bruch(0)
  fehlbetrag <- if (differenz$zaehler < 0) .bruch(-differenz$zaehler, differenz$nenner) else .bruch(0)
  ergebnis$wert <- list(ueberschuss = .bruchteile(ueberschuss), fehlbetrag = .bruchteile(fehlbetrag))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Rechnerischer Bestand nach vorgesehenem Gl\u00e4ubigerausgleich, keine Ausantwortungsfreigabe. Sperrjahr, Hinterlegung/Sicherung, tats\u00e4chliche Gl\u00e4ubigerbefriedigung und Insolvenzpflichten gesondert."))
  ergebnis
}

vereins_liquidationssperrjahr <- function(erste_einrueckung = NULL,
    bekanntmachung_ordnungsgemaess = NULL, bekanntmachungsnachweis = NULL) {
  einrueckung <- .datum(erste_einrueckung, "erste_einrueckung")
  .wahrheitswert(bekanntmachung_ordnungsgemaess, "bekanntmachung_ordnungsgemaess")
  .text(bekanntmachungsnachweis, "bekanntmachungsnachweis")
  eingaben <- list(erste_einrueckung = erste_einrueckung,
    bekanntmachung_ordnungsgemaess = bekanntmachung_ordnungsgemaess,
    bekanntmachungsnachweis = bekanntmachungsnachweis)
  wert <- NULL
  if (bekanntmachung_ordnungsgemaess) {
    bewirkt <- .tage_addieren(einrueckung, 2)
    ende <- .frist(.iso(bewirkt), 1, "jahre", "ereignis")
    wert <- list(bekanntmachung_bewirkt_mit_tagesablauf = .iso(bewirkt),
      sperrjahr_ende = .iso(ende), fruehester_tag_nach_sperrjahr = .iso(.tage_addieren(ende, 1)))
  }
  ergebnis <- .ergebnis(wert, "kalenderdaten", "BGB_VEREINS_LIQUIDATIONSSPERRJAHR", eingaben,
    list(list(operation = "Wirkung mit Ablauf des zweiten Tages nach erster Einr\u00fcckung; ein Jahr Sperrfrist und ersten Tag danach bestimmen")), eingaben)
  ergebnis$status <- if (bekanntmachung_ordnungsgemaess) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Ordnungsgem\u00e4\u00dfe Bekanntmachung nach\u00a750 einschlie\u00dflich Gl\u00e4ubigeraufforderung und ma\u00dfgeblichem Ver\u00f6ffentlichungsblatt vorgegeben.")
  ergebnis$hinweise <- list("Nur Kalendergrenze des\u00a751, keine endg\u00fcltige Verteilungsfreigabe. Gl\u00e4ubigerbefriedigung, besondere Mitteilungen, Hinterlegung und Sicherheit nach\u00a7\u00a750/52/53 bleiben gesondert.",
    "Keine automatische Wochenend-/Feiertagsverschiebung einer Sperrfrist. Wirkung der Bekanntmachung tritt erst mit Tagesablauf ein.")
  ergebnis
}

vereinsvermoegen_mitgliederanteil <- function(verteilbarer_ueberschuss = NULL,
    mitglieder_bei_aufloesung = NULL, anfallberechtigte_anderweitig_bestimmt = NULL,
    ausschliessliche_mitgliederinteressen = NULL, verteilungsnachweis = NULL) {
  vermoegen <- .geld(verteilbarer_ueberschuss)
  anzahl <- .ganzzahl(mitglieder_bei_aufloesung, "mitglieder_bei_aufloesung", 1, 9007199254740991)
  .wahrheitswert(anfallberechtigte_anderweitig_bestimmt, "anfallberechtigte_anderweitig_bestimmt")
  .wahrheitswert(ausschliessliche_mitgliederinteressen, "ausschliessliche_mitgliederinteressen")
  .text(verteilungsnachweis, "verteilungsnachweis")
  eingaben <- list(verteilbarer_ueberschuss = verteilbarer_ueberschuss,
    mitglieder_bei_aufloesung = mitglieder_bei_aufloesung,
    anfallberechtigte_anderweitig_bestimmt = anfallberechtigte_anderweitig_bestimmt,
    ausschliessliche_mitgliederinteressen = ausschliessliche_mitgliederinteressen,
    verteilungsnachweis = verteilungsnachweis)
  wert <- NULL
  if (!anfallberechtigte_anderweitig_bestimmt && ausschliessliche_mitgliederinteressen)
    wert <- .dividieren(vermoegen, .bruch(anzahl))
  ergebnis <- .geld_ergebnis(wert, "BGB_VEREINSVERMOEGEN_MITGLIEDERANTEIL", eingaben,
    list(list(operation = "Gesetzlichen Auffangfall pr\u00fcfen und verteilbaren \u00dcberschuss gleichm\u00e4\u00dfig auf ma\u00dfgebliche Mitglieder aufteilen")))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Nur Gleichverteilung\u00a745 Absatz3. Bei anderer Bestimmung oder fehlenden ausschlie\u00dflichen Mitgliederinteressen NICHT_ANWENDBAR; insbesondere kein automatischer Mitgliederanteil beim Fiskalanfall. Ausantwortungsreife und Anfallberechtigte vorab kl\u00e4ren."))
  ergebnis
}
