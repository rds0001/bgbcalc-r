gesamtgut_anteilsherabsetzung_halbgrenze <- function(ungekuerzter_anteilswert=NULL, angeordneter_anteilswert=NULL, einordnungsnachweis=NULL) {
 voll <- .geld(ungekuerzter_anteilswert);neu <- .geld(angeordneter_anteilswert);.text(einordnungsnachweis,'einordnungsnachweis')
 if(.vergleichen(neu,voll)>0) .fehler('angeordneter_anteilswert','Herabsetzung kann urspr\u00fcnglichen Anteil nicht erh\u00f6hen.')
 haelfte <- .multiplizieren(voll,.bruch(1,2));unter <- .vergleichen(neu,haelfte)<0
 wert <- list(halbe_anteilsuntergrenze=.bruchteile(haelfte),angeordneter_minderungsbetrag=.bruchteile(.subtrahieren(voll,neu)),halbgrenze_eingehalten=!unter,unterschreitungsbetrag=.bruchteile(if(unter) .subtrahieren(haelfte,neu) else .geld('0')))
 eingaben <- list(ungekuerzter_anteilswert=ungekuerzter_anteilswert, angeordneter_anteilswert=angeordneter_anteilswert, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR_und_wahrheitswert","BGB_GESAMTGUT_ANTEILSHERABSETZUNG_HALBGRENZE",eingaben,list(list(operation="H\u00e4lfte des ungek\u00fcrzten Gesamtgutsanteils berechnen, angeordnete Herabsetzung und Unterschreitung dieser Grenze ausweisen.")),eingaben)
 ergebnis$hinweise <- list("\u00a71512: ungek\u00fcrzten geb\u00fchrenden Anteil halbieren und angeordneten Wert mit dieser Untergrenze vergleichen. Angeordnete Minderung und positive Grenzunterschreitung getrennt ausweisen. Keine automatische Anhebung einer unwirksamen Anordnung, keine Verm\u00f6gensbewertung oder Verteilung des freiwerdenden Anteils auf andere Beteiligte. Pflichtteil, Ausschluss1511, Erb-/Gesamtgutsquote und Wirksamkeit der Verf\u00fcgung gesondert.")
 ergebnis
}
gesamtgut_landgut_uebernahmepreisgrenze <- function(qualifizierter_ertragswert=NULL, angeordneter_uebernahmepreis=NULL, einordnungsnachweis=NULL) {
 ertrag <- .geld(qualifizierter_ertragswert);preis <- .geld(angeordneter_uebernahmepreis);.text(einordnungsnachweis,'einordnungsnachweis')
 unter <- .vergleichen(preis,ertrag)<0
 wert <- list(ertragswertgrenze_eingehalten=!unter,unterschreitungsbetrag=.bruchteile(if(unter) .subtrahieren(ertrag,preis) else .geld('0')))
 eingaben <- list(qualifizierter_ertragswert=qualifizierter_ertragswert, angeordneter_uebernahmepreis=angeordneter_uebernahmepreis, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR_und_wahrheitswert","BGB_GESAMTGUT_LANDGUT_UEBERNAHMEPREISGRENZE",eingaben,list(list(operation="Angeordneten Landgut-\u00dcbernahmepreis mit qualifiziertem Ertragswert als Untergrenze vergleichen.")),eingaben)
 ergebnis$hinweise <- list("\u00a71515II/III: angeordneten Landgut-\u00dcbernahmepreis mit qualifiziertem Ertragswert vergleichen; Gleichheit erreicht die Untergrenze. Ertragswert selbst ist Bewertungsinput nach2049, keine erfundene Kapitalisierungsformel. Keine automatische Anhebung eines unzul\u00e4ssigen Preises, keine Entscheidung \u00fcber Testamentswirksamkeit, \u00dcbernahmeberechtigung oder Ausgleichszahlungsverteilung.")
 ergebnis
}
