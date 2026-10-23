architekten_sonderkuendigung_verguetung <- function(gesamtverguetung=NULL, leistungsanteil_zaehler=NULL, leistungsanteil_nenner=NULL, leistungsstandsnachweis=NULL) {
 anteilig <- .teilbetrag(gesamtverguetung,leistungsanteil_zaehler,leistungsanteil_nenner)
 .text(leistungsstandsnachweis,"leistungsstandsnachweis")
 eingaben <- list(gesamtverguetung=gesamtverguetung, leistungsanteil_zaehler=leistungsanteil_zaehler, leistungsanteil_nenner=leistungsanteil_nenner, leistungsstandsnachweis=leistungsstandsnachweis)
 ergebnis <- .geld_ergebnis(anteilig,"BGB_ARCHITEKTEN_SONDERKUENDIGUNG_VERGUETUNG",eingaben,list(list(operation="Gesamtverg\u00fctung des gek\u00fcndigten Umfangs mit dem bewerteten Anteil der bis zur K\u00fcndigung erbrachten Leistungen multiplizieren.")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("\u00a7650rIII bei wirksamer Sonderk\u00fcndigung nachAbsatz1 oder2. Keine Gleichsetzung mit einer K\u00fcndigung aus wichtigem Grund648a und keine F\u00fcnfprozentvermutung648. Vertragsverg\u00fctung und Leistungsanteil einschlie\u00dflich eines etwaigen besonderen Verg\u00fctungsrechts vorqualifizieren; keine HOAI-Berechnung. Keine Verg\u00fctung nicht erbrachter Leistungen; bereits geleistete Zahlungen und gesonderte Anspr\u00fcche separat abrechnen."))
 ergebnis
}
