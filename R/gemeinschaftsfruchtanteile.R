gemeinschaft_fruchtanteil <- function(gesamtfruchtmenge=NULL,teilhaberanteil_zaehler=NULL,teilhaberanteil_nenner=NULL,fruchteinheit=NULL,zuordnungsnachweis=NULL) {
 menge <- .geld(gesamtfruchtmenge);z <- .ganzzahl(teilhaberanteil_zaehler,'teilhaberanteil_zaehler',0,9007199254740991);n <- .ganzzahl(teilhaberanteil_nenner,'teilhaberanteil_nenner',1,9007199254740991)
 if(z>n) .fehler('teilhaberanteil_zaehler','Teilhaberanteil darf eins nicht \u00fcbersteigen.')
 .text(fruchteinheit,'fruchteinheit');.text(zuordnungsnachweis,'zuordnungsnachweis')
 eingaben <- list(gesamtfruchtmenge=gesamtfruchtmenge,teilhaberanteil_zaehler=teilhaberanteil_zaehler,teilhaberanteil_nenner=teilhaberanteil_nenner,fruchteinheit=fruchteinheit,zuordnungsnachweis=zuordnungsnachweis)
 ergebnis <- .ergebnis(.bruchteile(.multiplizieren(menge,.bruch(z,n))),fruchteinheit,'BGB_GEMEINSCHAFT_FRUCHTANTEIL',eingaben,list(list(operation='Qualifizierte gesamte Fr\u00fcchte mit rechtlich bestimmtem Teilhaberanteil multiplizieren; urspr\u00fcngliche Einheit beibehalten.')),eingaben)
 ergebnis$hinweise <- list("\u00a7743I: Fr\u00fcchte einer Bruchteilsgemeinschaft entsprechend qualifiziertem Teilhaberanteil. Gesamte Fr\u00fcchte und Betrachtungszeitraum vorab rechtlich bestimmen; notwendige Abgrenzungen101/102 sowie Kosten-/Lasten748 separat, keine automatische Netto-/Bruttoannahme. Einheit ausdr\u00fccklich vorgeben, etwa kg oder EUR; nicht unterschiedliche Einheiten addieren. Rechnerischer Bruchteil begr\u00fcndet keine automatische Zuweisung bestimmter unteilbarer Naturst\u00fccke. Bei mehreren Einzelaufrufen Teilhaberanteile ohne Doppelz\u00e4hlung verwenden; kein Ersatz f\u00fcr die Bestimmung der tats\u00e4chlichen Anteilsquoten.")
 ergebnis
}
