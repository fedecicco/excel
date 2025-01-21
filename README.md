### excel
## file trades_on_exchanges
ANALISI OPERAZIONI DI TRADING
Questo progetto trasforma un semplice foglio di calcolo in uno strumento avanzato per l'analisi delle performance finanziarie. I dati rappresentano le operazioni di trading svolte dal cliente principale, Bob, dal 1° gennaio 2021. L'obiettivo è fornire insights strategici e migliorare la gestione delle operazioni di trading tramite visualizzazioni interattive e analisi automatizzate.

Le colonne presenti nel foglio sono:

- TradeID: identificativo unico del trade (8 cifre).
- Stock Exchange: mercato in cui è stata eseguita l'operazione.
- Region: area geografica del mercato.
- Date Added: data di acquisto dell'azione (formato YYYY-MM-DD).
- Quantity: quantità di azioni acquistate/vendute.
- Buy Price: prezzo di acquisto per singola azione.
- Date Sold: data di vendita dell'azione (formato YYYY-MM-DD).
- Sell Price: prezzo di vendita per singola azione.

Scheda 2: "Stock Exchanges"

 - Pivot table per visualizzare il numero di azioni scambiate per stato. - Colonna aggiuntiva che indica se è necessario pagare tasse basate su un valore soglia di 67 azioni scambiate con formattazione condizionale

Scheda 3: "Profit Insights"

- Colonna A: riferimento ai TradeID della scheda "My Trades". 
- Colonna B: durata del possesso delle azioni (calcolata in giorni). 
- Colonna C: profitto generato da ciascun trade (differenza tra prezzo di vendita e di acquisto moltiplicata per la quantità di azioni scambiate). 
- Istogramma per visualizzare la distribuzione della durata dei trade con numero di bin pari a 30. 

Scheda 4: "Number of Trades Exchanged"

- Tabella di contingenza che mostra la frequenza dei trade per regione. 
- Calcolo delle probabilità associate a eventi specifici di seguito riportati

Gli eventi da considerare per il calcolo delle probabilità sono:

Probabilità che avvenga un trade nel Regno Unito con quantità uguale a 1
Probabilità che avvenga un trade in un paese asiatico con quantità <= 8

## file linear_regression

Questo progetto si concentra sulla creazione di un dataset realistico utilizzando un foglio di calcolo, con l'obiettivo di fornire uno strumento efficace per testare tecniche di analisi statistica e modelli di previsione.

Questo progetto analizza i dati relativi all’età di 250 individui, con diverse fasi di elaborazione.

- Scheda 1: Parameters: Qui vengono inseriti i parametri della distribuzione normale (probabilità, media, deviazione standard) per generare i dati successivamente. La formattazione è semplice con bordi e font stilizzati.

- Scheda 2: Data: In questa scheda vengono generati i dati relativi all’età e assegnati casualmente a 4 gruppi.

- Scheda 3: Sample: Viene selezionato un sotto-campione in base al gruppo di appartenenza utilizzando una funzione condizionale.

- Scheda 4: Statistical Insight: Qui si calcolano valori chiave come deviazione standard, valore atteso, intervallo di confidenza, con una spiegazione dei risultati.

- Scheda 5: (Un)correlated Variables: Si esplora la correlazione tra le età e altre variabili casuali (es. numero di gatti, età del partner).

- Scheda 6: Linear Regression: Si esegue una regressione lineare tra età e ordine di censimento, con la visualizzazione di uno scatterplot e la regressione calcolata per un partecipante.

Il progetto mira a generare e analizzare statisticamente i dati, testare correlazioni e applicare tecniche di regressione.
