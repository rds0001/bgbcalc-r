% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{gesamtgrundpfandvermaechtnis_fremdgrundstueck}
\alias{gesamtgrundpfandvermaechtnis_fremdgrundstueck}
\title{gesamtgrundpfandvermaechtnis fremdgrundstueck}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{gesamtgrundpfandvermaechtnis_fremdgrundstueck(
  gesamtbelastungsbetrag = NULL,
  grundpfandart = NULL,
  wert_vermachtes_grundstueck = NULL,
  vorrangige_lasten_vermachtes_grundstueck = NULL,
  wert_fremdgrundstueck = NULL,
  vorrangige_lasten_fremdgrundstueck = NULL,
  erblasserpflicht_gegenueber_fremdeigentuemer = NULL,
  zweifelsregel_anwendbar = NULL,
  genau_zwei_grundstuecke_qualifiziert = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{gesamtbelastungsbetrag}{Nichtnegativer exakter, rechtlich bestimmter vergleichbarer EUR-Befriedigungsbetrag der Gesamtbelastung; keine ungeprüfte Kapitalisierung laufender Renten.}
\item{grundpfandart}{gesamtgrundschuld oder gesamtrentenschuld.}
\item{wert_vermachtes_grundstueck}{Nichtnegativer exakter EUR-Wert des vermachten Nachlassgrundstücks zum Eigentumsübergang.}
\item{vorrangige_lasten_vermachtes_grundstueck}{Nichtnegative exakte EUR-Belastungen, die der Gesamtbelastung am vermachten Grundstück im Rang vorgehen; betrachtete Gesamtbelastung nicht nochmals abziehen.}
\item{wert_fremdgrundstueck}{Nichtnegativer exakter vergleichbarer EUR-Wert des einzigen weiteren Grundstücks, das nicht zum Nachlass gehört, zum maßgeblichen Eigentumsübergang. Kompatibilitätsparameter: validiert,aber keinEinfluss auf2168II-Nachlassvergleichsquote.}
\item{vorrangige_lasten_fremdgrundstueck}{Nichtnegative exakte rangvorrangige EUR-Belastungen am Fremdgrundstück. Kompatibilitätsparameter: validiert,aber keinEinfluss auf2168II-Nachlassvergleichsquote.}
\item{erblasserpflicht_gegenueber_fremdeigentuemer}{Expliziter Wahrheitswert: Erblasser war im Erbfall gegenüber Eigentümer des Fremdgrundstücks oder dessen Rechtsvorgänger zur Befriedigung des Gläubigers verpflichtet. Bloße dingliche Mithaftung reicht nicht.}
\item{zweifelsregel_anwendbar}{Expliziter Wahrheitswert zur einschlägigen Zweifelsregel ohne abweichenden Erblasserwillen.}
\item{genau_zwei_grundstuecke_qualifiziert}{Expliziter Wahrheitswert: genau ein vermachtes Nachlassgrundstück und genau ein weiteres fremdes Grundstück mit identischer Gesamtbelastung; weitere Grundstücke außerhalb dieses Modells.}
\item{bewertungsnachweis}{Nichtleerer Nachweis zur Verpflichtung im Erbfall, Grundstückszuordnung, Werte-/Ranglastenlage beim Eigentumsübergang und vergleichbarer Geldbetragsbasis.}
}
\details{BereinigterEigenwert=max(Eigenwert-Vorrang,0); hier einzigesNachlassgrundstück, deshalbBefriedigung=min(Gesamtbetrag,bereinigterEigenwert).2167-Vergleichsgruppe umfasst nurNachlassgrundstücke,keineFremdwerte. Nur2168Absatz2 mit genau einem vermachtenNachlassgrundstück und einem fremdenGrundstück. Erblasserpflicht imErbfall gegenüberFremdeigentümer/Rechtsvorgänger qualifizieren.2167 bezieht nurNachlassgrundstücke in Vergleichsgruppe ein: Fremdwerte mindern diese interneLast nicht. Hier einzigesNachlassgrundstück, deshalb Befriedigung=min(Gesamtbetrag,bereinigterEigenwert). bereinigter_gesamtwert ist alleinWertsumme derNachlassgrundstücke; wertquote beiEigenwertpositiv1,bei0NULL. Fremdwert-/Ranglastenparameter werden ausKompatibilitätsgründen validiert,aber nichtquotenbildend verwendet. Kein2166II-Drittleistungsabzug, keineAußenhaftungsbegrenzung, Rentenkapitalisierung oderFälligkeitsentscheidung. WeitereNachlassgrundstücke benötigen gesonderte2167-Quote. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält bereinigter_wert_vermachtes_grundstueck, bereinigter_gesamtwert, wertquote, anteil_vor_wertbegrenzung und befriedigungsbetrag; negative Anwendbarkeit NULL. bereinigter_gesamtwert bezeichnet ausschließlichNachlasswertsumme, hierEigenwert; fremdeGrundstücke sind keineVergleichsmasse. Einheit: EUR_und_quote.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2168_T0003, BGB_2166_T0001, BGB_2166_T0002, BGB_2167_T0001, BGB_2167_T0002}
\examples{
gesamtgrundpfandvermaechtnis_fremdgrundstueck(
  gesamtbelastungsbetrag = "800",
  grundpfandart = "gesamtgrundschuld",
  wert_vermachtes_grundstueck = "100",
  vorrangige_lasten_vermachtes_grundstueck = "0",
  wert_fremdgrundstueck = "300",
  vorrangige_lasten_fremdgrundstueck = "0",
  erblasserpflicht_gegenueber_fremdeigentuemer = TRUE,
  zweifelsregel_anwendbar = TRUE,
  genau_zwei_grundstuecke_qualifiziert = TRUE,
  bewertungsnachweis = paste0(
    "Synthetische Erblasserpflicht im Erbfall gegenüber Fremdeige",
    "ntümer und vergleichbare Werte."
  )
)
}
