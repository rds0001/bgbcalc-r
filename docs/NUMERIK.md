# Gemeinsamer exakter Zahlenvertrag

Geld und Quoten werden intern als gekürzte rationale Zahlen mit ganzzahligem
Zähler und positivem Nenner verarbeitet. Beide Sprachen verwenden denselben
zulässigen Bereich: Betrag des Zählers und Nenner höchstens 9007199254740991
(2^53−1). R verwendet diese exakt darstellbaren Ganzzahlen nativ; Python nutzt
Fraction und dieselben Bereichsprüfungen. Es gibt keine Python-Laufzeit in R.

Dezimale Geld-/Quoteneingaben werden ausschließlich aus Zeichenfolgen gelesen,
nicht aus binären Fließkommawerten. Zulässig sind Vorzeichen, ganze Ziffern und
optional ein Punkt mit Nachkommastellen; keine Exponenten oder Tausendertrenner.
Nach Entfernung abschließender Nachkommanullen sind höchstens 15 Stellen
zulässig. Jeder Aufbau eines Zählers/Nenners wird auf Überlauf geprüft.

Für fachliche Geldbeträge, dezimal beschriebene Quoten, Zinssätze und
sonstige dezimal beschriebene Messwerte ist alternativ ein exaktes Bruchobjekt
zulässig: in Python `{"zaehler": "1", "nenner": "3"}`, in R
`list(zaehler = "1", nenner = "3")`. Es muss genau diese beiden Felder enthalten.
Die Felder sind kanonische Ganzzahlzeichenfolgen: keine führenden Nullen,
kein Pluszeichen, kein Dezimalpunkt, kein Exponent, keine Leerzeichen und
kein negatives Nullzeichen. Der Zähler darf negativ oder null sein, der Nenner
muss positiv sein. Beide bleiben im gemeinsamen Bereich 2^53−1.
Nicht gekürzte Brüche sind zulässig und werden intern gekürzt. Fachliche
Grenzen wie Nichtnegativität oder ein Höchstanteil gelten unverändert.

Damit kann das Feld `wert` eines skalaren Betragsresultats unmittelbar als
Eingabe einer weiteren fachlich passenden Betragsfunktion dienen. Einheiten,
Bezugszeiträume und rechtliche Voraussetzungen müssen trotzdem zusammenpassen.
Bei strukturierten Ergebnissen das passende Betragsfeld auswählen; nicht das
gesamte Ergebnisobjekt übergeben. Als Ganzzahlen bezeichnete Parameter,
insbesondere getrennte Quotenzähler/-nenner, Anzahlen und Altersstufen, behalten
ihren bisherigen Eingabetyp. Datums- und Nachweiszeichenfolgen sind keine
Zahleneingaben.

Addition nutzt gemeinsame Nenner mit ggT-Kürzung; Multiplikation/Division kürzen
vor dem Produkt kreuzweise. Jede noch erforderliche ganzzahlige Summe/jedes
Produkt muss im exakten Bereich liegen. Auch bei mathematisch später wieder
kleinerem Ergebnis wird ein nicht sicher darstellbares Zwischenprodukt
zurückgewiesen. Diese technische Grenze ist keine gesetzliche Wertgrenze.
Vergleiche verwenden ganzzahlige Quotienten und Restfolgen, keine gerundeten
Fließkommaquotienten oder potenziell überlaufenden Kreuzprodukte.

Rundung ist eine explizite Operation mit Stellenzahl 0..15 und Modus
`gegen_null`, `ab` (gegen minus unendlich), `auf` (gegen plus unendlich),
`kaufmaennisch` (halbe Einheiten vom Nullpunkt weg) oder `gerade` (halbe Einheiten
zur geraden Endziffer). Keine automatische Cent-Rundung. Jede fachliche Regel
legt ihren Rundungszeitpunkt und -modus fest oder liefert den exakten Bruch.
Die Darstellung mit fester Dezimalstellenzahl wird aus ganzen Ziffern aufgebaut.

Die Zahlenbasis ist eine interne technische Komponente, keine eigenständige
BGB-Rechenregel. Regel-Ergebnisse erhalten weiterhin die fachlichen Metadaten
und Quellenbezüge. Überlauf, ungültiger Nenner, Division durch null, unzulässiger
Typ oder ungültiges Format erzeugen EINGABE_UNGUELTIG; fehlende Eingabe
EINGABE_FEHLT. Keine Ersatzwerte oder stillen Präzisionsverluste.
## JSON-Ausgabe großer Ganzzahlen in Entwicklungsprüfungen

Die fachlichen Bruchausgaben behalten Zähler und Nenner als Zeichenfolgen.
Ganzzahlige Nutzereingaben können dagegen in den Herkunftsfeldern numerisch
erhalten bleiben. Auch deren Serialisierung muss verlustfrei sein.

Der R-Fachreferenztreiber verwendet deshalb bei `jsonlite::write_json`
`digits = 17`. In der verwendeten Prüfinstallation verkürzt `digits = NA`
beispielsweise die exakt darstellbare Ganzzahl `9007199254740991` auf
`9.00719925474099e+15`. Die neue Exportvorgabe erhält die ursprüngliche Zahl.
Die Gleichanteilsreferenzen prüfen diese Grenze einschließlich der Eingaben,
Nutzervorgaben und Rechenschritte, nicht nur des berechneten Bruchs.
Dies betrifft den Entwicklungs-Prüfexport; die native R-Library benötigt dafür
keine zusätzliche Laufzeitabhängigkeit.

