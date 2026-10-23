verein_austrittskalender <- function(kuendigungszugang_am=NULL, fristdauer=NULL, fristeinheit=NULL, nur_zum_geschaeftsjahresende=NULL, geschaeftsjahresenden=NULL, satzungsnachweis=NULL) {
 zugang <- .datum(kuendigungszugang_am,'kuendigungszugang_am')
 anzahl <- .ganzzahl(fristdauer,'fristdauer',0,3652059)
 .auswahl(fristeinheit,'fristeinheit',c('tage','wochen','monate','jahre'))
 .wahrheitswert(nur_zum_geschaeftsjahresende,'nur_zum_geschaeftsjahresende');.text(satzungsnachweis,'satzungsnachweis')
 grenze <- .frist(.iso(zugang),2,'jahre','ereignis')
 frist <- if(anzahl==0) zugang else .frist(.iso(zugang),anzahl,fristeinheit,'ereignis')
 termin <- frist
 if(nur_zum_geschaeftsjahresende) {
  .vorhanden(geschaeftsjahresenden,'geschaeftsjahresenden')
  if(!is.list(geschaeftsjahresenden)||!is.null(names(geschaeftsjahresenden))||length(geschaeftsjahresenden)<1||length(geschaeftsjahresenden)>1000) .fehler('geschaeftsjahresenden','Geordnete Liste mit1bis1000 Gesch\u00e4ftsjahresenden erforderlich.')
  enden <- vapply(geschaeftsjahresenden,function(t) as.numeric(.datum(t,'geschaeftsjahresenden')),numeric(1))
  if(any(enden<as.numeric(zugang))||any(diff(enden)<=0)) .fehler('geschaeftsjahresenden','Gesch\u00e4ftsjahresenden streng aufsteigend ab Zugang vorgeben.')
  kandidaten <- enden[enden>=as.numeric(frist)]
  if(!length(kandidaten)) .fehler('geschaeftsjahresenden','Kalender deckt den ben\u00f6tigten Austrittstermin nicht ab.')
  termin <- as.Date(kandidaten[[1]],origin='1970-01-01')
 } else if(!is.null(geschaeftsjahresenden)) .fehler('geschaeftsjahresenden','Ohne Gesch\u00e4ftsjahresbindung ausdr\u00fccklich null.')
 wert <- list(rechnerisches_kuendigungsfristende=.iso(frist),rechnerischer_austrittstermin=.iso(termin),zweijahresgrenze=.iso(grenze),kuendigungsfrist_innerhalb_zweijahresgrenze=frist<=grenze,austrittstermin_innerhalb_zweijahresgrenze=termin<=grenze)
 eingaben <- list(kuendigungszugang_am=kuendigungszugang_am, fristdauer=fristdauer, fristeinheit=fristeinheit, nur_zum_geschaeftsjahresende=nur_zum_geschaeftsjahresende, geschaeftsjahresenden=geschaeftsjahresenden, satzungsnachweis=satzungsnachweis)
 ergebnis <- .ergebnis(wert,"daten_und_wahrheitswerte","BGB_VEREIN_AUSTRITTSKALENDER",eingaben,list(list(operation="Ereignisfrist und Zweijahresgrenze kalendergenau berechnen; gegebenenfalls erstes einschl\u00e4giges Gesch\u00e4ftsjahresende ab Fristende ausw\u00e4hlen und beide Termine getrennt mit der Zweijahresgrenze vergleichen.")),eingaben)
 ergebnis$hinweise <- list("\u00a739II: rechnerischer Vergleich einer satzungsm\u00e4\u00dfig vorgegebenen K\u00fcndigungsfrist mit h\u00f6chstens zwei Kalenderjahren sowie Auswahl des n\u00e4chsten einschl\u00e4gigen Gesch\u00e4ftsjahresendes. Fristdauer0 bedeutet keine zus\u00e4tzliche K\u00fcndigungsfrist. Gesch\u00e4ftsjahr und gegebenenfalls Kombination beider Satzungsbedingungen rechtlich vorqualifizieren; keine automatische Satzungsauslegung. Die beiden Zweijahresvergleiche betreffen getrennt die K\u00fcndigungsfrist und den resultierenden Kalendertermin. Eine \u00dcberschreitung wird sichtbar gemacht, nicht durch eine erfundene geltungserhaltende Reduktion geheilt; keine automatische Wirksamkeitsentscheidung f\u00fcr die Satzung oder den Austritt. Alle einschl\u00e4gigen Gesch\u00e4ftsjahresenden ab Zugang bis zum ben\u00f6tigten Termin vollst\u00e4ndig und geordnet vorgeben. Keine automatische193-Verschiebung eines Gesch\u00e4ftsjahresendes. Die Zweijahresgrenze wird kalendergenau berechnet, nicht pauschal als730Tage.")
 ergebnis
}
