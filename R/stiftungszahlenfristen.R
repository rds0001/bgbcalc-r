stiftung_uebergang_bekanntmachungsfristen <- function(wirkungen_am = NULL, veroeffentlichung_am = NULL, einordnungsnachweis = NULL) {
  wirkung <- .datum(wirkungen_am, "wirkungen_am")
  veroeffentlichung <- .datum(veroeffentlichung_am, "veroeffentlichung_am")
  .text(einordnungsnachweis, "einordnungsnachweis")
  if (veroeffentlichung < wirkung) .fehler("veroeffentlichung_am", "Dieses Modell verlangt Ver\u00f6ffentlichung ab Eintritt der Wirkungen nach\u00a786f.")
  bekanntmachungsfrist <- .frist(wirkungen_am, 1, "monate", "ereignis")
  bewirkt <- .tage_addieren(veroeffentlichung, 2)
  anmeldung <- .frist(.iso(bewirkt), 6, "monate", "ereignis")
  eingaben <- list(wirkungen_am = wirkungen_am, veroeffentlichung_am = veroeffentlichung_am, einordnungsnachweis = einordnungsnachweis)
  ergebnis <- .ergebnis(list(rechnerisches_bekanntmachungsfristende = .iso(bekanntmachungsfrist),
    bekanntmachung_bewirkt_mit_ablauf = .iso(bewirkt), rechnerisches_anmeldefristende = .iso(anmeldung)),
    "daten_und_wahrheitswerte", "BGB_STIFTUNG_UEBERGANG_BEKANNTMACHUNGSFRISTEN", eingaben,
    list(list(operation = "Wirkungsereignis plus ein Monat; tats\u00e4chliche Ver\u00f6ffentlichung plus zwei Tage; bewirkte Bekanntmachung plus sechs Monate")), eingaben)
  ergebnis$annahmen <- list("Rechtlich wirksame Zulegung/Zusammenlegung und ordnungsgem\u00e4\u00dfe Bundesanzeigerver\u00f6ffentlichung vorgegeben; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("Grundfristen\u00a7\u00a786g/86h, keine umfassende Sicherungsberechtigung. Wirkungsereignis nach\u00a786f ist Unanfechtbarkeit der ma\u00dfgeblichen Genehmigung/Entscheidung, nicht blo\u00dfe Vertragsunterzeichnung. Bekanntmachungswirkung mit Ablauf des zweiten Tages; Gl\u00e4ubigeranmeldefrist ab dieser Wirkung, nicht unmittelbar ab Ver\u00f6ffentlichung. Auch versp\u00e4tete Ver\u00f6ffentlichung erzeugt eigene tats\u00e4chliche Bekanntmachungswirkung, kein R\u00fcckdatieren auf Bekanntmachungsfristende. Fristwahrung/\u00a7193 oder sonstige einschl\u00e4gige Korrekturen separat pr\u00fcfen. Anspruch vor Wirkungsereignis entstanden, noch nicht f\u00e4llig, schriftliche Anmeldung nach Grund/H\u00f6he und glaubhaft gemachte Gef\u00e4hrdung sind rechtliche Voraussetzungen, keine automatischen Geldbetr\u00e4ge. Fr\u00fchere Ver\u00f6ffentlichungen vor Wirkungsereignis au\u00dferhalb dieses Modells.")
  ergebnis
}
stiftung_zusammenlegung_mindestzahl <- function(anzahl_uebertragender_stiftungen = NULL) {
  anzahl <- .ganzzahl(anzahl_uebertragender_stiftungen, "anzahl_uebertragender_stiftungen", 0, .zahlengrenze)
  eingaben <- list(anzahl_uebertragender_stiftungen = anzahl_uebertragender_stiftungen)
  ergebnis <- .ergebnis(list(mindestzahl = 2L, mindestzahl_erreicht = anzahl >= 2),
    "anzahl_und_wahrheitswert", "BGB_STIFTUNG_ZUSAMMENLEGUNG_MINDESTZAHL", eingaben,
    list(list(operation = "Zahl \u00fcbertragender Stiftungen mit Mindestzahl zwei vergleichen")), eingaben)
  ergebnis$annahmen <- list("Gez\u00e4hlt werden ausschlie\u00dflich rechtlich bestimmte \u00fcbertragende Stiftungen; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("Neue \u00fcbernehmende Stiftung nicht als weitere \u00fcbertragende Stiftung mitz\u00e4hlen. Nur Zahlenvoraussetzung\u00a786a, keine Genehmigungs- oder Zul\u00e4ssigkeitsentscheidung und keine Pr\u00fcfung der Nummern1bis3. Zulegung auf bestehende Stiftung ist anderer Fall.")
  ergebnis
}
