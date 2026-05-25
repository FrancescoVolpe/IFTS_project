Contratto JSON

GET
http://localhost:5678/webhook/v1/me

{
    firstName: string
    lastName: string
    email: string
    gender: string
    dob: string
    avatarUrl: string
}

PUT
http://localhost:5678/webhook/v1/me

{
    firstName
    lastName
    gender
    dob
}

PUT AVATAR
http://localhost:5678/webhook/v1/me/avatar

{
    image:immagine in base64 (string)
}