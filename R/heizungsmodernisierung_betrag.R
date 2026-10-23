
heizungsmodernisierung_gefoerderter_betrag <- function(kosten_wohnung=NULL, von_erhaltungspauschale_ausgenommene_kosten=NULL, abzuziehende_drittmittel=NULL, monatliche_restkappungsgrenze=NULL, einordnungsnachweis=NULL) {
 kosten <- .geld(kosten_wohnung); ausgenommen <- .geld(von_erhaltungspauschale_ausgenommene_kosten); drittmittel <- .geld(abzuziehende_drittmittel); kappung <- .geld(monatliche_restkappungsgrenze)
 .text(einordnungsnachweis,"einordnungsnachweis")
 if(.vergleichen(ausgenommen,kosten)>0) .fehler("von_erhaltungspauschale_ausgenommene_kosten","Ausgenommener Teil darf Gesamtkosten nicht \u00fcbersteigen.")
 if(.vergleichen(drittmittel,.bruch(0))<=0 || .vergleichen(drittmittel,kosten)>0) .fehler("abzuziehende_drittmittel","Positive kostenmindernde Drittmittel h\u00f6chstens in H\u00f6he der Kosten erforderlich.")
 pauschale <- .multiplizieren(.subtrahieren(kosten,ausgenommen),.bruch(3,20))
 basis <- .subtrahieren(.subtrahieren(kosten,pauschale),drittmittel)
 if(.vergleichen(basis,.bruch(0))<0) basis <- .bruch(0)
 jahr <- .multiplizieren(basis,.bruch(1,10))
 monat <- .multiplizieren(jahr,.bruch(1,12))
 begrenzt <- if(.vergleichen(monat,kappung)<0) monat else kappung
 wert <- list(erhaltungspauschale=.bruchteile(pauschale),kostenbasis=.bruchteile(basis),jahresbetrag_vor_kappung=.bruchteile(jahr),monatsbetrag_vor_kappung=.bruchteile(monat),gekappter_monatsbetrag=.bruchteile(begrenzt))
 eingaben <- list(kosten_wohnung=kosten_wohnung, von_erhaltungspauschale_ausgenommene_kosten=von_erhaltungspauschale_ausgenommene_kosten, abzuziehende_drittmittel=abzuziehende_drittmittel, monatliche_restkappungsgrenze=monatliche_restkappungsgrenze, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR","BGB_HEIZUNGSMODERNISIERUNG_GEFOERDERTER_BETRAG",eingaben,list(list(operation="15 Prozent des nicht ausgenommenen Kostenanteils abziehen, danach qualifizierte Drittmittel abziehen und bei null begrenzen; zehn Prozent j\u00e4hrlich, durch zw\u00f6lf teilen und auf vorab bestimmte monatliche Restkappungsgrenze begrenzen.")),eingaben)
 ergebnis$hinweise <- list("Nur \u00a7559e mit tats\u00e4chlich in Anspruch genommenen, einmaligen kostenmindernden Drittmitteln als positivem Betrag. Kosten bereits nach \u00a7559 Absatz3 der Wohnung zugeordnet. Ausgenommenen Kostenanteil nach lokaler Fassung \u00a7559e Absatz2 Satz2 (Heizungsanlage im Sinne \u00a743 Geb\u00e4udemodernisierungsgesetz) ausdr\u00fccklich qualifizieren, andernfalls null. Keine automatische F\u00f6rderf\u00e4higkeit, Kostenverteilung, H\u00e4rtepr\u00fcfung oder Wirksamkeit. Restkappungsgrenze zuvor nach \u00a7559e Absatz3 rechtlich bestimmen, etwa mit modernisierung_kappungsgrenze; keine doppelte Anrechnung bisheriger Erh\u00f6hungen. F\u00e4lle laufender Zusch\u00fcsse, Darlehen und Zinsverg\u00fcnstigungen einschlie\u00dflich ihrer Reihenfolge zur Kappung bleiben au\u00dferhalb dieses Kapitalzuschussfalls. Ohne F\u00f6rderung gilt anderer Ansatz \u00a7559. Keine tats\u00e4chlichen Erhaltungskosten zus\u00e4tzlich zur Pauschale abziehen.")
 ergebnis
}
