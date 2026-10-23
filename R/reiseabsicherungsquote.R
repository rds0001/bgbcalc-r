
pauschalreise_absicherungsanteil <- function(eigener_leistungsanspruch=NULL, gesamtleistungsansprueche=NULL, jahresumsatz_veranstalter=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(eigener_leistungsanspruch), .geld(gesamtleistungsansprueche), .geld(jahresumsatz_veranstalter))
 .text(einordnungsnachweis,"einordnungsnachweis")
 if(.vergleichen(werte[[1]],werte[[2]])>0) .fehler("gesamtleistungsansprueche","Gesamtanspr\u00fcche m\u00fcssen mindestens dem Einzelanspruch entsprechen.")
 if(.vergleichen(werte[[3]],.bruch(3000000))>=0) .fehler("jahresumsatz_veranstalter","Dieser Deckelfall verlangt Vorjahresumsatz unter drei Millionen EUR.")
 eingaben <- list(eigener_leistungsanspruch=eigener_leistungsanspruch, gesamtleistungsansprueche=gesamtleistungsansprueche, jahresumsatz_veranstalter=jahresumsatz_veranstalter, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(if(.vergleichen(werte[[2]],.bruch(0))==0) .bruch(0) else .multiplizieren(werte[[1]],if(.vergleichen(werte[[2]],.bruch(1000000))<=0) .bruch(1) else .dividieren(.bruch(1000000),werte[[2]])), "BGB_PAUSCHALREISE_ABSICHERUNGSANTEIL", eingaben, list(list(operation="Im qualifiziert vereinbarten Ein-Million-Euro-Deckelfall Einzelanspruch mit min(1, eine Million Euro geteilt durch Gesamtleistungsanspr\u00fcche) multiplizieren")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("Nur \u00a7651r Absatz3 Satz3/4: qualifiziert wirksam vereinbarte Begrenzung auf genau eine Million EUR je Insolvenz bei Versicherer oder Kreditinstitut nach Absatz2 Satz2 und Vorjahresumsatz strikt unter drei Millionen EUR. Kein Deckel f\u00fcr Reisesicherungsfonds; gr\u00f6\u00dfere freiwillige Deckungsgrenzen separat qualifizieren. Eigener und Gesamtanspruch betreffen denselben vollst\u00e4ndigen Insolvenz-Leistungskreis nach Absatz1, nicht nur die gerade bekannten Anmeldungen; keine Doppelz\u00e4hlung. Gesamtanspruch mindestens Einzelanspruch. Null Gesamtanspr\u00fcche ergeben null. Keine Bestimmung des versicherten Schadens oder Pr\u00fcfung der Insolvenz."))
 ergebnis
}
