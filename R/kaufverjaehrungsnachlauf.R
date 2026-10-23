verbrauchsgueterkauf_verjaehrungsnachlauf <- function(nachlaufgrund = NULL,
    anknuepfung_am = NULL, bisheriger_letzter_tag = NULL, tatbestand_erfuellt = NULL,
    einordnungsnachweis = NULL) {
  .auswahl(nachlaufgrund, "nachlaufgrund", c("ende_digitaler_bereitstellung", "ende_aktualisierungspflicht",
    "erstmaliges_zeigen_des_mangels", "rueckgabe_nach_nacherfuellung_garantie"))
  anknuepfung <- .datum(anknuepfung_am, "anknuepfung_am")
  bisher <- .datum(bisheriger_letzter_tag, "bisheriger_letzter_tag")
  .wahrheitswert(tatbestand_erfuellt, "tatbestand_erfuellt")
  .text(einordnungsnachweis, "einordnungsnachweis")
  eingaben <- list(nachlaufgrund = nachlaufgrund, anknuepfung_am = anknuepfung_am,
    bisheriger_letzter_tag = bisheriger_letzter_tag, tatbestand_erfuellt = tatbestand_erfuellt,
    einordnungsnachweis = einordnungsnachweis)
  gilt <- tatbestand_erfuellt && (nachlaufgrund != "erstmaliges_zeigen_des_mangels" || anknuepfung <= bisher)
  wert <- NULL
  if (gilt) {
    monate <- switch(nachlaufgrund, ende_digitaler_bereitstellung = 12,
      ende_aktualisierungspflicht = 12, erstmaliges_zeigen_des_mangels = 4,
      rueckgabe_nach_nacherfuellung_garantie = 2)
    mindest <- .frist(anknuepfung_am, monate, "monate", "ereignis")
    wert <- list(nachlauf_monate = monate, mindestablauf = .iso(mindest),
      rechnerischer_letzter_tag = .iso(max(bisher, mindest)))
  }
  ergebnis <- .ergebnis(wert, "fristdaten", "BGB_VERBRAUCHSGUETERKAUF_VERJAEHRUNGSNACHLAUF", eingaben,
    list(list(operation = "Gesetzlichen Nachlauf vom jeweiligen Ankn\u00fcpfungsereignis berechnen und mit bisherigem letzten Tag maximieren")), eingaben)
  ergebnis$status <- if (gilt) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Konkreter Mangelanspruch und gesetzlicher Nachlauftatbestand rechtlich eingeordnet; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("Keine pauschale Addition zum bisherigen Fristende: Mindestnachlauf ab dem gesetzlich bezeichneten Ereignis. Beim erstmaligen Zeigen muss das Ereignis innerhalb der ma\u00dfgeblichen bisherigen Frist liegen; sp\u00e4tere weitere Erscheinungen nicht als erneutes Erstzeigen einsetzen. Bei R\u00fcckgabe muss die vorausgehende \u00dcbergabe zur Nacherf\u00fcllung/Garantie an Unternehmer oder auf dessen Veranlassung an Dritten rechtlich qualifiziert sein; kein automatisches Wiederaufleben verj\u00e4hrter Anspr\u00fcche. Digitale Bereitstellung und Aktualisierungspflicht haben unterschiedliche rechtliche Endzeitpunkte. Weitere Hemmungen, Neubeginne, konkurrierende Nachl\u00e4ufe und erforderliche Kalenderkorrekturen gesondert pr\u00fcfen.")
  ergebnis
}
verbrauchsgueterkauf_nachbesserungsverlaengerung <- function(urspruenglicher_letzter_tag = NULL,
    nachbesserung_nach_439_geleistet = NULL, regel_475e_absatz_fuenf_anwendbar = NULL,
    einordnungsnachweis = NULL) {
  ursprung <- .datum(urspruenglicher_letzter_tag, "urspruenglicher_letzter_tag")
  .wahrheitswert(nachbesserung_nach_439_geleistet, "nachbesserung_nach_439_geleistet")
  .wahrheitswert(regel_475e_absatz_fuenf_anwendbar, "regel_475e_absatz_fuenf_anwendbar")
  .text(einordnungsnachweis, "einordnungsnachweis")
  eingaben <- list(urspruenglicher_letzter_tag = urspruenglicher_letzter_tag,
    nachbesserung_nach_439_geleistet = nachbesserung_nach_439_geleistet,
    regel_475e_absatz_fuenf_anwendbar = regel_475e_absatz_fuenf_anwendbar,
    einordnungsnachweis = einordnungsnachweis)
  wert <- NULL
  if (regel_475e_absatz_fuenf_anwendbar) {
    ende <- if (nachbesserung_nach_439_geleistet) .frist(urspruenglicher_letzter_tag, 12, "monate", "ereignis") else ursprung
    wert <- list(verlaengerung_monate = if (nachbesserung_nach_439_geleistet) 12 else 0,
      rechnerischer_letzter_tag = .iso(ende))
  }
  ergebnis <- .ergebnis(wert, "fristdaten", "BGB_VERBRAUCHSGUETERKAUF_NACHBESSERUNGSVERLAENGERUNG", eingaben,
    list(list(operation = "Bei geleisteter Nachbesserung zw\u00f6lf Monate genau einmal an die unver\u00e4nderte urspr\u00fcngliche Frist anschlie\u00dfen")), eingaben)
  ergebnis$status <- if (regel_475e_absatz_fuenf_anwendbar) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Absatz5 aus der festen lokalen BGB-Fassung einschlie\u00dflich zeitlichem Anwendungsbereich gepr\u00fcft; unver\u00e4nderte urspr\u00fcngliche Frist vorgegeben.")
  ergebnis$hinweise <- list("Nur Nacherf\u00fcllung durch geleistete Nachbesserung gem\u00e4\u00df\u00a7439; blo\u00dfe Anforderung, Versuch ohne rechtlich geleistete Nachbesserung oder Ersatzlieferung nicht automatisch gleichsetzen. Immer dieselbe urspr\u00fcngliche Grundfrist eingeben, niemals das bereits verl\u00e4ngerte Ergebnis; weitere Nachbesserungen l\u00f6sen keine zus\u00e4tzlichen Zw\u00f6lfmonatsverl\u00e4ngerungen aus. Keine zw\u00f6lf Monate ab Reparaturdatum und kein neuer vollst\u00e4ndiger Fristlauf. Andere Hemmungen, Neubeginne und Nachl\u00e4ufe rechtlich gesondert kombinieren; kein automatisches Wiederaufleben verj\u00e4hrter Anspr\u00fcche. Bei alten F\u00e4llen die zeitliche Geltung der lokal vorliegenden Absatz5-Fassung ausdr\u00fccklich pr\u00fcfen.")
  ergebnis
}
