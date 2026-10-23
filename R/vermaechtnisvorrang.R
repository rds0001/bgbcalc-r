vermaechtnis_vorrangverteilung <- function(verfuegbarer_beschwerungsbetrag=NULL,vorrangige_beschwerung=NULL,nachrangige_beschwerungen=NULL,vorrang_nach_2189_qualifiziert=NULL,bewertungsnachweis=NULL) {
 budget <- .geld(verfuegbarer_beschwerungsbetrag);vorrang <- .geld(vorrangige_beschwerung);nachrang <- .geld(nachrangige_beschwerungen)
 .wahrheitswert(vorrang_nach_2189_qualifiziert,'vorrang_nach_2189_qualifiziert');.text(bewertungsnachweis,'bewertungsnachweis')
 eingaben <- list(verfuegbarer_beschwerungsbetrag=verfuegbarer_beschwerungsbetrag,vorrangige_beschwerung=vorrangige_beschwerung,nachrangige_beschwerungen=nachrangige_beschwerungen,vorrang_nach_2189_qualifiziert=vorrang_nach_2189_qualifiziert,bewertungsnachweis=bewertungsnachweis)
 wert <- NULL
 if(vorrang_nach_2189_qualifiziert) {
  vor <- if(.vergleichen(budget,vorrang)<0) budget else vorrang
  rest <- .subtrahieren(budget,vor);nach <- if(.vergleichen(rest,nachrang)<0) rest else nachrang
  wert <- list(vorrangiger_zuteilungsbetrag=.bruchteile(vor),nachrangiger_zuteilungsbetrag=.bruchteile(nach),vorrangiger_kuerzungsbetrag=.bruchteile(.subtrahieren(vorrang,vor)),nachrangiger_kuerzungsbetrag=.bruchteile(.subtrahieren(nachrang,nach)),nicht_verbrauchtes_budget=.bruchteile(.subtrahieren(budget,.addieren(vor,nach))))
 }
 ergebnis <- .ergebnis(wert,'EUR','BGB_VERMAECHTNIS_VORRANGVERTEILUNG',eingaben,list(list(operation='Vorrang bis Budget und vollem Beschwerungswert bedienen; verbleibendes Budget bis vollem Nachrangwert; K\u00fcrzungen als Wertdifferenzen')),eingaben)
 ergebnis$status <- if(!is.null(wert)) 'BERECHNET' else 'NICHT_ANWENDBAR'
 ergebnis$annahmen <- list("Wirksame Vorranganordnung2189 und zul\u00e4ssiger K\u00fcrzungsfall rechtlich vorgepr\u00fcft; ein vorrangiger Beschwerungsblock vor s\u00e4mtlichen \u00fcbrigen Beschwerungen.")
 ergebnis$hinweise <- list("Beschwerungen sind Verm\u00e4chtnisse/Auflagen auf gleicher rechtlich qualifizierter Wertgrundlage. Verf\u00fcgbares Budget muss f\u00fcr diese Beschwerungen bereits aus einschl\u00e4giger Haftungsbeschr\u00e4nkung, Pflichtteil oder2187/2188 ermittelt sein, nicht unbesehen gesamter Nachlass oder Verm\u00e4chtniswert. Nachrang wird nur insgesamt ausgewiesen; keine unbelegte Quotierung innerhalb desselben Rangs oder Automatik mehrerer Vorrangstufen. Keine Berechnung der vorgelagerten K\u00fcrzungsgrundlage und keine Feststellung sofortiger Geldzahlungspflichten bei Sachverm\u00e4chtnissen. Budget\u00fcberschuss erweitert keinen Beschwerungsanspruch.")
 ergebnis
}
