gesamthypothek_wertanteile <- function(zu_verteilender_hypothekenbetrag=NULL,grundstuecke=NULL,verteilungsnachweis=NULL) {
  bedarf <- .geld(zu_verteilender_hypothekenbetrag)
  .vorhanden(grundstuecke,"grundstuecke")
  if (!is.list(grundstuecke) || length(grundstuecke)<1 || length(grundstuecke)>1000 || !is.null(names(grundstuecke))) .fehler("grundstuecke","Liste mit 1 bis 1000 qualifizierten belasteten Grundst\u00fccken erforderlich.")
  namen <- character();gewichte <- list();summe <- .bruch(0)
  for (eintrag in grundstuecke) {
    if (!is.list(eintrag) || length(eintrag)!=3 || !setequal(names(eintrag),c("grundstueck_id","grundstueckswert","vorrangige_belastungen"))) .fehler("grundstuecke","Genau grundstueck_id, grundstueckswert und vorrangige_belastungen erforderlich.")
    name <- .text(eintrag$grundstueck_id,"grundstueck_id")
    if (name %in% namen) .fehler("grundstueck_id","Grundst\u00fccksteil nicht mehrfach auff\u00fchren.")
    .vorhanden(eintrag$grundstueckswert,"grundstueckswert")
    gewicht <- .subtrahieren(.geld(eintrag$grundstueckswert),.geld(eintrag$vorrangige_belastungen))
    if (.vergleichen(gewicht,.bruch(0))<0) .fehler("grundstueckswert","Dieser Grundfall setzt einen nichtnegativen Nettogrundst\u00fcckswert voraus.")
    namen <- c(namen,name);gewichte[[length(gewichte)+1]] <- gewicht;summe <- .addieren(summe,gewicht)
  }
  if (.vergleichen(summe,.bruch(0))==0) .fehler("grundstuecke","Positive Summe der Nettogrundst\u00fcckswerte erforderlich.")
  .text(verteilungsnachweis,"verteilungsnachweis")
  anteile <- list()
  for (i in seq_along(namen)) {
    quote <- .dividieren(gewichte[[i]],summe)
    anteile[[i]] <- list(grundstueck_id=namen[[i]],anteilsquote=.bruchteile(quote),hypothekenanteil=.bruchteile(.multiplizieren(bedarf,quote)))
  }
  eingaben <- list(zu_verteilender_hypothekenbetrag=zu_verteilender_hypothekenbetrag,grundstuecke=grundstuecke,verteilungsnachweis=verteilungsnachweis)
  ergebnis <- .ergebnis(anteile,"EUR","BGB_GESAMTHYPOTHEK_WERTANTEILE",eingaben,list(list(operation="Vorranglasten vom Grundst\u00fcckswert abziehen, positive Nettowertsumme bilden und Hypothekenbetrag nach Nettowerten verteilen.")),eingaben)
  ergebnis$hinweise <- list("Grundfall\u00a71172Absatz2, ebenso\u00a71175: keine abweichende Vereinbarung; alle gemeinschaftlich berechtigten belasteten Grundst\u00fccke vollst\u00e4ndig erfassen. Ma\u00dfgebliche Werte und vorrangige Belastungen rechtlich bewertet, keine blo\u00dfen Nominalbetr\u00e4ge ohne Zuordnung. Diese Grundrechnung setzt nichtnegative Nettowerte und positive Nettowertsumme voraus; \u00dcberbelastung und ausschlie\u00dflich wertlose Grundst\u00fccke ben\u00f6tigen gesonderte rechtliche Behandlung. Teil\u00fcbergang mit Schuldnerregress\u00a71174, Konkurrenz\u00a71176 und bestehende Gl\u00e4ubigervorr\u00e4nge nicht durch diese Quotenrechnung entschieden.")
  ergebnis
}
