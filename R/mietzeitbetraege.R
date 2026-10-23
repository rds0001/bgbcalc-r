
miete_zeitanteiliger_minderungsbetrag <- function(miete_des_abrechnungsabschnitts=NULL, qualifizierte_gesamtminderungsquote=NULL, beruecksichtigungsfaehiger_mangelzeitanteil=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(miete_des_abrechnungsabschnitts), .geld(qualifizierte_gesamtminderungsquote), .geld(beruecksichtigungsfaehiger_mangelzeitanteil))
 .text(einordnungsnachweis,"einordnungsnachweis")
 if(any(vapply(werte[-1],function(q) .vergleichen(q,.bruch(1))>0,logical(1)))) .fehler("anteile","Minderungs- und Zeitanteile d\u00fcrfen eins nicht \u00fcbersteigen.")
 eingaben <- list(miete_des_abrechnungsabschnitts=miete_des_abrechnungsabschnitts, qualifizierte_gesamtminderungsquote=qualifizierte_gesamtminderungsquote, beruecksichtigungsfaehiger_mangelzeitanteil=beruecksichtigungsfaehiger_mangelzeitanteil, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(.multiplizieren(.multiplizieren(werte[[1]],werte[[2]]),werte[[3]]), "BGB_MIETE_ZEITANTEILIGER_MINDERUNGSBETRAG", eingaben, list(list(operation="Miete des homogenen Abrechnungsabschnitts mit qualifizierter Gesamtminderungsquote und ber\u00fccksichtigungsf\u00e4higem Mangelzeitanteil multiplizieren")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("Nur \u00a7536 bei rechtlich qualifizierter Mietminderung und homogener Mietpreis-/Minderungsbasis. Quote0..1 extern bestimmen; vollst\u00e4ndige Gebrauchsunm\u00f6glichkeit gegebenenfalls1. Gleichzeitige M\u00e4ngel zuerst zu rechtlich angemessener Gesamtquote zusammenf\u00fchren, nicht einzelne Quoten blind addieren. Zeitanteil0..1 ohne unerhebliche/ausgeschlossene Beeintr\u00e4chtigungen, insbesondere \u00a7536 Absatz1a und sonstige Ausschl\u00fcsse. Bei wechselnden Quoten/Mieten disjunkte Abschnitte getrennt berechnen. Keine Minderungstabelle, kein Marktwertverh\u00e4ltnis aus Kaufminderung, keine automatische Monatsl\u00e4nge oder Dreimonatsausnahmeberechnung."))
 ergebnis
}

mietvorauszahlung_zeitanteilige_rueckerstattung <- function(vorausgezahlte_abschnittsmiete=NULL, nach_beendigung_liegender_zeitanteil=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(vorausgezahlte_abschnittsmiete), .geld(nach_beendigung_liegender_zeitanteil))
 .text(einordnungsnachweis,"einordnungsnachweis")
 if(any(vapply(werte[-1],function(q) .vergleichen(q,.bruch(1))>0,logical(1)))) .fehler("anteile","Minderungs- und Zeitanteile d\u00fcrfen eins nicht \u00fcbersteigen.")
 eingaben <- list(vorausgezahlte_abschnittsmiete=vorausgezahlte_abschnittsmiete, nach_beendigung_liegender_zeitanteil=nach_beendigung_liegender_zeitanteil, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(.multiplizieren(werte[[1]],werte[[2]]), "BGB_MIETVORAUSZAHLUNG_ZEITANTEILIGE_RUECKERSTATTUNG", eingaben, list(list(operation="Vorausgezahlte Miete eines homogen bepreisten Abschnitts mit dem nach Vertragsende liegenden Zeitanteil multiplizieren")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("Nur \u00a7547 Absatz1 Satz1 bei qualifiziert vom Vermieter zu vertretender Beendigung und einem gleichm\u00e4\u00dfig bepreisten Vorauszahlungsabschnitt. Zahlung muss gerade diesen Abschnitt betreffen; Zeitanteil0..1 rechtlich bestimmen. Unterschiedliche Preise/Zahlungszuordnungen abschnittsweise rechnen. Bei nicht zu vertretender Beendigung Bereicherungsrecht nach Satz2 gesondert, kein automatischer identischer R\u00fcckbetrag. Gesetzliche Zinsen ab jeweiligem Empfang mit vorhandenem Zinskern separat berechnen; keine automatische pauschale Verzinsung vor Eingang."))
 ergebnis
}
