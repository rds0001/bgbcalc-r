betreuung_genehmigung_ablaufgrenze <- function(rechnerisches_fristende_ohne_genehmigungsverfahren=NULL, genehmigungsverfahren_beginn_am=NULL, genehmigung_rechtskraft_am=NULL, einordnungsnachweis=NULL) {
 grund <- .datum(rechnerisches_fristende_ohne_genehmigungsverfahren,'rechnerisches_fristende_ohne_genehmigungsverfahren')
 beginn <- .datum(genehmigungsverfahren_beginn_am,'genehmigungsverfahren_beginn_am')
 ende <- .datum(genehmigung_rechtskraft_am,'genehmigung_rechtskraft_am')
 .text(einordnungsnachweis,'einordnungsnachweis')
 if(beginn>grund) .fehler('genehmigungsverfahren_beginn_am','Keine Wiederbelebung einer vor Verfahrensbeginn abgelaufenen Frist.')
 if(ende<beginn) .fehler('genehmigung_rechtskraft_am','Rechtskraft darf nicht vor Verfahrensbeginn liegen.')
 wert <- list(rechnerisches_fristende=.iso(max(grund,ende)))
 eingaben <- list(rechnerisches_fristende_ohne_genehmigungsverfahren=rechnerisches_fristende_ohne_genehmigungsverfahren, genehmigungsverfahren_beginn_am=genehmigungsverfahren_beginn_am, genehmigung_rechtskraft_am=genehmigung_rechtskraft_am, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"datum","BGB_BETREUUNG_GENEHMIGUNG_ABLAUFGRENZE",eingaben,list(list(operation="Rechtzeitig begonnenes Genehmigungsverfahren pr\u00fcfen; bisherigen letzten Fristtag fr\u00fchestens auf die Rechtskraft der Erteilung verschieben, ohne Verfahrenstage zu addieren.")),eingaben)
 ergebnis$hinweise <- list("\u00a71858III: qualifiziertes einseitiges Rechtsgesch\u00e4ft gegen\u00fcber Gericht oder Beh\u00f6rde, f\u00fcr das eine nachtr\u00e4gliche betreuungsgerichtliche Genehmigung rechtskr\u00e4ftig erteilt wird. Gesetzlicher Fristablauf w\u00e4hrend des wirksamen Genehmigungsverfahrens gehemmt; keine Addition s\u00e4mtlicher Verfahrenstage nach209 und keine neue volle Frist ab Rechtskraft. Verfahrensbeginn und Rechtskraft der Erteilung bereits rechtlich bestimmt. Rechtskraft einer Versagung, nichtgesetzliche Fristen und andere Genehmigungslagen sind nicht Gegenstand dieses Bausteins. Ein bereits vor Verfahrensbeginn au\u00dferhalb des Schutzes eingetretener Fristablauf wird nicht wiederbelebt. Bei laufendem Verfahren ohne Rechtskraft kein fiktiver Endtag. Ereignisse auf rechtlich ma\u00dfgebliche Kalendertage normalisieren; weitere Fristkorrekturen gesondert.")
 ergebnis
}
