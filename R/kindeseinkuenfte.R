kindeseinkuenfte_verwendungsbetraege <- function(vermoegenseinkuenfte=NULL, verwaltungsbedarf=NULL, kindesunterhalt=NULL, erwerbseinkuenfte=NULL, billiger_familienbedarf=NULL, bewertungsnachweis=NULL) {
  vermoegen <- .geld(vermoegenseinkuenfte); verwaltung <- .geld(verwaltungsbedarf)
  kind <- .geld(kindesunterhalt); erwerb <- .geld(erwerbseinkuenfte); familie <- .geld(billiger_familienbedarf)
  .text(bewertungsnachweis, "bewertungsnachweis")
  minimum <- function(a,b) if (.vergleichen(a,b) <= 0) a else b
  verfuegbar <- .subtrahieren(vermoegen, verwaltung)
  if (.vergleichen(verfuegbar,.bruch(0)) < 0) verfuegbar <- .bruch(0)
  verm_kind <- minimum(verfuegbar,kind); rest_kind <- .subtrahieren(kind,verm_kind)
  erw_kind <- minimum(erwerb,rest_kind); ueberschuss <- .subtrahieren(verfuegbar,verm_kind)
  familienbetrag <- minimum(ueberschuss,familie)
  eingaben <- list(vermoegenseinkuenfte=vermoegenseinkuenfte,verwaltungsbedarf=verwaltungsbedarf,kindesunterhalt=kindesunterhalt,erwerbseinkuenfte=erwerbseinkuenfte,billiger_familienbedarf=billiger_familienbedarf,bewertungsnachweis=bewertungsnachweis)
  wert <- lapply(list(verfuegbare_vermoegenseinkuenfte=verfuegbar,vermoegenseinkuenfte_fuer_kind=verm_kind,erwerbseinkuenfte_fuer_kind_einsetzbar=erw_kind,ungedeckter_kindesbedarf=.subtrahieren(rest_kind,erw_kind),vermoegenseinkuenfte_fuer_familie_einsetzbar=familienbetrag,verbleibende_vermoegenseinkuenfte=.subtrahieren(ueberschuss,familienbetrag),verbleibende_erwerbseinkuenfte=.subtrahieren(erwerb,erw_kind)),.bruchteile)
  ergebnis <- .ergebnis(wert,"EUR","BGB_KINDESEINKUENFTE_VERWENDUNGSBETRAEGE",eingaben,list(list(operation="Verwaltungsbedarf vor Kindesunterhalt aus Verm\u00f6genseink\u00fcnften; Erwerb nur bis verbleibendem Kindesbedarf, Familie nur aus \u00fcbersch\u00fcssigen Verm\u00f6genseink\u00fcnften.")),eingaben)
  ergebnis$hinweise <- list("Alle Eink\u00fcnfte und Bedarfe beziehen sich auf denselben qualifizierten Zeitraum. Erwerbseink\u00fcnfte nur aus Arbeit oder nach\u00a7112 gestattetem Gesch\u00e4ft. Verwaltungsbedarf nicht automatisch auf Erwerbseink\u00fcnfte verlagern. Erwerbseinsatz und Familienverwendung sind zul\u00e4ssige rechnerische H\u00f6chstbetr\u00e4ge, keine Anordnung einer tats\u00e4chlichen Verwendung. Billiger Familienbedarf ist bereits rechtlich qualifiziert f\u00fcr Eltern und minderj\u00e4hrige Geschwister; Billigkeit und Verteilung zwischen Personen werden nicht erfunden. Kindesunterhalt und Kosten sind bewertete Eingaben; verbleibende Betr\u00e4ge unterstellen vollst\u00e4ndigen Einsatz bis zum berechneten zul\u00e4ssigen Betrag. Verm\u00f6gensstamm ist keine Einkunft.")
  ergebnis
}
