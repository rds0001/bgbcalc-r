mietpreisbegrenzung_vormiete_bereinigen <- function(letzte_geschuldete_monatsmiete=NULL, minderungsbetrag=NULL, auszunehmende_erhoehungsbetraege=NULL, bereinigungsnachweis=NULL) {
 .text(bereinigungsnachweis,'bereinigungsnachweis');.vorhanden(auszunehmende_erhoehungsbetraege,'auszunehmende_erhoehungsbetraege')
 if(!is.list(auszunehmende_erhoehungsbetraege)||!is.null(names(auszunehmende_erhoehungsbetraege))||length(auszunehmende_erhoehungsbetraege)>1000) .fehler('auszunehmende_erhoehungsbetraege','Liste mit h\u00f6chstens1000Betr\u00e4gen erforderlich.')
 u <- .addieren(.geld(letzte_geschuldete_monatsmiete),.geld(minderungsbetrag));s <- .bruch(0)
 for(v in auszunehmende_erhoehungsbetraege) s <- .addieren(s,.geld(v))
 if(.vergleichen(s,u)>0) .fehler('auszunehmende_erhoehungsbetraege','Erh\u00f6hungsanteile \u00fcbersteigen ungeminderte Miete.')
 wert <- list(ungeminderte_monatsmiete=.bruchteile(u),ausgeschlossene_erhoehungssumme=.bruchteile(s),bereinigte_vormiete=.bruchteile(.subtrahieren(u,s)))
 eingaben <- list(letzte_geschuldete_monatsmiete=letzte_geschuldete_monatsmiete, minderungsbetrag=minderungsbetrag, auszunehmende_erhoehungsbetraege=auszunehmende_erhoehungsbetraege, bereinigungsnachweis=bereinigungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR","BGB_MIETPREISBEGRENZUNG_VORMIETE_BEREINIGEN",eingaben,list(list(operation="Minderungsbetrag hinzurechnen, ausgeschlossene Erh\u00f6hungsanteile summieren und abziehen.")),eingaben)
 ergebnis$hinweise <- list("556eI2: zun\u00e4chst Minderung aus letzter geschuldeter Monatsmiete herausrechnen, dann Summe der rechtlich ausgeschlossenen Erh\u00f6hungsanteile abziehen. Das Ergebnis ist Eingabe f\u00fcr vorhandenen Vormietgrenzenkern. Erh\u00f6hungsanteile nach tats\u00e4chlicher Wirkung in der ungeminderten letzten Miete bestimmen; verkettete Prozent\u00e4nderungen oder sp\u00e4ter aufgehobene Erh\u00f6hungen nicht doppelt z\u00e4hlen. Rechtswirksamkeit, zeitliche Einordnung ins letzte Jahr, Staffel-/Indexsonderf\u00e4lle und Nutzbarkeit nach556g sind vorqualifiziert. Keine automatische Vertragszeitreihenbewertung. Abz\u00fcge oberhalb ungeminderter Miete sind widerspr\u00fcchliche Eingaben und werden nicht still auf null gekappt.")
 ergebnis
}
mietpreisbegrenzung_modernisierungsalternative <- function(grund_oder_vormietgrenze=NULL, grundbetrag_ohne_modernisierung=NULL, modernisierung_monatlich=NULL, modernisierungsprivileg_nutzbar=NULL, einordnungsnachweis=NULL) {
 g <- .geld(grund_oder_vormietgrenze);a <- .geld(grundbetrag_ohne_modernisierung);m <- .geld(modernisierung_monatlich);ja <- .wahrheitswert(modernisierungsprivileg_nutzbar,'modernisierungsprivileg_nutzbar');.text(einordnungsnachweis,'einordnungsnachweis')
 alternative <- if(ja) .addieren(a,m) else NULL
 ergebnisbetrag <- if(ja && .vergleichen(alternative,g)>0) alternative else g
 wert <- list(modernisierungsweg_monatsgrenze=if(ja) .bruchteile(alternative) else NULL,nutzbare_monatsgrenze=.bruchteile(ergebnisbetrag))
 eingaben <- list(grund_oder_vormietgrenze=grund_oder_vormietgrenze, grundbetrag_ohne_modernisierung=grundbetrag_ohne_modernisierung, modernisierung_monatlich=modernisierung_monatlich, modernisierungsprivileg_nutzbar=modernisierungsprivileg_nutzbar, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR","BGB_MIETPREISBEGRENZUNG_MODERNISIERUNGSALTERNATIVE",eingaben,list(list(operation="Eigenst\u00e4ndigen Modernisierungsweg berechnen und bei rechtlicher Nutzbarkeit mit bisheriger Monatsgrenze vergleichen.")),eingaben)
 ergebnis$hinweise <- list("556eII-Alternativweg: Grundbetrag auf unmodernisierter Vergleichsmiete plus hypothetischer559/559a-Erh\u00f6hung; anschlie\u00dfend h\u00f6herer nutzbarer Betrag gegen\u00fcber eigenst\u00e4ndigem Grund-/Vormietweg. Niemals Modernisierungszuschlag zus\u00e4tzlich auf die Vormiete aufschlagen. Bei nicht nutzbarem Privileg bleibt nur bisheriger Weg; hypothetischer Alternativbetrag wird dann nicht ausgegeben. Keine doppelte Einbeziehung der Modernisierung in Vergleichsmiete und Zuschlag. Zeitliche Dreijahreszuordnung, Ma\u00dfnahmenqualifikation und556g-Auskunft sind rechtliche Eingaben. Die rechtliche F\u00f6rderabzugs-/Kappungsreihenfolge bleibt bei einschl\u00e4giger Konkurrenz ausdr\u00fccklich vorzugeben; kein neuer Standard daf\u00fcr.")
 ergebnis
}
