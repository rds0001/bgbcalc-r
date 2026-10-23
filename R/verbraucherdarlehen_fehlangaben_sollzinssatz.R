verbraucherdarlehen_fehlangaben_sollzinssatz <- function(vertraglicher_sollzinssatz=NULL, fehlangabennachweis=NULL) {
 s <- .zahleneingabe(vertraglicher_sollzinssatz);.text(fehlangabennachweis,'fehlangabennachweis');wert <- .bruchteile(if(.vergleichen(s,.bruch(1,25))<0)s else .bruch(1,25))
 eingaben <- list(vertraglicher_sollzinssatz=vertraglicher_sollzinssatz, fehlangabennachweis=fehlangabennachweis)
 ergebnis <- .ergebnis(wert,"Jahresquote","BGB_VERBRAUCHERDARLEHEN_FEHLANGABEN_SOLLZINSSATZ",eingaben,list(list(operation="Vertraglichen Jahreszinssatz auf h\u00f6chstens den gesetzlichen Satz von vier Prozent vermindern.")),eingaben)
 ergebnis$hinweise <- list("494II in Verbindung mit246: Jahresquote auf h\u00f6chstens0.04 vermindern. Bereits niedrigerer oder negativer vertraglicher Satz wird nicht erh\u00f6ht. Ergebnis ist nur die Zinsbasis; keine automatische Zahlungspflicht bei negativem Satz. Tats\u00e4chliche Zinsbetr\u00e4ge/Teilzahlungen anhand der rechtlich fortbestehenden Vertragsstruktur berechnen. Nicht mit der Differenzkorrektur bei zu niedrig angegebenem Effektivzins494III verwechseln.")
 ergebnis
}
