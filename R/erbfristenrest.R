erbrecht_weitere_grundfrist <- function(fristart=NULL, fristbeginnereignis_am=NULL, einordnungsnachweis=NULL) {
  .auswahl(fristart,"fristart",c("erbrechtsnachweis_1965","nachlassverwaltung_1981","erbteilvorkauf_2034","glaeubigeranmeldung_2061"))
  beginn <- .datum(fristbeginnereignis_am,"fristbeginnereignis_am")
  .text(einordnungsnachweis,"einordnungsnachweis")
  laengen <- list(erbrechtsnachweis_1965=list(3,"monate"),nachlassverwaltung_1981=list(2,"jahre"),
    erbteilvorkauf_2034=list(2,"monate"),glaeubigeranmeldung_2061=list(6,"monate"))
  anzahl <- laengen[[fristart]][[1]]; einheit <- laengen[[fristart]][[2]]
  ende <- .frist(.iso(beginn),anzahl,einheit,"ereignis")
  eingaben <- list(fristart=fristart,fristbeginnereignis_am=fristbeginnereignis_am,einordnungsnachweis=einordnungsnachweis)
  ergebnis <- .ergebnis(list(grundfristende=.iso(ende),anzahl=anzahl,einheit=einheit),"datum_und_fristlaenge",
    "BGB_ERBRECHT_WEITERE_GRUNDFRIST",eingaben,
    list(list(operation="Gesetzliche Fristl\u00e4nge ausw\u00e4hlen und Ereignisfrist mit vorhandenem Kalenderkern berechnen")),eingaben)
  ergebnis$annahmen <- list("Feste lokale BGB-Fassung; ausschlie\u00dflich rohe gesetzliche Grundfrist ab rechtlich qualifiziertem Ereignis.")
  ergebnis$hinweise <- list("\u00a71965 Absatz2: Beginn nach Ablauf der \u00f6ffentlichen Anmeldungsfrist, ohne \u00f6ffentliche Aufforderung gerichtliche Aufforderung zum Nachweis des Erbrechts oder Klage. \u00a71981 Absatz2: Annahme der Erbschaft, betrifft Antrag eines Nachlassgl\u00e4ubigers. \u00a72034 Absatz2: Empfang der rechtlich ausreichenden Mitteilung des Vertragsinhalts nach\u00a7469, nicht pauschal Kaufvertrag oder Anteils\u00fcbertragung. \u00a72061 Absatz2: letzte erforderliche Ver\u00f6ffentlichung, nicht die erste. Keine automatische Zul\u00e4ssigkeits-/Erkl\u00e4rungspr\u00fcfung, Hemmung oder Wochenend-/Feiertagsverschiebung; Grundfristende nicht ungepr\u00fcft als endg\u00fcltigen letzten Handlungstag verwenden. \u00a72061-Haftungsquote ist gesonderte Betragsregel.")
  ergebnis
}
inventarfrist_erbentod_mindestende <- function(bisheriges_fristende=NULL,erbe_gestorben_am=NULL,
    ausschlagungsfristende_erbeserbe=NULL,einordnungsnachweis=NULL) {
  bisher <- .datum(bisheriges_fristende,"bisheriges_fristende")
  tod <- .datum(erbe_gestorben_am,"erbe_gestorben_am")
  ausschlagung <- .datum(ausschlagungsfristende_erbeserbe,"ausschlagungsfristende_erbeserbe")
  if (ausschlagung<tod) .fehler("ausschlagungsfristende_erbeserbe","Ausschlagungsfrist f\u00fcr Erbschaft des verstorbenen Erben darf nicht vor dessen Tod enden.")
  .text(einordnungsnachweis,"einordnungsnachweis")
  ende <- if (tod<=bisher) max(bisher,ausschlagung) else bisher
  eingaben <- list(bisheriges_fristende=bisheriges_fristende,erbe_gestorben_am=erbe_gestorben_am,
    ausschlagungsfristende_erbeserbe=ausschlagungsfristende_erbeserbe,einordnungsnachweis=einordnungsnachweis)
  ergebnis <- .ergebnis(list(massgebliches_fristende=.iso(ende)),"datum","BGB_INVENTARFRIST_ERBENTOD_MINDESTENDE",
    eingaben,list(list(operation="Tod vor Tagesablauf pr\u00fcfen; Frist auf sp\u00e4teres bisheriges oder einschl\u00e4giges Ausschlagungsende setzen")),eingaben)
  ergebnis$annahmen <- list("Feste lokale BGB-Fassung; Ereignis am letzten Fristtag liegt vor dessen Ablauf.")
  ergebnis$hinweise <- list("Nur\u00a71998 f\u00fcr Inventarfrist oder Zweiwochenfrist\u00a71996 Absatz2; nicht absolute Jahresgrenze verl\u00e4ngern. Eingaben sind bereits rechtlich ma\u00dfgebliche Fristenden einschlie\u00dflich jeweils einschl\u00e4giger Korrekturen. Tod nach Ablauf belebt Frist nicht wieder. Keine Addition oder neue volle Inventarfrist ab Tod. F\u00fcr mehrere Erbeserben deren jeweilige Ausschlagungsfrist und Rechtsstellung gesondert bestimmen; keine automatische gemeinsame Maximalfrist aller Personen.")
  ergebnis
}
totgeglaubter_verjaehrung_mindestende <- function(bisheriges_verjaehrungsende=NULL,
    kenntnis_todesannahme_am=NULL,einordnungsnachweis=NULL) {
  bisher <- .datum(bisheriges_verjaehrungsende,"bisheriges_verjaehrungsende")
  kenntnis <- .datum(kenntnis_todesannahme_am,"kenntnis_todesannahme_am")
  .text(einordnungsnachweis,"einordnungsnachweis")
  minimum <- .frist(.iso(kenntnis),1,"jahre","ereignis")
  ende <- max(bisher,minimum)
  eingaben <- list(bisheriges_verjaehrungsende=bisheriges_verjaehrungsende,
    kenntnis_todesannahme_am=kenntnis_todesannahme_am,einordnungsnachweis=einordnungsnachweis)
  ergebnis <- .ergebnis(list(einjaehriges_mindestende=.iso(minimum),massgebliches_verjaehrungsende=.iso(ende)),
    "daten","BGB_TOTGEGLAUBTER_VERJAEHRUNG_MINDESTENDE",eingaben,
    list(list(operation="Einj\u00e4hriges Kenntnismindestende berechnen und Maximum mit bisherigem Verj\u00e4hrungsende bilden")),eingaben)
  ergebnis$annahmen <- list("Feste lokale BGB-Fassung;\u00a72031-Anwendungsfall rechtlich bestimmt, betroffene Person lebt f\u00fcr den betrachteten Zeitraum fort.")
  ergebnis$hinweise <- list("Qualifizierter Anspruch der tats\u00e4chlich lebenden, f\u00e4lschlich f\u00fcr tot erkl\u00e4rten oder als tot angenommenen Person; keine beliebige Erbenkenntnis. Mindestgrenze gilt nur solange diese Person lebt; Tod w\u00e4hrend des betrachteten Zeitraums ist au\u00dferhalb dieses Modells. Vorhandenes Verj\u00e4hrungsende rechtlich bestimmt, nicht beliebiges Anspruchsdatum. Keine neue einj\u00e4hrige Verj\u00e4hrungsfrist anstelle einer l\u00e4ngeren Frist, kein pauschaler Jahresendbeginn. Weitere Hemmungen/Kalenderkorrekturen und Einredeaus\u00fcbung separat.")
  ergebnis
}
