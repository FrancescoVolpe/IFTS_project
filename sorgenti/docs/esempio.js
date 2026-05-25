const array = [
    {
        firstName:"Iarin",
        lastName:"Fabbri"
    },
    {
        firstName:"Donald",
        lastName:"Duck"
    }
]


const lista = {
    "iarin": {
        firstName:"Iarin",
        lastName:"Fabbri"
    },
    "paperino": {
        firstName:"Donald",
        lastName:"Duck"
    }
}

array[0].lastName

lista["paperino"].lastName


const ordine = {
    id : "0001",
    ragSoc: "ACME Srl",
    address: {
        city: "San Giovanni in Persiceto",
        via: "Via Pace, 12",
        prov: "BO",
        nazione: "Italia",
        coord: [40.56,41.23]
    },
    righe: [
        {
            idRiga:1,
            prodotto: "0003",
            qta: 2,
            prz: 23.67
        },
        {
            idRiga:2,
            prodotto: "A5545",
        }
    ]
}

ordine.righe.length
