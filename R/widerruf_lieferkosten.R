widerruf_rueckzahlung_lieferkosten <- function(empfangene_warenzahlung=NULL, gezahlte_lieferkosten=NULL, abweichende_lieferart_gewaehlt=NULL, guenstigste_standardlieferkosten=NULL, einordnungsnachweis=NULL) {
 waren <- .geld(empfangene_warenzahlung);lieferung <- .geld(gezahlte_lieferkosten)
 .wahrheitswert(abweichende_lieferart_gewaehlt,'abweichende_lieferart_gewaehlt')
 if(abweichende_lieferart_gewaehlt) {
  standard <- .geld(guenstigste_standardlieferkosten)
  erstattbare_lieferung <- if(.vergleichen(lieferung,standard)<=0) lieferung else standard
 } else {
  if(!is.null(guenstigste_standardlieferkosten)) .fehler('guenstigste_standardlieferkosten','Ohne gew\u00e4hlte abweichende Lieferart keine Standardkostengrenze einsetzen.')
  erstattbare_lieferung <- lieferung
 }
 .text(einordnungsnachweis,'einordnungsnachweis')
 wert <- list(rueckzahlbare_lieferkosten=.bruchteile(erstattbare_lieferung),ausgeschlossene_liefermehrkosten=.bruchteile(.subtrahieren(lieferung,erstattbare_lieferung)),rueckzahlungsgrundbetrag=.bruchteile(.addieren(waren,erstattbare_lieferung)))
 eingaben <- list(empfangene_warenzahlung=empfangene_warenzahlung, gezahlte_lieferkosten=gezahlte_lieferkosten, abweichende_lieferart_gewaehlt=abweichende_lieferart_gewaehlt, guenstigste_standardlieferkosten=guenstigste_standardlieferkosten, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR","BGB_WIDERRUF_RUECKZAHLUNG_LIEFERKOSTEN",eingaben,list(list(operation="Empfangene Warenzahlung und erstattungsf\u00e4hige Lieferkosten addieren; bei gew\u00e4hlter abweichender Lieferung nur zus\u00e4tzliche Liefermehrkosten ausschlie\u00dfen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7357I/II: grunds\u00e4tzlich auch Lieferzahlungen zur\u00fcckgew\u00e4hren. Nur zus\u00e4tzliche Kosten infolge gew\u00e4hlter abweichender Lieferart ausschlie\u00dfen; ohne diesen Tatbestand tats\u00e4chliche Lieferzahlung vollst\u00e4ndig ber\u00fccksichtigen. Standardvergleich auf denselben widerrufenen Lieferumfang beziehen, keine pauschale Zuordnung bei Teilwiderruf oder mehreren Warenk\u00f6rben. R\u00fccksendekosten357V/VI/VII, Wertersatz357a, m\u00f6gliche Zahlungsverweigerung357IV, R\u00fcckzahlungsweg357III und Frist getrennt behandeln. Grundbetrag vor weiteren rechtlich zul\u00e4ssigen Anrechnungen; keine automatische Saldierung oder zus\u00e4tzliche R\u00fcckabwicklungsgeb\u00fchr.")
 ergebnis
}
