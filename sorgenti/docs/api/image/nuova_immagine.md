X 1) Riceverà un prompt dall'utente (Applicazione o Postman) con autenticazione
X 2) controlla che l'autenticazione sia corretta
X 3) recupra l'utente corrente
X 4) controlla che l'utente si attivo
X 5) prende il prompt e lo passa ad un'AI che faccia il prompt enancher e controlli che la richiesta dell'immagine non sia borderline
X 6) il prompt migliorato verrà mandato ad AI per generare l'immagine
X 7) l'immagine viene presa e salvata su minio con un id
X 8) viene mandata l'immagine ad una AI che ci ritorna la descrizione dettagliate dell'immagine e dei tag e categorie e colori predominanti. 
X 8bis) A questa AI va mandata la lista dei tag già presenti
X 9) questi dati dell'immagine vanno salvati su mongodb salvando anche i descrittori delle step precedente, e creando gli array vuoti delle reazioni e dei commenti
X 10) ritorna il json dell'immagine con il link per recuperarla da dentro minio



POST
http://localhost:5678/webhook/v1/immagini
{
    "prompt":"stringa in formato base64"
}
Header con authorization

Struttura del record su mongo:
{
    "autore": l'email del richiedente
    "dataCreazione",
    "promptOriginale"
    "promptMigliorato"
    "idImmagine"
    "descrizione"
    "tags":["tag1","tag2","tag3"...],
    "colori":["color1","color2"...],
    "reazioni":[],
    "commenti":[],
    "stato":"visibile" / "bannata" / "canc"
    "dataCancellazione"
    "dataBan"
    "utenteBan"
    "motivoBan"
}