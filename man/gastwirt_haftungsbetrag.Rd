\name{gastwirt_haftungsbetrag}
\alias{gastwirt_haftungsbetrag}
\title{gastwirt haftungsbetrag}
\description{Nur gewerbliche Beherbergung, nach § 701 Abs. 2 eingebrachte Sache, keine Ausschlussursache und keine ausgeschlossene Sachenart. Ohne unverzügliche Anzeige Anspruch erloschen, außer Aufbewahrung übernommen oder Gastwirt/Leute schuldhaft. Bei Verschulden, übernommener Aufbewahrung oder pflichtwidrig abgelehnter Aufbewahrung unbeschränkt bis zum tatsächlichen ersatzfähigen Schaden. Sonst Grenze=min(max(100*Beherbergungspreis je Tag,600),3500), bei Geld/Wertpapieren/Kostbarkeiten 800 statt 3500; Betrag=min(Schaden,Grenze).}
\usage{
gastwirt_haftungsbetrag(beherbergungspreis_tag = NULL,
  schaden = NULL,
  beherbergung_gewerblich = NULL,
  eingebracht_nach_701 = NULL,
  sachenart = NULL,
  ursache = NULL,
  verschulden_gastwirt_oder_leute = NULL,
  aufbewahrung_uebernommen = NULL,
  aufbewahrung_pflichtwidrig_abgelehnt = NULL,
  anzeige_unverzueglich = NULL)
}
\arguments{
  \item{beherbergungspreis_tag}{Nichtnegative Dezimalzeichenfolge in EUR des Beherbergungspreises für einen Tag; keine automatische Ableitung aus Gesamtpreis inklusive Zusatzleistungen. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
  \item{schaden}{Nichtnegative Dezimalzeichenfolge in EUR des ersatzfähigen Schadens, bereits nach den einschlägigen allgemeinen Schadensregeln ermittelt. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
  \item{beherbergung_gewerblich}{Expliziter Wahrheitswert zur gewerbsmäßigen Aufnahme des betroffenen Gastes zur Beherbergung.}
  \item{eingebracht_nach_701}{Rechtlich bewerteter Wahrheitswert: Sache in Unterkunft, angewiesenem/bestimmtem Außenort oder Obhut während Aufenthalts bzw. Obhut innerhalb angemessener Vor-/Nachfrist; bei Leuten auch Bestellungs-/Zurechnungsanforderung. Keine automatische Orts- oder Angemessenheitsprüfung.}
  \item{sachenart}{sonstige, geld_wertpapiere_kostbarkeiten, fahrzeug, fahrzeuginhalt oder lebendes_tier. Letzte drei sind vom gesetzlichen Haftungsregime ausgeschlossen.}
  \item{ursache}{sonstige oder rechtlich festgestellte Ausschlussursache gast, begleiter, aufgenommene_person, sachbeschaffenheit oder hoehere_gewalt. Keine automatische Kausalitätsentscheidung.}
  \item{verschulden_gastwirt_oder_leute}{Expliziter Wahrheitswert zum Verschulden am Verlust/Schaden; führt im gesetzlichen Anwendungsbereich zu unbeschränkter Haftung und Anzeigeausnahme.}
  \item{aufbewahrung_uebernommen}{Expliziter Wahrheitswert zur übernommenen Aufbewahrung; unbeschränkte Haftung und Anzeigeausnahme.}
  \item{aufbewahrung_pflichtwidrig_abgelehnt}{Rechtlich bewertete Ablehnung entgegen § 702 Abs. 3, unter Berücksichtigung von übermäßigem Wert/Umfang und Gefahr. Führt zur unbeschränkten Haftung, allein aber nicht zur Anzeigeausnahme.}
  \item{anzeige_unverzueglich}{Expliziter Wahrheitswert zur unverzüglichen Schadensanzeige ab Kenntnis. Unverzüglich wird nicht durch eine erfundene feste Tageszahl ersetzt.}
}
\details{Feste lokale BGB-Fassung; die beschriebenen normbezogenen Tatsachen/Bewertungen werden ausdrücklich eingegeben. Nur gesetzliche Haftung nach §§ 701–703, keine Entscheidung über zusätzliche vertragliche/deliktische Ansprüche. eingebracht_nach_701 erfordert Aufenthalts-/Obhuts-/Ortsbezug, bei Leuten deren Bestellung bzw. zurechenbare Bestellung; angemessener Vor-/Nachzeitraum ist bewertete Eingabe. Pflichtwidrige Ablehnung muss Voraussetzungen/Ausnahmen des § 702 Abs. 3 berücksichtigen. Ablehnung allein befreit nicht von der Anzeige nach § 703. Schaden als ersatzfähiger Betrag nach allgemeinen Schadensregeln, keine doppelte Mitverschuldensreduktion.}
\value{S3-Objekt \code{bgb_ergebnis}. wert enthält zaehler und nenner als Ganzzahlzeichenfolgen, einheit ist EUR. Weitere Felder: regel_id, regelversion, quellenfassung, eingaben, nutzervorgaben, rechenschritte, annahmen, hinweise, status. Nichtanwendbarkeit liefert status NICHT_ANWENDBAR und wert NULL. Fehlende/ungültige Eingaben erzeugen \code{bgb_berechnungsfehler} mit EINGABE_FEHLT/EINGABE_UNGUELTIG.}
\examples{
gastwirt_haftungsbetrag("10", "5000", TRUE, TRUE, "sonstige",
  "sonstige", FALSE, FALSE, FALSE, TRUE)
}
