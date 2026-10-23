
gastschulaufenthalt_kuendigungsbetrag <- function(vereinbarter_reisepreis=NULL, ersparte_aufwendungen=NULL, notwendige_mehrkosten=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(vereinbarter_reisepreis), .geld(ersparte_aufwendungen), .geld(notwendige_mehrkosten))
 .text(einordnungsnachweis,"einordnungsnachweis")
 if(.vergleichen(werte[[2]],werte[[1]])>0) .fehler("ersparte_aufwendungen","Ersparte Aufwendungen d\u00fcrfen in diesem Modell den vereinbarten Reisepreis nicht \u00fcbersteigen.")
 eingaben <- list(vereinbarter_reisepreis=vereinbarter_reisepreis, ersparte_aufwendungen=ersparte_aufwendungen, notwendige_mehrkosten=notwendige_mehrkosten, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(.addieren(.subtrahieren(werte[[1]],werte[[2]]),werte[[3]]), "BGB_GASTSCHULAUFENTHALT_KUENDIGUNGSBETRAG", eingaben,list(list(operation="Vereinbarten Reisepreis um ersparte Aufwendungen mindern und notwendige Mehrkosten hinzuf\u00fcgen.")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("Nur \u00a7651uIV au\u00dferhalb einer K\u00fcndigung nach \u00a7651l. Ersparnis und notwendige Mehrkosten rechtlich bewerten, ohne doppelte Kostenpositionen. Ergebnis ist der Anspruch vor bereits geleisteten Zahlungen, kein automatischer Zahlungssaldo. Bei Ersparnis \u00fcber dem Preis ist dieser abgegrenzte Fall nicht modelliert; keine erfundene negative Preisforderung."))
 ergebnis
}

pauschalreise_ereignisentschaedigung_anrechnen <- function(anspruch_vor_anrechnung=NULL, bereits_erhaltene_ereignisentschaedigung=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(anspruch_vor_anrechnung), .geld(bereits_erhaltene_ereignisentschaedigung))
 .text(einordnungsnachweis,"einordnungsnachweis")
 eingaben <- list(anspruch_vor_anrechnung=anspruch_vor_anrechnung, bereits_erhaltene_ereignisentschaedigung=bereits_erhaltene_ereignisentschaedigung, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(if(.vergleichen(werte[[1]],werte[[2]])>0) .subtrahieren(werte[[1]],werte[[2]]) else .bruch(0), "BGB_PAUSCHALREISE_EREIGNISENTSCHAEDIGUNG_ANRECHNEN", eingaben,list(list(operation="Bereits erhaltene anrechenbare Ereignisentsch\u00e4digung vom Anspruch abziehen, mindestens null.")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("\u00a7651pIII in einer ausdr\u00fccklich vorqualifizierten Anrechnungsrichtung. Externe Verordnungen/\u00dcbereink\u00fcnfte liefern den bewerteten Anspruch und die anrechenbare bereits erhaltene Zahlung; deren Berechnung wird hier nicht erfunden. Mehrere Anspruchspositionen vorab \u00fcberschneidungsfrei zuordnen; dieselbe Entsch\u00e4digung nicht mehrfach abziehen. \u00dcberschie\u00dfende Entsch\u00e4digung begr\u00fcndet hier keinen R\u00fcckzahlungsanspruch."))
 ergebnis
}
