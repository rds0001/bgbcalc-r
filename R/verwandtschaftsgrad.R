verwandtschaftsgrad_geburtsschritte <- function(geburtsschritte_person=NULL,geburtsschritte_andere=NULL,abstammungsnachweis=NULL) {
  erster <- .ganzzahl(geburtsschritte_person,"geburtsschritte_person",0,1000)
  zweiter <- .ganzzahl(geburtsschritte_andere,"geburtsschritte_andere",0,1000)
  .text(abstammungsnachweis,"abstammungsnachweis")
  if (erster+zweiter==0) .fehler("geburtsschritte_person","Mindestens ein vermittelnder Geburtsschritt zwischen verschiedenen Personen erforderlich.")
  eingaben <- list(geburtsschritte_person=geburtsschritte_person,geburtsschritte_andere=geburtsschritte_andere,abstammungsnachweis=abstammungsnachweis)
  ergebnis <- .ergebnis(erster+zweiter,"grad","BGB_VERWANDTSCHAFTSGRAD_GEBURTSSCHRITTE",eingaben,list(list(operation="Qualifizierte Geburtsschritte beider Personen zum n\u00e4chsten gemeinsamen Stamm addieren.")),eingaben)
  ergebnis$hinweise <- list("\u00a71589I3 z\u00e4hlt die vermittelnden Geburten. Gerade Linie: eine Person ist Vorfahr der anderen, deren eigener Weg zum gemeinsamen Stamm daher0. Seitenlinie: Wege beider Personen zum n\u00e4chsten gemeinsamen Vorfahren, etwa Geschwister1+1=2 oder Cousins2+2=4. Keine automatische Stammbauermittlung oder rechtliche Abstammungs-/Adoptionspr\u00fcfung. Entfernteren gemeinsamen Vorfahren nicht w\u00e4hlen, wenn ein n\u00e4herer existiert. Nach\u00a71590I2 wird derselbe qualifizierte Grad f\u00fcr die vermittelnde Verwandtschaft \u00fcbernommen; Ehe selbst f\u00fcgt keinen Geburtsschritt hinzu. Die Funktion stellt keine Verwandtschaft oder Schw\u00e4gerschaft fest.")
  ergebnis
}
