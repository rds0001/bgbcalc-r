
digitalbeendigung_zeitanteilige_betraege <- function(vereinbarter_abschnittspreis=NULL, gezahlter_abschnittspreis=NULL, zeiteinheiten_gesamt=NULL, zeiteinheiten_mangelhaft=NULL, zeiteinheiten_nicht_mehr_zu_erbringen=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(vereinbarter_abschnittspreis), .geld(gezahlter_abschnittspreis), .geld(zeiteinheiten_gesamt), .geld(zeiteinheiten_mangelhaft), .geld(zeiteinheiten_nicht_mehr_zu_erbringen))
 .text(einordnungsnachweis,"einordnungsnachweis")
 preis <- werte[[1]]; zahlung <- werte[[2]]; gesamt <- werte[[3]]; mangel <- werte[[4]]; zukunft <- werte[[5]]
 entfall <- .addieren(mangel,zukunft)
 if(.vergleichen(gesamt,.bruch(0))<=0 || .vergleichen(entfall,gesamt)>0) .fehler("zeiteinheiten_gesamt","Gesamtzeit muss positiv sein und die disjunkten Teilzeiten umfassen.")
 if(.vergleichen(zahlung,preis)>0) .fehler("gezahlter_abschnittspreis","Zahlung darf Abschnittspreis nicht \u00fcbersteigen.")
 quote <- .dividieren(entfall,gesamt)
 wert <- list(entfallender_zeitanteil=.bruchteile(quote),erloschener_preisanteil=.bruchteile(.multiplizieren(preis,quote)),erstattungsbetrag=.bruchteile(.multiplizieren(zahlung,quote)))
 eingaben <- list(vereinbarter_abschnittspreis=vereinbarter_abschnittspreis, gezahlter_abschnittspreis=gezahlter_abschnittspreis, zeiteinheiten_gesamt=zeiteinheiten_gesamt, zeiteinheiten_mangelhaft=zeiteinheiten_mangelhaft, zeiteinheiten_nicht_mehr_zu_erbringen=zeiteinheiten_nicht_mehr_zu_erbringen, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR_und_quote","BGB_DIGITALBEENDIGUNG_ZEITANTEILIGE_BETRAEGE",eingaben,list(list(operation="Disjunkte mangelhafte und k\u00fcnftig entfallende Zeiteinheiten addieren; durch Gesamtzeit teilen; Abschnittspreis und proportional zugeordneten Zahlungsbetrag mit Quote multiplizieren.")),eingaben)
 ergebnis$hinweise <- list("Nur wirksame Beendigung dauerhafter digitaler Bereitstellung nach \u00a7327o Absatz2/3. Ein homogen bepreister Abschnitt mit proportional \u00fcber dessen Zeit verteilter Zahlung. Mangelhafte Zeit nur bereits erbrachte Leistungen, zuk\u00fcnftige Zeit nur nicht mehr geschuldete Leistungen; disjunkt, vollst\u00e4ndig qualifiziert. Ungleich bepreiste oder anders bezahlte Zeitbereiche getrennt rechnen; \u00fcberlappende Mangelintervalle zuvor vereinigen. Keine automatische Mangelbeurteilung, Vertragsbeendigung, Zahlungszuordnung, Berechnung von Wertersatz oder Frist. Ergebnis erloschener_preisanteil ist gesamter entfallener Preis einschlie\u00dflich bereits bezahlten Teils, keine zus\u00e4tzliche offene Forderung. \u00dcberzahlungen \u00fcber Abschnittspreis gesondert behandeln.")
 ergebnis
}
