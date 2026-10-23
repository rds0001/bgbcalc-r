dauervollstreckung_zeitgrenze <- function(erbfall_am = NULL, prueftag = NULL,
    fortdaueranordnung = NULL, fortdauerereignis_am = NULL,
    ereignisperson_juristische_person = NULL, verwaltungsanordnung_nach_2209 = NULL,
    einordnungsnachweis = NULL) {
  erbfall <- .datum(erbfall_am, "erbfall_am")
  tag <- .datum(prueftag, "prueftag")
  if (tag < erbfall) .fehler("prueftag", "Pr\u00fcftag darf nicht vor Erbfall liegen.")
  art <- .text(fortdaueranordnung, "fortdaueranordnung")
  if (!art %in% c("keine", "tod_erbe", "tod_testamentsvollstrecker", "ereignis_erbe", "ereignis_testamentsvollstrecker"))
    .fehler("fortdaueranordnung", "Keine Fortdauer oder qualifizierte Anordnung bis Tod/anderem Ereignis in Erben/Testamentsvollstrecker w\u00e4hlen.")
  grundende <- .frist(erbfall_am, 30, "jahre", "ereignis")
  ereignis <- NULL
  if (!is.null(fortdauerereignis_am)) {
    ereignis <- .datum(fortdauerereignis_am, "fortdauerereignis_am")
    if (ereignis < erbfall || ereignis > tag)
      .fehler("fortdauerereignis_am", "Tats\u00e4chliches Fortdauerereignis muss zwischen Erbfall und Pr\u00fcftag liegen; k\u00fcnftiges Ereignis als noch nicht eingetreten behandeln.")
    if (art == "keine") .fehler("fortdauerereignis_am", "Ohne Fortdaueranordnung kein zugeh\u00f6riges Fortdauerereignis eingeben.")
  }
  .wahrheitswert(ereignisperson_juristische_person, "ereignisperson_juristische_person")
  .wahrheitswert(verwaltungsanordnung_nach_2209, "verwaltungsanordnung_nach_2209")
  .text(einordnungsnachweis, "einordnungsnachweis")
  eingaben <- list(erbfall_am = erbfall_am, prueftag = prueftag, fortdaueranordnung = fortdaueranordnung,
    fortdauerereignis_am = fortdauerereignis_am, ereignisperson_juristische_person = ereignisperson_juristische_person,
    verwaltungsanordnung_nach_2209 = verwaltungsanordnung_nach_2209, einordnungsnachweis = einordnungsnachweis)
  fortdauer <- art != "keine" && !ereignisperson_juristische_person
  ende <- if (fortdauer) ereignis else grundende
  if (!fortdauer && !is.null(ereignis)) ende <- min(grundende, ereignis)
  wert <- NULL
  if (verwaltungsanordnung_nach_2209) wert <- list(dreissigjahresfristende = .iso(grundende), fortdauer_ueber_dreissig_jahre_zulaessig = fortdauer,
    massgebliche_zeitgrenze_am = if (!is.null(ende)) .iso(ende) else NULL,
    verwaltung_nach_zeitregel_beendet = !is.null(ende) && tag >= ende)
  ergebnis <- .ergebnis(wert, "daten_und_wahrheitswerte", "BGB_DAUERVOLLSTRECKUNG_ZEITGRENZE", eingaben,
    list(list(operation = "Drei\u00dfig Jahre ab Erbfall; qualifizierte Fortdauer bis Personenereignis ersetzt Grenze, bei juristischer Ereignisperson bleibt sp\u00e4testens Grundende ma\u00dfgeblich")), eingaben)
  ergebnis$status <- if (!is.null(wert)) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Qualifizierte Verwaltungsanordnung nach\u00a72209 und etwaige Fortdaueranordnung nach\u00a72210 Satz2 vorgegeben; Pr\u00fcfung zum Ende des Pr\u00fcftags.")
  ergebnis$hinweise <- list("Die Drei\u00dfigjahresfrist l\u00e4uft ab Erbfall, nicht erst ab Amtsantritt oder Beginn alleiniger Verwaltung nach Erledigung anderer Aufgaben. Fortdauer nur gem\u00e4\u00df testamentarischer Anordnung bis Tod/anderem Ereignis in Person des Erben oder Testamentsvollstreckers, nicht beliebiger Dritter. Der Wortlaut\u00a72210 Satz2 verlangt anders als\u00a72163 Absatz1 kein gesondertes Leben beim Erbfall; nur Absatz2 wird verwiesen. Welche konkrete Person/Amtsnachfolge eine Anordnung erfasst, ist rechtlich zu bestimmen, nicht durch beliebige Auswechslung oder Nachfolgerkette verl\u00e4ngerbar. Bei nat\u00fcrlicher Ereignisperson ohne bereits eingetretenes Ereignis ist Zeitgrenze NULL (ereignisabh\u00e4ngig, nicht unbeschr\u00e4nkte Gesamtwirksamkeit). Bei juristischer Ereignisperson bleibt sp\u00e4testes Ende drei\u00dfig Jahre; vorher eingetretenes wirksam angeordnetes Ereignis beendet fr\u00fcher. NULL als Ereigniseingabe bedeutet bis Pr\u00fcftag nicht eingetreten, nicht unbekannt. Pr\u00fcfung nur dieser Zeitregel, nicht sonstiger Beendigungsgr\u00fcnde, Amtsentlassung oder einzelner Vollstreckerbefugnisse. Tagesgenau zum Tagesende; Ereignis kann innerhalb des Tages fr\u00fcher wirken. Keine automatische Wochenendverschiebung.")
  ergebnis
}
