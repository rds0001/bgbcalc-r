# Listen, Objekte und sprachspezifische Eingabeformen

Geordnete Sammlungen sind in Python Listen und in R unbenannte Listen.
Dies gilt beispielsweise für Erbstämme, Teilhaber und Wohnungen. Die einzelnen
Datensätze sind dagegen Objekte mit den ausdrücklich benannten Feldern:
Python-Dictionaries beziehungsweise benannte R-Listen. Auch ein leeres
Objekt `{}` ist keine leere Sammlung `[]`. In R entspricht eine leere Sammlung
`list()` ohne Namen; eine benannte leere Liste ist ein Objekt.

Bei Erbstämmen müssen auch sämtliche verschachtelten Abkömmlingslisten
unbenannte R-Listen sein. Bei Großelternpaaren bleibt das äußere Objekt mit
`vaeterlich` und `muetterlich` benannt; die beiden darin enthaltenen Paarlisten
und deren Abkömmlingslisten sind unbenannt.

Die ausdrücklich dokumentierten R-Zeichenvektoren für `feiertage` und
`abweichende_reihenfolge` bleiben zulässig, müssen aber ebenfalls unbenannt
sein. Ein R-Zeichenvektor der Länge eins ist sprachbedingt nicht von einer
einzelnen Zeichenfolge unterscheidbar. In gemeinsamen JSON-Referenzen werden
solche Folgen deshalb immer als Arrays dargestellt. Der Typvergleich ist keine
Behauptung identischer nativer Klassen in beiden Sprachen.

Ganze Anzahlen und getrennte Quotenzähler/-nenner sind Python-Integer
(keine Bool- oder Float-Werte) beziehungsweise exakt ganzzahlige R-Numerics
innerhalb des dokumentierten Bereichs. Geldwerte und andere Dezimalwerte
verwenden Dezimalzeichenfolgen oder die exakten Bruchobjekte aus
[NUMERIK.md](NUMERIK.md). Numerische Rohwerte werden dafür nicht stillschweigend
in Geld umgewandelt.

Der zusätzliche Prüfer `pruefungen/pruefe_eingabeparitaet.py` variiert jeweils
eine Eingabe auf Basis erfolgreicher Referenzfälle und ersetzt auch
verschachtelte Listen durch benannte Objekte. Er vergleicht Ergebnis- und
Fehlerstatus zwischen Python und R. Diese Fälle sind technische
Statusvergleiche, keine unabhängig hergeleiteten fachlichen BGB-Referenzfälle
und kein vollständiger Nachweis aller Eingabekombinationen.
