familienrecht_grundfrist <- function(ereignis_am=NULL,fristfall=NULL,ereignisnachweis=NULL) {
  ereignis <- .datum(ereignis_am,"ereignis_am")
  .text(fristfall,"fristfall"); .text(ereignisnachweis,"ereignisnachweis")
  regeln <- list(
    ehefaehigkeitsbefreiung=list(dauer=6,einheit="monate"),
    eheaufhebung_irrtum_taeuschung=list(dauer=1,einheit="jahre"),
    eheaufhebung_drohung=list(dauer=3,einheit="jahre"),
    eheaufhebung_eigenantrag=list(dauer=6,einheit="monate"),
    eheaufhebung_todeserklaerung=list(dauer=1,einheit="jahre"),
    scheidung_ehewohnung_mietanspruch=list(dauer=1,einheit="jahre"),
    scheidung_betreuungsunterhalt=list(dauer=3,einheit="jahre"),
    unterhaltsauskunft_wiederholung=list(dauer=2,einheit="jahre"),
    unterhalt_sonderbedarf=list(dauer=1,einheit="jahre"),
    geburtsname_bestimmung=list(dauer=1,einheit="monate"),
    adoption_elterneinwilligung=list(dauer=3,einheit="jahre"),
    betreuung_anfangsbericht=list(dauer=3,einheit="monate"),
    verloebnis_verjaehrung=list(dauer=3,einheit="jahre"),
    rueckkehrabsicht_ehewohnung=list(dauer=6,einheit="monate"),
    ehegatten_genehmigung=list(dauer=2,einheit="wochen"),
    vormundverein_mitteilung=list(dauer=2,einheit="wochen"),
    vormund_bestellung=list(dauer=3,einheit="monate"),
    vormund_bereitschaft=list(dauer=4,einheit="wochen"),
    vormund_nachholantrag=list(dauer=6,einheit="monate"),
    betreuungsverein_mitteilung=list(dauer=2,einheit="wochen"),
    betreuer_genehmigungsmitteilung=list(dauer=2,einheit="kalenderfolgemonsende"),
    betreuer_aufwendungsersatz=list(dauer=15,einheit="monate"))
  if (!(fristfall %in% names(regeln))) .fehler("fristfall","Unbekannte gesetzliche familienrechtliche Grundfrist.")
  regel <- regeln[[fristfall]]
  if (regel$einheit == "kalenderfolgemonsende") ende <- .frist(paste0(substr(.iso(ereignis),1,7),"-01"),3,"monate","tagesbeginn") else ende <- .frist(ereignis_am,regel$dauer,regel$einheit,"ereignis")
  eingaben <- list(ereignis_am=ereignis_am,fristfall=fristfall,ereignisnachweis=ereignisnachweis)
  ergebnis <- .ergebnis(.iso(ende),"datum","BGB_FAMILIENRECHT_GRUNDFRIST",eingaben,list(list(operation="Feste normgebundene Dauer ab qualifiziertem Ereignis mit Kalenderkern;\u00a71856II bis Ende des zweiten Folgemonats.")),eingaben)
  ergebnis$hinweise <- list("Nur gesetzliche Grundfrist, kein Wirksamkeits-, Anspruchs- oder Erl\u00f6schensurteil. Ereignisse rechtlich qualifizieren und Regeln nicht frei w\u00e4hlen. Hemmung, Ablaufhemmung, Neubeginn, gerichtliche Fristabweichungen/-verl\u00e4ngerungen und eine einschl\u00e4gige\u00a7193-Verschiebung gesondert anwenden. Alsbald-Pflichten bleiben trotz H\u00f6chstfrist bestehen. Bei\u00a71856II endet die Frist am letzten Tag des zweiten Folgemonats, auch bei Aufforderung am ersten Monatstag; keine blo\u00dfe Addition zweier Monate zum Empfangstag. Verj\u00e4hrung\u00a71302 ben\u00f6tigt au\u00dferhalb des ungest\u00f6rten Grundfalls weitere Berechnung.")
  ergebnis
}
ehefaehigkeitszeugnis_geltungsende <- function(ausstellung_am=NULL,urkundenende_am=NULL) {
  ausstellung <- .datum(ausstellung_am,"ausstellung_am")
  hoechstende <- .frist(ausstellung_am,6,"monate","ereignis")
  urkundenende <- NULL
  if (!is.null(urkundenende_am)) {
    urkundenende <- .datum(urkundenende_am,"urkundenende_am")
    if (urkundenende < ausstellung) .fehler("urkundenende_am","Urkundenende darf nicht vor Ausstellung liegen.")
  }
  ende <- if (is.null(urkundenende)) hoechstende else min(hoechstende,urkundenende)
  eingaben <- list(ausstellung_am=ausstellung_am,urkundenende_am=urkundenende_am)
  ergebnis <- .ergebnis(.iso(ende),"datum","BGB_EHEFAEHIGKEITSZEUGNIS_GELTUNGSENDE",eingaben,list(list(operation="Ausstellung plus sechs Monate; fr\u00fchere qualifizierte Urkundengeltung als Obergrenze ber\u00fccksichtigen.")),eingaben)
  ergebnis$hinweise <- list("\u00a71309I3, nur Zeugnisgeltung. In der Urkunde angegebene k\u00fcrzere Dauer vorab in rechtlich ma\u00dfgeblichen letzten Geltungstag umsetzen; fehlende Begrenzung als NULL. Sp\u00e4teres Urkundenende verl\u00e4ngert die gesetzliche Sechsmonatsgrenze nicht. Keine automatische Pr\u00fcfung von Ehef\u00e4higkeit, Herkunft, Befreiung oder Eheschlie\u00dfung. Keine Verl\u00e4ngerung einer materiellen Geltungsdauer durch Wochenende/Feiertag.")
  ergebnis
}
