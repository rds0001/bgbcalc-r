
makler_anderer_partei_hoechstbelastung <- function(qualifizierter_gesamtmaklerlohn=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(qualifizierter_gesamtmaklerlohn))
 .text(einordnungsnachweis,"einordnungsnachweis")
 eingaben <- list(qualifizierter_gesamtmaklerlohn=qualifizierter_gesamtmaklerlohn, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(.multiplizieren(werte[[1]],.bruch(1,2)), "BGB_MAKLER_ANDERER_PARTEI_HOECHSTBELASTUNG", eingaben, list(list(operation="Gesamtmaklerlohn durch zwei teilen als maximale auf andere Vertragspartei abw\u00e4lzbare Belastung")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("Nur \u00a7656d bei einem Maklervertrag mit einer Partei eines Wohnungs-/Einfamilienhauskaufs und Verbrauchereigenschaft des K\u00e4ufers nach \u00a7656b. Gesamtmaklerlohn ist die rechtlich wirksame einheitliche Kostenbasis beider Parteien nach qualifizierten Erm\u00e4\u00dfigungen/Erlassen; keine Zusammenz\u00e4hlung zus\u00e4tzlicher identischer Forderungen. Ergebnis nur Belastungsobergrenze; \u00fcberschreitende Vereinbarung wird nicht automatisch auf H\u00e4lfte reduziert. F\u00e4lligkeit verlangt Zahlung und Nachweis nach Satz2; kein automatischer F\u00e4lligkeitseintritt."))
 ergebnis
}

makler_gleichwirkender_erlass_restbetrag <- function(bisheriger_gleicher_maklerlohn_je_partei=NULL, qualifizierter_erlassbetrag=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(bisheriger_gleicher_maklerlohn_je_partei), .geld(qualifizierter_erlassbetrag))
 .text(einordnungsnachweis,"einordnungsnachweis")
 if(.vergleichen(werte[[2]],werte[[1]]) > 0) .fehler("qualifizierter_erlassbetrag","Erlassbetrag darf bisherigen gleichen Maklerlohn je Partei nicht \u00fcbersteigen.")
 eingaben <- list(bisheriger_gleicher_maklerlohn_je_partei=bisheriger_gleicher_maklerlohn_je_partei, qualifizierter_erlassbetrag=qualifizierter_erlassbetrag, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(.subtrahieren(werte[[1]],werte[[2]]), "BGB_MAKLER_GLEICHWIRKENDER_ERLASS_RESTBETRAG", eingaben, list(list(operation="Von bisherigem gleichen Maklerlohn je Partei den qualifizierten gleichwirkenden Erlassbetrag abziehen")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("Nur \u00a7656c Absatz1 Satz3/4 bei zuvor wirksam gleich hohen Maklerlohnpflichten beider Parteien und Verbraucher-K\u00e4ufer nach \u00a7656b; erlassene Geldsumme wirkt spiegelbildlich auf jeweils gleiche Pflicht. Erlassbetrag h\u00f6chstens urspr\u00fcnglicher je-Partei-Betrag. Bei verschiedenen/mehrfachen Erlassen deren rechtliche Wechselwirkung zuerst qualifizieren, nicht mehrfach denselben Erlass abziehen. Keine Heilung anf\u00e4nglich ungleicher/unwirksamer Verpflichtungen; keine automatische Erstattung bereits gezahlter Provisionen. Entsprechende Anwendung nach \u00a7656d Absatz2 nur bei fachlich qualifizierter gleichartiger Berechnungsbasis."))
 ergebnis
}
