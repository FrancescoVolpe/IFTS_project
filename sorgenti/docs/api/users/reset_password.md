1) API put per reset password con nel body l'email
   viene controllato che l'email sia esistente
   viene testato che l'utente sia attivo
   viene inserito un nuovo pincode sul record utente
   ritorna sempre status OK anche se qualceh test va in errore

   PUT /v1/resetpwd/request
   {
    "email":"i.fabbri...."
   }

   retorn code ok: 200

2) API put per controllo pin code
   viene mandato in put il body con email + pincode
   viene controllato che esiste utente (ritorna errore "qualcosa è andato storto con" codice ERR015)
   viene controllato che utente sia attivo (ritorna errore "qualcosa è andato storto" con codice ERR016)
   viene controllato che pincode coincida (ritorna errore "Pincode errato" con codice ERR017)
   azzera pincode su utente
   se va tutto bene ritorn status OK altrimenti errore

   PUT /v1/resetpwd/check
   {
    email
    pincode
   }

   return code ok: 200
   return code errore: 400

3) API per conferma nuova password
   viene mandato in put il body con email e nuova password
   vengono fatti i check sulla password
   viene controllato che esiste utente
   viene controllato che utente sia attivo
   viene cambiata la password su postgres
   viene azzerata la session su postgres

   PUT /v1/resetpwd/reset
   {
    email
    password
   }

   return code ok: 200
   return code errore: 400