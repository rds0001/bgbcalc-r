stiftung_vermoegenszusammensetzung <- function(gewidmetes_vermoegen=NULL,davon_sonstig_gewidmet=NULL,zustiftungen=NULL,umgewidmeter_grundstock=NULL,weiteres_sonstiges_vermoegen=NULL,zuordnungsnachweis=NULL) {
  widmung <- .geld(gewidmetes_vermoegen);sonstig <- .geld(davon_sonstig_gewidmet);zustiftung <- .geld(zustiftungen);umwidmung <- .geld(umgewidmeter_grundstock);weiteres <- .geld(weiteres_sonstiges_vermoegen)
  if (.vergleichen(sonstig,widmung)>0) .fehler('davon_sonstig_gewidmet','Sonstig gewidmeter Teil darf gesamte Widmung nicht \u00fcbersteigen.')
  .text(zuordnungsnachweis,'zuordnungsnachweis')
  grundstock <- .addieren(.addieren(.subtrahieren(widmung,sonstig),zustiftung),umwidmung)
  sonstiges <- .addieren(sonstig,weiteres)
  eingaben <- list(gewidmetes_vermoegen=gewidmetes_vermoegen,davon_sonstig_gewidmet=davon_sonstig_gewidmet,zustiftungen=zustiftungen,umgewidmeter_grundstock=umgewidmeter_grundstock,weiteres_sonstiges_vermoegen=weiteres_sonstiges_vermoegen,zuordnungsnachweis=zuordnungsnachweis)
  wert <- list(grundstockvermoegen=.bruchteile(grundstock),sonstiges_vermoegen=.bruchteile(sonstiges),stiftungsvermoegen=.bruchteile(.addieren(grundstock,sonstiges)))
  ergebnis <- .ergebnis(wert,'EUR','BGB_STIFTUNG_VERMOEGENSZUSAMMENSETZUNG',eingaben,list(list(operation='Sonstige Widmung abziehen, Zustiftungen und Umwidmungen zum Grundstock addieren, getrenntes sonstiges Verm\u00f6gen und Gesamtbestand berechnen.')),eingaben)
  ergebnis$hinweise <- list('Stiftung auf unbestimmte Zeit; keine Verbrauchsstiftung. S\u00e4mtliche Betr\u00e4ge sind rechtlich bewertete, am selben Stichtag noch vorhandene zugeordnete Best\u00e4nde, keine unbereinigten historischen Zufl\u00fcsse. Zustiftungen und Umwidmungen sind nicht bereits in gewidmetes_vermoegen enthalten. weiteres_sonstiges_vermoegen enth\u00e4lt weder den separat genannten sonstig gewidmeten Teil noch zum Grundstock umgewidmete Werte. Verbrauch/Abg\u00e4nge/Wertver\u00e4nderungen vorab richtig zuordnen; keine Verm\u00f6gensbewertung, Erhaltungsfreigabe oder Bilanzierungsautomatik.')
  ergebnis
}
stiftung_wiederaufstockungsrest <- function(verbrauchter_grundstock=NULL,bereits_wiederaufgestockt=NULL,zuordnungsnachweis=NULL) {
  verbrauch <- .geld(verbrauchter_grundstock);auffuellung <- .geld(bereits_wiederaufgestockt)
  .text(zuordnungsnachweis,'zuordnungsnachweis')
  eingaben <- list(verbrauchter_grundstock=verbrauchter_grundstock,bereits_wiederaufgestockt=bereits_wiederaufgestockt,zuordnungsnachweis=zuordnungsnachweis)
  rest <- .subtrahieren(verbrauch,auffuellung)
  if (rest$zaehler<0) rest <- .bruch(0)
  ergebnis <- .geld_ergebnis(rest,'BGB_STIFTUNG_WIEDERAUFSTOCKUNGSREST',eingaben,list(list(operation='Demselben zul\u00e4ssigen Grundstockverbrauch zugeordnete Wiederaufstockungen abziehen, mindestens null.')))
  ergebnis$hinweise <- c(ergebnis$hinweise,list('Nur betragsm\u00e4\u00dfiger Rest des rechtlich qualifizierten Verbrauchs nach\u00a783cAbsatz2. Gleicher Verbrauchsvorgang und einheitliche Bewertungsbasis; keine mehrfach angerechnete Auff\u00fcllung. Zul\u00e4ssigkeit des Verbrauchs, absehbare Zeit und Grundstockerhaltung werden nicht festgestellt; \u00dcberschuss begr\u00fcndet keinen automatischen Entnahmeanspruch.'))
  ergebnis
}
