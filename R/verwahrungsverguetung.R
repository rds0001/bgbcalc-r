verwahrung_vorzeitige_teilverguetung <- function(gesamtverguetung=NULL, leistungsanteil_zaehler=NULL, leistungsanteil_nenner=NULL, leistungsstandsnachweis=NULL) {
 anteilig <- .teilbetrag(gesamtverguetung,leistungsanteil_zaehler,leistungsanteil_nenner)
 .text(leistungsstandsnachweis,"leistungsstandsnachweis")
 eingaben <- list(gesamtverguetung=gesamtverguetung, leistungsanteil_zaehler=leistungsanteil_zaehler, leistungsanteil_nenner=leistungsanteil_nenner, leistungsstandsnachweis=leistungsstandsnachweis)
 ergebnis <- .geld_ergebnis(anteilig,"BGB_VERWAHRUNG_VORZEITIGE_TEILVERGUETUNG",eingaben,list(list(operation="Gesamtverg\u00fctung der vorzeitig beendeten Aufbewahrung mit dem bewerteten Anteil der bis zur Beendigung erbrachten Leistungen multiplizieren.")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("\u00a7699II: vorzeitiges Aufbewahrungsende ohne abweichende Verg\u00fctungsvereinbarung. Teilbetrag entspricht rechtlich bewerteter bisheriger Leistung; keine ungepr\u00fcfte Tagesquote. Keine volle Verg\u00fctung nicht erbrachter Leistungen. Bereits geleistete Verg\u00fctung, Aufwendungsersatz und Zinsen bei Eigennutzung698 separat abrechnen; keine automatische Aufrechnung."))
 ergebnis
}
