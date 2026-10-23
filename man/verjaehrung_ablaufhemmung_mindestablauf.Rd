\name{verjaehrung_ablaufhemmung_mindestablauf}
\alias{verjaehrung_ablaufhemmung_mindestablauf}
\title{Mindestablauf bei Vertretungsmangel und Nachlassansprüchen}
\description{Frühestes rechtlich vorgegebenes schutzbeendendes Ereignis auswählen. Ab diesem Ereignis grundsätzlich sechs Monate Nachlauf berechnen. Ist die vorgegebene Verjährungsfrist kürzer, ihren Zeitraum stattdessen einsetzen; der Vergleich erfolgt anhand der Kalenderdauer am ausgewählten Ereignis. Ergebnis ist der spätere Tag aus diesem Mindestablauf und dem bisherigen rechnerischen Endtag. Bei § 210 schließt Prozessfähigkeit der beschränkt geschäftsfähigen Person die Anwendung aus.}
\usage{
verjaehrung_ablaufhemmung_mindestablauf(schutzfall = NULL,
  schutzbeendende_ereignisse = NULL,
  fristdauer = NULL,
  fristeinheit = NULL,
  rechnerischer_letzter_tag = NULL,
  prozessfaehigkeit_bei_beschraenkter_geschaeftsfaehigkeit = NULL,
  ablaufhemmung_anwendbar = NULL)
}
\arguments{
\item{schutzfall}{Auswahl vertretungsmangel (§ 210: geschäftsunfähige oder beschränkt geschäftsfähige Person ohne gesetzlichen Vertreter) oder nachlass (§ 211: Anspruch gehört zum Nachlass oder richtet sich gegen ihn). Die rechtliche Zugehörigkeit zum Schutzfall ist Nutzervorgabe.}
\item{schutzbeendende_ereignisse}{Unbenannte Liste von Objekten mit genau ereignis und datum (ISO-Datum JJJJ-MM-TT). Für vertretungsmangel zulässig: unbeschraenkte_geschaeftsfaehigkeit, vertretungsmangel_behoben. Für nachlass: erbschaft_angenommen, nachlassinsolvenz_eroeffnet, geltendmachung_durch_oder_gegen_vertreter_moeglich. Jedes Ereignis höchstens einmal. Alle für den betrachteten Schutzzeitraum bereits eingetretenen rechtlich maßgeblichen Ereignisse angeben; die Funktion wählt das früheste. Maximal drei Einträge. Eine leere Liste bedeutet, dass kein schutzbeendendes Ereignis angegeben ist; bei anwendbarer Ablaufhemmung folgt EINGABE_FEHLT und kein erfundenes Datum.}
\item{fristdauer}{Positive Ganzzahl der vollen für die Verjährung bestimmten Dauer in fristeinheit, nicht der verbliebenen Restdauer. Höchstens 3652059. Wird für die gesetzliche Verkürzung des Nachlaufs bei Fristen unter sechs Monaten verwendet; die Gültigkeit der vorgegebenen Fristdauer wird nicht rechtlich festgestellt.}
\item{fristeinheit}{Auswahl tage, wochen, monate oder jahre. Der Vergleich mit sechs Monaten erfolgt kalenderbezogen ab dem ausgewählten Schutzende. Wochen werden als sieben Tage, Monate und Jahre nach §§ 187/188 behandelt.}
\item{rechnerischer_letzter_tag}{ISO-Datum des ohne diesen Mindestnachlauf berechneten letzten Verjährungstags, nach sonst erforderlichen vorangehenden Berechnungsschritten, aber ohne Werktagsverschiebung. Darf zeitlich vor dem Schutzende liegen: Die Ablaufhemmung hält den Ablauf auf, ohne pauschal Hemmungstage nach § 209 zu addieren.}
\item{prozessfaehigkeit_bei_beschraenkter_geschaeftsfaehigkeit}{Expliziter Wahrheitswert, ob die beschränkt geschäftsfähige Person im Sinn des § 210 Absatz 2 prozessfähig ist. Bei Schutzfall vertretungsmangel führt TRUE zu NICHT_ANWENDBAR; beim Schutzfall nachlass ist diese Ausnahme nicht entscheidungserheblich.}
\item{ablaufhemmung_anwendbar}{Expliziter Wahrheitswert zur rechtlichen Anwendung des ausgewählten § 210 oder § 211 im betrachteten Fristlauf. Hierzu gehören der zeitliche Schutzbezug und die jeweiligen Anspruchs-/Personenmerkmale. Keine nachträgliche Wiederbelebung eines bereits vorher außerhalb des Schutzes verjährten Anspruchs; FALSE ergibt NICHT_ANWENDBAR.}
}
\details{Mindestablauf einer bestimmten Schutzperiode nach §§ 210/211. Keine automatische Feststellung von Geschäftsfähigkeit, gesetzlicher Vertretung, Prozessfähigkeit, Erbschaftsannahme oder möglicher Geltendmachung gegenüber einem Vertreter. Weitere oder erneut eintretende Schutzperioden, Neubeginn, andere Fristläufe und gegebenenfalls § 193 sind gesondert zu prüfen. Ein laufender Schutz ohne bekanntes Beendigungsereignis liefert keinen konkreten letzten Tag. Kein bloßer Zuschlag von sechs Monaten zum bisherigen Fristende. Alle erforderlichen Datumszwischenwerte einschließlich des sechsmonatigen Vergleichsendes müssen im Kalenderbereich 0001 bis 9999 liegen.}
\value{S3-Objekt bgb_ergebnis. wert enthält schutzende_am, nachlauf_kuerzer_als_sechs_monate (Wahrheitswert), mindestablauf und rechnerischer_letzter_tag. Enddaten sind ISO-Daten zum Tagesschluss. Bei NICHT_ANWENDBAR ist wert null; bei anwendbarem Schutz ohne Beendigungsereignis wird EINGABE_FEHLT ausgelöst. Fehlende oder ungültige Eingaben erzeugen bgb_berechnungsfehler.}
\examples{
verjaehrung_ablaufhemmung_mindestablauf("vertretungsmangel",
  list(list(ereignis = "vertretungsmangel_behoben", datum = "2026-01-31")),
  3, "jahre", "2026-02-01", FALSE, TRUE)
}
