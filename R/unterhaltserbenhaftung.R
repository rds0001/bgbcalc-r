unterhalt_erbenhaftungsbetrag <- function(hypothetischer_pflichtteil=NULL,angerechnete_erbenleistungen=NULL,offener_unterhalt=NULL,haftungsnachweis=NULL) {
  grenze <- .geld(hypothetischer_pflichtteil);geleistet <- .geld(angerechnete_erbenleistungen);offen <- .geld(offener_unterhalt)
  .text(haftungsnachweis,"haftungsnachweis")
  restgrenze <- .subtrahieren(grenze,geleistet)
  if (.vergleichen(restgrenze,.bruch(0))<0) restgrenze <- .bruch(0)
  gedeckt <- if (.vergleichen(offen,restgrenze)<=0) offen else restgrenze
  eingaben <- list(hypothetischer_pflichtteil=hypothetischer_pflichtteil,angerechnete_erbenleistungen=angerechnete_erbenleistungen,offener_unterhalt=offener_unterhalt,haftungsnachweis=haftungsnachweis)
  wert <- lapply(list(verbleibende_haftungsgrenze=restgrenze,haftungsbegrenzter_unterhaltsbetrag=gedeckt,nicht_von_dieser_haftung_gedeckt=.subtrahieren(offen,gedeckt),haftungsrest_nach_forderung=.subtrahieren(restgrenze,gedeckt)),.bruchteile)
  ergebnis <- .ergebnis(wert,"EUR","BGB_UNTERHALT_ERBENHAFTUNGSBETRAG",eingaben,list(list(operation="Hypothetischen Pflichtteil um angerechnete Erbenleistungen vermindern, Rest mindestens null; offene Unterhaltsforderung h\u00f6chstens bis zur verbleibenden Grenze ber\u00fccksichtigen.")),eingaben)
  ergebnis$hinweise <- list("\u00a71586b: ein qualifiziertes Unterhaltsverh\u00e4ltnis nach Tod des Verpflichteten. Hypothetischer Pflichtteil bei fortbestehend gedachter Ehe bewertet; g\u00fcterstandsbedingte Besonderheiten nachAbsatz2 au\u00dfer Betracht lassen. Keine erneute hypothetische Nachlass-/Pflichtteilsbewertung oder Pr\u00fcfung von Pflichtteilserg\u00e4nzung. Angerechnete Erbenleistungen sind nur rechtlich auf diese gemeinsame Grenze anzurechnende Leistungen, keine ungepr\u00fcften Unterhaltszahlungen des Erblassers zu Lebzeiten. Mehrere Erben haben keine vervielfachte Grenze; alle einschl\u00e4gigen Leistungen konsolidiert vorgeben, interne Erbenverteilung au\u00dferhalb. \u00a71581-Beschr\u00e4nkungen des verstorbenen Verpflichteten nicht fortschreiben. Offene Forderung bereits nach \u00fcbrigen Unterhaltsregeln bestimmt; weitere gegenst\u00e4ndliche Nachlasshaftungsbeschr\u00e4nkungen gesondert. \u00dcbersteigende Vorleistungen f\u00fchren zu Restgrenze0, keinem automatisch festgestellten R\u00fcckzahlungsanspruch.")
  ergebnis
}
