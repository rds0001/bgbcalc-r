verjaehrung_hoehere_gewalt_fenster <- function(fristlauf_erster_tag=NULL, grundfrist_letzter_tag=NULL, fenster_erster_tag=NULL, fenster_letzter_tag=NULL, verhinderungszeitraeume=NULL, einordnungsnachweis=NULL) {
 erster <- .datum(fristlauf_erster_tag,'fristlauf_erster_tag');grundende <- .datum(grundfrist_letzter_tag,'grundfrist_letzter_tag')
 von <- .datum(fenster_erster_tag,'fenster_erster_tag');bis <- .datum(fenster_letzter_tag,'fenster_letzter_tag')
 fenstergrenze <- if(.iso(von)>='9999-07-01') .datum('9999-12-31','datumgrenze') else .frist(.iso(von),6,'monate','tagesbeginn')
 if(erster>grundende||von>bis||bis>fenstergrenze) .fehler('fenster','Geordneter Fristlauf und Fenster von h\u00f6chstens sechs Kalendermonaten erforderlich.')
 .text(einordnungsnachweis,'einordnungsnachweis');.vorhanden(verhinderungszeitraeume,'verhinderungszeitraeume')
 if(!is.list(verhinderungszeitraeume)||!is.null(names(verhinderungszeitraeume))||length(verhinderungszeitraeume)>10000L) .fehler('verhinderungszeitraeume','Unbenannte Liste0..10000 abgeschlossener Intervalle erforderlich.')
 intervalle <- list()
 for(zeit in verhinderungszeitraeume) {
  if(!is.list(zeit)||is.null(names(zeit))||length(zeit)!=2L||!setequal(names(zeit),c('erster_verhinderter_tag','letzter_verhinderter_tag'))) .fehler('verhinderungszeitraeume','Genau erster_verhinderter_tag und letzter_verhinderter_tag erforderlich.')
  anfang <- .datum(zeit$erster_verhinderter_tag,'erster_verhinderter_tag');schluss <- .datum(zeit$letzter_verhinderter_tag,'letzter_verhinderter_tag')
  if(anfang>schluss) .fehler('verhinderungszeitraeume','Ende nicht vor Anfang.')
  if(anfang<=bis&&schluss>=von) intervalle[[length(intervalle)+1L]] <- list(erster_gehemmter_tag=.iso(max(anfang,von)),letzter_gehemmter_tag=.iso(min(schluss,bis)))
 }
 wert <- verjaehrung_gehemmte_kalendertage(fristlauf_erster_tag,grundfrist_letzter_tag,intervalle,TRUE)$wert
 eingaben <- list(fristlauf_erster_tag=fristlauf_erster_tag, grundfrist_letzter_tag=grundfrist_letzter_tag, fenster_erster_tag=fenster_erster_tag, fenster_letzter_tag=fenster_letzter_tag, verhinderungszeitraeume=verhinderungszeitraeume, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"datum_und_tage","BGB_VERJAEHRUNG_HOEHERE_GEWALT_FENSTER",eingaben,list(list(operation="Qualifiziertes206-Fenster mit Verhinderungsintervallen schneiden und vorhandenen209-Hemmungskern auf die Schnittintervalle anwenden.")),eingaben)
 ergebnis$hinweise <- list("\u00a7206 mit209: nur Schnittmenge rechtlich qualifizierter Verfolgungshindernisse mit einem ausdr\u00fccklich vorgegebenen vollst\u00e4ndigen Sechsmonatsfenster; vorhandener209-Kern vereinigt \u00dcberschneidungen und rechnet Hemmungstage heraus. Das Fenster wird weder eigenst\u00e4ndig r\u00fcckw\u00e4rts aus dem Enddatum ermittelt noch dynamisch verschoben. Seine richtige rechtliche Lage und die Anwendbarkeit eines einzelnen abgeschlossenen Fensters sind Voraussetzungen dieser Funktion. Bei ungekl\u00e4rten, fortdauernden oder mehrfach zu korrigierenden Fensterlagen keine abschlie\u00dfende Verj\u00e4hrung behaupten. Kein allgemeiner Nachlauf von sechs Monaten nach Wegfall des Hindernisses. H\u00f6here Gewalt, Zumutbarkeit und Kausalit\u00e4t sind Rechts-/Tatsachenbewertungen. Alle Grenzen einschlie\u00dflich, keine untert\u00e4gige Rundung und keine doppelte Erfassung bereits ber\u00fccksichtigter Hemmungen. Ablaufhemmung und Neubeginn getrennt.")
 ergebnis
}
