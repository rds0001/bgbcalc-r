reallast_flaechenanteile <- function(teilbare_leistungsmenge=NULL,grundstuecksteile=NULL,verteilungsnachweis=NULL) {
  bedarf <- .geld(teilbare_leistungsmenge)
  .vorhanden(grundstuecksteile,"grundstuecksteile")
  if (!is.list(grundstuecksteile) || length(grundstuecksteile)<1 || length(grundstuecksteile)>1000 || !is.null(names(grundstuecksteile))) .fehler("grundstuecksteile","Liste mit 1 bis 1000 qualifizierten Grundst\u00fccksteilen erforderlich.")
  namen <- character();gewichte <- list();summe <- .bruch(0)
  for (eintrag in grundstuecksteile) {
    if (!is.list(eintrag) || length(eintrag)!=2 || !setequal(names(eintrag),c("grundstueck_id","flaeche"))) .fehler("grundstuecksteile","Genau grundstueck_id und flaeche erforderlich.")
    name <- .text(eintrag$grundstueck_id,"grundstueck_id")
    if (name %in% namen) .fehler("grundstueck_id","Grundst\u00fccksteil nicht mehrfach auff\u00fchren.")
    .vorhanden(eintrag$flaeche,"flaeche")
    gewicht <- .zahleneingabe(eintrag$flaeche)
    if (.vergleichen(gewicht,.bruch(0))<=0) .fehler("flaeche","Positive Fl\u00e4che in derselben Einheit erforderlich.")
    namen <- c(namen,name);gewichte[[length(gewichte)+1]] <- gewicht;summe <- .addieren(summe,gewicht)
  }
  .text(verteilungsnachweis,"verteilungsnachweis")
  anteile <- list()
  for (i in seq_along(namen)) {
    quote <- .dividieren(gewichte[[i]],summe)
    anteile[[i]] <- list(grundstueck_id=namen[[i]],anteilsquote=.bruchteile(quote),leistungsanteil=.bruchteile(.multiplizieren(bedarf,quote)))
  }
  eingaben <- list(teilbare_leistungsmenge=teilbare_leistungsmenge,grundstuecksteile=grundstuecksteile,verteilungsnachweis=verteilungsnachweis)
  ergebnis <- .ergebnis(anteile,"leistungseinheiten","BGB_REALLAST_FLAECHENANTEILE",eingaben,list(list(operation="Fl\u00e4chen summieren, einzelne Fl\u00e4che durch Gesamtfl\u00e4che teilen und teilbare Leistung damit multiplizieren.")),eingaben)
  ergebnis$hinweise <- list("Nur qualifizierter Grundfall des\u00a71109Absatz1 nach Teilung des berechtigten Grundst\u00fccks. Leistung ist tats\u00e4chlich teilbar und in einer gemeinsamen Einheit bewertet; s\u00e4mtliche betroffenen Teile mit positiver Fl\u00e4che in derselben Fl\u00e4cheneinheit erfassen. Keine abweichende wirksame Zuordnung nachAbsatz2, keine Beschr\u00e4nkung auf einen allein beg\u00fcnstigten Teil nachAbsatz3. Unteilbare Leistungen nach\u00a7432 und Aus\u00fcbungsmodalit\u00e4ten bleiben au\u00dferhalb dieser Mengenverteilung. Keine automatische Feststellung dinglicher Rechte.")
  ergebnis
}
