.sachenrechtliche_grundfristen <- list(
  hypothekenmiete_faelligkeitsjahr_1123 = list(1, "jahre"),
  hypothek_wiederkehrende_leistung_1126 = list(3, "monate"),
  besitzschutz_864 = list(1, "jahre"),
  fundanzeige_973 = list(6, "monate"),
  geringwertiger_fund_973 = list(6, "monate"),
  fundbereicherung_977 = list(3, "jahre"),
  finderlohn_erloes_978 = list(3, "jahre"),
  fundversteigerung_anmeldefrist_981 = list(3, "jahre"),
  fundgeld_bekanntmachung_981 = list(3, "jahre"),
  niessbrauch_eigentuemerersatz_1057 = list(6, "monate"),
  niessbrauch_verwendungsersatz_1057 = list(6, "monate"),
  hypothekenversicherung_anzeige_1128 = list(1, "monate"),
  hypothekenversicherung_untunlich_1128 = list(1, "monate"),
  buchhypothek_widerspruch_1139 = list(1, "monate"),
  grundschuld_kuendigung_1193 = list(6, "monate"),
  rentenschuld_kuendigung_1202 = list(6, "monate"),
  pfand_verpfaenderersatz_1226 = list(6, "monate"),
  pfand_verwendungsersatz_1226 = list(6, "monate"),
  pfandverkauf_androhung_1234 = list(1, "monate"),
  pfandverkauf_untunlich_1234 = list(1, "monate"))
sachenrechtliche_grundfrist <- function(regelfall = NULL, fristbeginnereignis_am = NULL, einordnungsnachweis = NULL) {
  .auswahl(regelfall, "regelfall", names(.sachenrechtliche_grundfristen))
  .datum(fristbeginnereignis_am, "fristbeginnereignis_am")
  .text(einordnungsnachweis, "einordnungsnachweis")
  dauer <- .sachenrechtliche_grundfristen[[regelfall]]
  ende <- .frist(fristbeginnereignis_am, dauer[[1]], dauer[[2]], "ereignis")
  eingaben <- list(regelfall = regelfall, fristbeginnereignis_am = fristbeginnereignis_am, einordnungsnachweis = einordnungsnachweis)
  ergebnis <- .ergebnis(list(grundfristende = .iso(ende), anzahl = dauer[[1]], einheit = dauer[[2]]),
    "datum_und_fristlaenge", "BGB_SACHENRECHTLICHE_GRUNDFRIST", eingaben,
    list(list(operation = "Gesetzliche Dauer des ausgew\u00e4hlten Normfalls ab qualifiziertem Ereignis mit vorhandenem Kalenderkern berechnen")), eingaben)
  ergebnis$annahmen <- list("Unver\u00e4nderte gesetzliche Grundfrist, Anfangsereignis und Anwendungsfall vorqualifiziert; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("Kein abschlie\u00dfender Eigentums-, Erl\u00f6schens-, Verj\u00e4hrungs-, F\u00e4lligkeits- oder Verkaufsberechtigungsentscheid. Anfangsereignis muss zur Fallbeschreibung im Fachvertrag passen; gesetzlich verschiedene Ausl\u00f6ser nicht austauschen. Gerichtliche Wahrung, Hemmung, Neubeginn, fr\u00fcherer Gleichlauf nach548, zul\u00e4ssige Kalenderkorrekturen und abweichende Bestimmungen gesondert. Wartefristen enden erst mit Ablauf des angegebenen Tages; keine Freigabe schon zu dessen Beginn.")
  ergebnis
}
hypothek_folgequartalsgrenze <- function(bezugsereignis_am = NULL, faelligkeit_am = NULL, regelfall = NULL,
    anwendungsfall_qualifiziert = NULL, einordnungsnachweis = NULL) {
  bezug <- .datum(bezugsereignis_am, "bezugsereignis_am")
  faellig <- .datum(faelligkeit_am, "faelligkeit_am")
  .auswahl(regelfall, "regelfall", c("teilbefriedigung_1145", "uebertragungskenntnis_1158"))
  .wahrheitswert(anwendungsfall_qualifiziert, "anwendungsfall_qualifiziert")
  .text(einordnungsnachweis, "einordnungsnachweis")
  jahr <- as.integer(format(bezug, "%Y"))
  monat <- as.integer(format(bezug, "%m"))
  quartalsbeginn_monat <- 3*((monat-1)%/%3)+1
  grenze <- .frist(sprintf("%04d-%02d-01", jahr, quartalsbeginn_monat), 6, "monate", "tagesbeginn")
  spaeter <- faellig > grenze
  eingaben <- list(bezugsereignis_am = bezugsereignis_am, faelligkeit_am = faelligkeit_am, regelfall = regelfall,
    anwendungsfall_qualifiziert = anwendungsfall_qualifiziert, einordnungsnachweis = einordnungsnachweis)
  wert <- if (anwendungsfall_qualifiziert) list(folgequartalsende = .iso(grenze), faelligkeit_nach_folgequartal = spaeter,
    zeitmerkmal_erfuellt = if (regelfall == "teilbefriedigung_1145") spaeter else !spaeter) else NULL
  ergebnis <- .ergebnis(wert, "datum_und_wahrheitswerte", "BGB_HYPOTHEK_FOLGEQUARTALSGRENZE", eingaben,
    list(list(operation = "Beginn des Bezugsquartals plus6Monate nach Tagesbeginnregel ergibt Ende des Folgequartals;1145 verlangt sp\u00e4tere,1158 nicht sp\u00e4tere F\u00e4lligkeit")), eingaben)
  ergebnis$status <- if (anwendungsfall_qualifiziert) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Qualifizierte Zinsen/andere Nebenleistungen und ihr F\u00e4lligkeitsdatum; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("1145: Bezugsereignis ist teilweise Befriedigung durch Eigent\u00fcmer; Kosten nach1118 sind ausdr\u00fccklich nicht einbezogen.1158: Bezugsereignis ist ma\u00dfgebliche Kenntnis des Eigent\u00fcmers von Forderungs\u00fcbertragung. Kein Einwendungs-/Gutglaubens-/Briefherausgabeentscheid und keine Zinsbetragsberechnung. Am Folgequartalsendtag ist1158-Zeitmerkmal erf\u00fcllt,1145-Zeitmerkmal nicht.")
  ergebnis
}
