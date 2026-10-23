schenkungsversprechen_deckungsverteilung <- function(verfuegbare_mittel=NULL,geschuetzter_mittelbedarf=NULL,schenkungsansprueche=NULL,einordnungsnachweis=NULL) {
 mittel <- .geld(verfuegbare_mittel); bedarf <- .geld(geschuetzter_mittelbedarf)
 .text(einordnungsnachweis,'einordnungsnachweis'); .vorhanden(schenkungsansprueche,'schenkungsansprueche')
 if(!is.list(schenkungsansprueche) || !is.null(names(schenkungsansprueche)) || length(schenkungsansprueche)>1000) .fehler('schenkungsansprueche','Liste mit h\u00f6chstens1000 Anspr\u00fcchen erforderlich.')
 geprueft <- list(); kennungen <- character(); raenge <- numeric()
 for(anspruch in schenkungsansprueche) {
  if(!is.list(anspruch) || !identical(sort(names(anspruch)),sort(c('anspruch_id','entstehungsrang','anspruchsbetrag')))) .fehler('schenkungsansprueche','Je Anspruch sind Kennung, eindeutiger Entstehungsrang und Anspruchsbetrag erforderlich.')
  kennung <- .text(anspruch$anspruch_id,'anspruch_id'); rang <- .ganzzahl(anspruch$entstehungsrang,'entstehungsrang',1,1000000)
  if(kennung %in% kennungen || rang %in% raenge) .fehler('schenkungsansprueche','Anspruchskennungen und rechtlich bestimmte Entstehungsr\u00e4nge m\u00fcssen eindeutig sein.')
  kennungen <- c(kennungen,kennung); raenge <- c(raenge,rang)
  geprueft[[length(geprueft)+1]] <- list(rang=rang,kennung=kennung,betrag=.geld(anspruch$anspruchsbetrag))
 }
 deckung <- .subtrahieren(mittel,bedarf); if(.vergleichen(deckung,.bruch(0))<0) deckung <- .bruch(0)
 rest <- deckung; verteilung <- list()
 for(i in order(raenge)) {
  anspruch <- geprueft[[i]]; zahlung <- if(.vergleichen(rest,anspruch$betrag)<0) rest else anspruch$betrag
  rest <- .subtrahieren(rest,zahlung)
  verteilung[[length(verteilung)+1]] <- list(anspruch_id=anspruch$kennung,deckungsbetrag=.bruchteile(zahlung),verweigerbarer_fehlbetrag=.bruchteile(.subtrahieren(anspruch$betrag,zahlung)))
 }
 wert <- list(verfuegbare_deckung=.bruchteile(deckung),verteilung=verteilung,gesamtdeckungsbetrag=.bruchteile(.subtrahieren(deckung,rest)),unverbrauchte_deckung=.bruchteile(rest))
 eingaben <- list(verfuegbare_mittel=verfuegbare_mittel,geschuetzter_mittelbedarf=geschuetzter_mittelbedarf,schenkungsansprueche=schenkungsansprueche,einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,'EUR','BGB_SCHENKUNGSVERSPRECHEN_DECKUNGSVERTEILUNG',eingaben,list(list(operation='Verf\u00fcgbare Mittel minus qualifizierter Schutzbedarf, mindestens null; in aufsteigender Entstehungsrangfolge bis zur jeweiligen Anspruchsh\u00f6he verteilen.')),eingaben)
 ergebnis$hinweise <- list("Nur \u00a7519 f\u00fcr zusammentreffende qualifizierte noch nicht erf\u00fcllte Geldanspr\u00fcche aus Schenkungsversprechen. Gesch\u00fctzter Mittelbedarf umfasst ohne Doppelz\u00e4hlung sonstige Verpflichtungen, angemessenen Eigenunterhalt und gesetzliche Unterhaltspflichten; alle Werte gleiche rechtlich bestimmte Bewertungsbasis. H\u00f6herer Rang bedeutet sp\u00e4ter entstandener Anspruch, fr\u00fchere Anspr\u00fcche gehen vor. Keine automatische Bestimmung von Bed\u00fcrftigkeit, Verm\u00f6gensverwertbarkeit, Leistungszeit oder gesetzlichem Unterhalt. Gleichzeitige Anspruchsentstehung und Sachleistungsbewertung nicht erfasst. Fehlbetrag bezeichnet den bei qualifiziertem \u00a7519-Tatbestand verweigerbaren Teil, keine automatische Erl\u00f6schung der Forderung. Bereits erf\u00fcllte Schenkungen fallen gegebenenfalls unter \u00a7528/529, dort umgekehrte Rangfolge.")
 ergebnis
}
