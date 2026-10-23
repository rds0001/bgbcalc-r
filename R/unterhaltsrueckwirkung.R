unterhalt_rueckwirkungsbeginn <- function(auskunftsaufforderung_am=NULL,verzug_am=NULL,rechtshaengigkeit_am=NULL,anspruchsbeginn_am=NULL,anlassnachweis=NULL) {
  anspruch <- .datum(anspruchsbeginn_am,"anspruchsbeginn_am")
  werte <- list(auskunftsaufforderung_am=auskunftsaufforderung_am,verzug_am=verzug_am,rechtshaengigkeit_am=rechtshaengigkeit_am)
  ereignisse <- list()
  for (name in names(werte)) if (!is.null(werte[[name]])) ereignisse[[length(ereignisse)+1]] <- .datum(werte[[name]],name)
  if (!length(ereignisse)) .fehler("anlass","Mindestens ein rechtlich qualifizierter Anlass nach\u00a71613I erforderlich.","EINGABE_FEHLT")
  .text(anlassnachweis,"anlassnachweis")
  fruehester <- ereignisse[[1]]
  for (ereignis in ereignisse) if (ereignis < fruehester) fruehester <- ereignis
  monatsanfang <- .datum(paste0(substr(.iso(fruehester),1,7),"-01"),"monatsanfang")
  beginn <- if (anspruch <= monatsanfang) monatsanfang else max(fruehester,anspruch)
  eingaben <- list(auskunftsaufforderung_am=auskunftsaufforderung_am,verzug_am=verzug_am,rechtshaengigkeit_am=rechtshaengigkeit_am,anspruchsbeginn_am=anspruchsbeginn_am,anlassnachweis=anlassnachweis)
  ergebnis <- .ergebnis(list(fruehester_qualifizierter_anlass=.iso(fruehester),anlassmonatsanfang=.iso(monatsanfang),rueckwirkungsbeginn=.iso(beginn)),"daten","BGB_UNTERHALT_RUECKWIRKUNGSBEGINN",eingaben,list(list(operation="Fr\u00fchesten qualifizierten Anlass w\u00e4hlen; bei bereits am Monatsanfang bestehendem Anspruch auf diesen zur\u00fcckgehen, sonst fr\u00fchestens Anlass und Anspruchsbeginn.")),eingaben)
  ergebnis$hinweise <- list("\u00a71613I f\u00fcr ein rechtlich abgegrenztes durchgehend bestehendes Unterhaltsverh\u00e4ltnis. Nur f\u00fcr Geltendmachung dieses Unterhalts wirksame Auskunftsaufforderung, wirksamen Verzug oder Rechtsh\u00e4ngigkeit eingeben; unwirksame oder anders zugeordnete Ereignisse nicht eintragen. Anspruchsbeginn ist qualifizierter Beginn des dem Grunde nach bestehenden Anspruchs, nicht Beginn blo\u00df einer sp\u00e4teren Betrags\u00e4nderung. Besteht er am ersten Tag des Monats des fr\u00fchesten Ereignisses, gilt dieser Monatsanfang; andernfalls keine pauschale R\u00fcckverlagerung auf Anspruchsentstehung vor dem Anlass. Ein rechtlich bereits vor Anspruchsbeginn wirksamer Anlass kann keinen Unterhalt vor Anspruchsentstehung erzeugen. Anspruchsunterbrechungen oder wechselnde Unterhaltsverh\u00e4ltnisse getrennt berechnen. Sonderbedarf/Hinderungsf\u00e4lle nachAbsatz2, H\u00e4rteregelAbsatz3, Erf\u00fcllung und Betragsh\u00f6he nicht berechnet.")
  ergebnis
}
