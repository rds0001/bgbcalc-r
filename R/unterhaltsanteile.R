unterhalt_anteilsbetraege <- function(verteilbarer_barunterhalt=NULL,unterhaltspflichtige=NULL,verteilungsnachweis=NULL) {
  bedarf <- .geld(verteilbarer_barunterhalt)
  .vorhanden(unterhaltspflichtige,"unterhaltspflichtige")
  if (!is.list(unterhaltspflichtige) || length(unterhaltspflichtige)<1 || length(unterhaltspflichtige)>1000 || !is.null(names(unterhaltspflichtige))) .fehler("unterhaltspflichtige","Liste mit 1 bis 1000 qualifizierten gleich nahen Barunterhaltspflichtigen erforderlich.")
  namen <- character();gewichte <- list();summe <- .bruch(0)
  for (eintrag in unterhaltspflichtige) {
    if (!is.list(eintrag) || length(eintrag)!=2 || !setequal(names(eintrag),c("person_id","verteilungsgewicht"))) .fehler("unterhaltspflichtige","Genau person_id und verteilungsgewicht erforderlich.")
    name <- .text(eintrag$person_id,"person_id")
    if (name %in% namen) .fehler("person_id","Unterhaltspflichtige Person nicht mehrfach auff\u00fchren.")
    .vorhanden(eintrag$verteilungsgewicht,"verteilungsgewicht")
    gewicht <- .zahleneingabe(eintrag$verteilungsgewicht)
    if (.vergleichen(gewicht,.bruch(0))<=0) .fehler("verteilungsgewicht","Positives rechtlich bewertetes Verteilungsgewicht erforderlich.")
    namen <- c(namen,name);gewichte[[length(gewichte)+1]] <- gewicht;summe <- .addieren(summe,gewicht)
  }
  .text(verteilungsnachweis,"verteilungsnachweis")
  anteile <- list()
  for (i in seq_along(namen)) {
    quote <- .dividieren(gewichte[[i]],summe)
    anteile[[i]] <- list(person_id=namen[[i]],anteilsquote=.bruchteile(quote),unterhaltsbetrag=.bruchteile(.multiplizieren(bedarf,quote)))
  }
  eingaben <- list(verteilbarer_barunterhalt=verteilbarer_barunterhalt,unterhaltspflichtige=unterhaltspflichtige,verteilungsnachweis=verteilungsnachweis)
  ergebnis <- .ergebnis(anteile,"EUR","BGB_UNTERHALT_ANTEILSBETRAEGE",eingaben,list(list(operation="Qualifizierte Erwerbs-/Verm\u00f6gensgewichte summieren, jedes Gewicht durch die Summe teilen und Barunterhalt damit multiplizieren.")),eingaben)
  ergebnis$hinweise <- list("Grundverteilung nach\u00a71606III1 f\u00fcr denselben Zeitraum und denselben qualifizierten Barunterhaltsbedarf. Kreis der tats\u00e4chlich gleich nahen barunterhaltspflichtigen Verwandten sowie Rang, Erwerbs-/Verm\u00f6gensbewertung und Verteilungsgewichte rechtlich vorqualifiziert. Gewichte sind keine ungepr\u00fcften Bruttoeinkommen und nicht notwendig normierte Quoten. Keine Ermittlung von Selbstbehalt, gesteigerter Haftung, Bedarfsrang, Wechselmodell oder Naturalunterhalt nachSatz2. Nur wenn individuelle Leistungsf\u00e4higkeitsgrenzen bei den errechneten Anteilen nicht eingreifen; Mangelfall-/Deckelungsumverteilung gesondert. Nichtpflichtige oder mit Gewicht null ausgeschiedene Personen au\u00dferhalb dieses qualifizierten Kreises behandeln.")
  ergebnis
}
