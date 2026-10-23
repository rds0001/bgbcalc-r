verjaehrung_selbstbestimmungszeitraum <- function(fristlauf_erster_tag=NULL,grundfrist_letzter_tag=NULL,geburtsdatum=NULL,gemeinschaft_bei_fristbeginn=NULL,letzter_gemeinschaftstag=NULL,einordnungsnachweis=NULL) {
  erster <- .datum(fristlauf_erster_tag,'fristlauf_erster_tag')
  .datum(grundfrist_letzter_tag,'grundfrist_letzter_tag')
  geburt <- .datum(geburtsdatum,'geburtsdatum')
  if (geburt > erster) .fehler('geburtsdatum','Geburt darf nicht nach erstem Fristlauftag liegen.')
  .wahrheitswert(gemeinschaft_bei_fristbeginn,'gemeinschaft_bei_fristbeginn')
  .text(einordnungsnachweis,'einordnungsnachweis')
  altersende <- .tage_addieren(.datum(lebensalter_beginn(geburtsdatum,21)$wert,'altersgrenze'),-1)
  intervalle <- list()
  if (erster <= altersende) intervalle[[length(intervalle)+1]] <- list(erster_gehemmter_tag=fristlauf_erster_tag,letzter_gehemmter_tag=.iso(altersende))
  if (gemeinschaft_bei_fristbeginn) {
    gemeinschaftsende <- .datum(letzter_gemeinschaftstag,'letzter_gemeinschaftstag')
    if (gemeinschaftsende < erster) .fehler('letzter_gemeinschaftstag','Bei Fristbeginn bestehende Gemeinschaft kann nicht vorher enden.')
    intervalle[[length(intervalle)+1]] <- list(erster_gehemmter_tag=fristlauf_erster_tag,letzter_gehemmter_tag=letzter_gemeinschaftstag)
  } else if (!is.null(letzter_gemeinschaftstag)) .fehler('letzter_gemeinschaftstag','Ohne Gemeinschaft bei Fristbeginn kein Gemeinschaftsende angeben.')
  kern <- verjaehrung_gehemmte_kalendertage(fristlauf_erster_tag,grundfrist_letzter_tag,intervalle,TRUE)
  eingaben <- list(fristlauf_erster_tag=fristlauf_erster_tag,grundfrist_letzter_tag=grundfrist_letzter_tag,geburtsdatum=geburtsdatum,gemeinschaft_bei_fristbeginn=gemeinschaft_bei_fristbeginn,letzter_gemeinschaftstag=letzter_gemeinschaftstag,einordnungsnachweis=einordnungsnachweis)
  ergebnis <- .ergebnis(kern$wert,'datum_und_tage','BGB_VERJAEHRUNG_SELBSTBESTIMMUNGSZEITRAUM',eingaben,c(list(list(operation='Altershemmung bis zum letzten Tag vor21 und bei Fristbeginn bestehende Gemeinschaft vereinigen; tats\u00e4chliche Hemmungstage mit vorhandenem209-Kern ber\u00fccksichtigen.')),kern$rechenschritte),eingaben)
  ergebnis$hinweise <- list('Nur rechtlich qualifizierter Anspruch wegen Verletzung der sexuellen Selbstbestimmung nach\u00a7208. H\u00e4usliche Gemeinschaft muss bei Beginn der Verj\u00e4hrung bestehen und bis zum angegebenen tats\u00e4chlichen Ende ununterbrochen fortbestehen; sp\u00e4ter neu begr\u00fcndete Gemeinschaft nicht als anf\u00e4ngliche ausgeben. letzter_gemeinschaftstag ist der rechtlich normalisierte letzte eingeschlossene Hemmungstag, kein blo\u00dfer Auswertungsstichtag einer noch laufenden Gemeinschaft. Alters- und Gemeinschaftszeit \u00fcberschneiden sich und werden nicht additiv doppelt gez\u00e4hlt.207, andere Hemmungen, Ablaufhemmung, Neubeginn und193 gesondert.')
  ergebnis
}
