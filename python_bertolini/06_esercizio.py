#
# Vogliamo creare un programma da riga di comando (CLI) che permetta
# al docente di inserire i voti di ciascun suo studente e di visionare
# la media e i voti di ciascun studente.
#
# Hp:
#    Il docente conosce già il nome e cognome dei suoi studenti.
#
#           Benvenuto nel programma di gestione voti.
#           Cosa si desidera fare? [inserisci / vedi / esci]
#
# 1. Se uno digita 'inserisci'
#
#   Il programma deve chiedere:
#       Digitare il cognome e nome dello studente:
#       >:
#   Dopo l'inserimento bisogna chiedere:
#       Digitare i voti dello studente separati da virgola:
#       >:
#
# 2. Se uno digita 'vedi':
#
#   Il programma deve stampare tutti i voti degli studenti inseriti.
#
# 3. Se l'utente digita 'esci' il programma termina.
voti_studenti = {
    'Giannoni Marco': [1,2,3]
}
print( )
print('Benvenuto nel programma di gestione voti.')
while True:
    print( )
    print('Cosa si desidera fare? [inserisci / vedi / esci]')
    # restituisce una stringa
    cmd = input('>: ').lower( )
    # print(cmd)  # debug
    if cmd == 'inserisci':
        print("Digitare il cognome e il nome dello studente")
        studente_corretto = False
# validazione studente - no numeri.
        while studente_corretto == False:
            studente        = input('>: ')
            studente_copy   = studente.lower().replace(' ', '')
            if studente_copy.isalpha():
                studente_corretto = True
            else:
                print("Studente inserito non valido.")
                print("Digitare nuovamente il cognome e il nome dello studente")    
####
# Validazione voti.
# Voti tutti compresi tra 1 e 10
# Voti numerici e quindi convertibili in intero.
#
# Non controlliamo la presenza degli spazi.
# Il programma fallisce se l'input è float.
        voti_tutti_corretti = False
        while voti_tutti_corretti == False:
            print('Digitare i voti dello studente separati da virgola')
            voti = input('>: ')
            lista_voti  = voti.replace(' ', '').split(',')    # .strip() non funziona
            final_lista = [ ]       # [1, 2, 3]
            for voto in lista_voti:
                if voto.isnumeric():
                    voto_int = int(voto)
                    if 1 <= voto_int <= 10:
                        final_lista.append(voto_int)
            if len(lista_voti) == len(final_lista):
                voti_tutti_corretti = True
        print("studente inserito", studente)
        print("voti inseriti", voti)
        # inseriamo i voti nel dizionario.
        voti_studenti[studente] = final_lista
    elif cmd == 'vedi':
        # print(voti_studenti)
        for studente,voti_ in voti_studenti.items():
            print('voti di', studente, ':', end=' ')
            print(' ', voti_)
            print('media:', sum(voti_)/len(voti_))

    elif cmd == 'esci':
        break
    
    else:
        print("Comando non valido!")

print("Arrivederci e grazie.")