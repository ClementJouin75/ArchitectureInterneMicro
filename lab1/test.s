.data
chaine:
    .string "hello"

.text
    # pour récupérer l’adresse de ’chaine ’:
    la a1, chaine
    li a6, 0x97 
    li a7, 0x122 
    lb a2, 0(a1) # chargement du caractère

    li a5, 0
main: 
    beq a2, a5, exit
    bge  a6, a2, test # si a2 >= 0x97, 

    j main


test:
    bge a2, a7, loolcarac # si a2 <= 0x122,


loolcarac: 

    addi a2, a2, -32 # a2 = a2 - 32
    sb a2, 0(a3) # sauvegarde du caractère
    addi a1, a1, 1 # incrémentation de l’adresse
    lb a2, 0(a1) # chargement du caractère
    beq a2, a5, exit
j main

exit: 
    j exit