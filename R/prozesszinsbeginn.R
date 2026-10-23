prozesszins_erster_zinstag <- function(rechtshaengigkeit_am=NULL, faelligkeits_zinsbeginn_am=NULL, einordnungsnachweis=NULL) {
 haengig <- .datum(rechtshaengigkeit_am,'rechtshaengigkeit_am');faellig <- .datum(faelligkeits_zinsbeginn_am,'faelligkeits_zinsbeginn_am')
 .text(einordnungsnachweis,'einordnungsnachweis')
 nach_haengigkeit <- .tage_addieren(haengig,1)
 wert <- list(rechtshaengigkeits_zinsbeginn=.iso(nach_haengigkeit),erster_prozesszinstag=.iso(max(nach_haengigkeit,faellig)))
 eingaben <- list(rechtshaengigkeit_am=rechtshaengigkeit_am, faelligkeits_zinsbeginn_am=faelligkeits_zinsbeginn_am, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"daten","BGB_PROZESSZINS_ERSTER_ZINSTAG",eingaben,list(list(operation="Folgetag der Rechtsh\u00e4ngigkeit mit dem qualifizierten f\u00e4lligkeitsbezogenen ersten Zinstag vergleichen und den sp\u00e4teren Tag w\u00e4hlen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7291: kein Schuldnerverzug f\u00fcr Prozesszinsen erforderlich. Rechtsh\u00e4ngigkeitsbezogener Beginn am Folgetag entsprechend187I, prim\u00e4r belegt durchBAG6AZR237/15Rn43. Sp\u00e4tere F\u00e4lligkeit begrenzt den Beginn zus\u00e4tzlich; deren erster Zinstag muss bereits rechtlich bestimmt sein, keine pauschale ungepr\u00fcfte Behandlung jedes F\u00e4lligkeitstags als Ereignis oder Tagesbeginn. Verschiedene Forderungs-/Ratenanteile mit verschiedenen F\u00e4lligkeiten getrennt rechnen. F\u00fcr Betrag vorhandenen Verzugszins-Satzkern entsprechend291/288 verwenden, ohne tats\u00e4chlichen Verzug zu unterstellen; Zinsforderungen gem\u00e4\u00df289Satz1 nicht einfach mitverzinsen. Andere fr\u00fcher beginnende Zinsanspr\u00fcche bleiben separat.")
 ergebnis
}
