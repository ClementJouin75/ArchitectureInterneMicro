#include <stdio.h>

#define ABS(A) ((A)>0 ? (A) : -(A))

int square_root(int x) {
    if (x <= 0) return 0;  // pas de cas <0

    int guess = x;    // Estimation initiale
    int epsilon = 1;  // Précision souhaitée

    while (1) {
        int new_guess = (guess + x / guess)/2;  // Nouvelle estimation
        if (ABS(new_guess - guess) < epsilon) {
            return new_guess;  // ok
        }
        guess = new_guess;
    }
}

int main()
{
    //racine de 2 en virgule fixe (16.16)
    const int val = 0x20000;
    const int result = square_root(val);
    //decalage de 8 pour le calcul en virgule fixe
    printf("racine de %d : %d\n",val,result << 8);
    //estimation de la valeur (debug en float)
    printf("racine %f\n", result/256.);
}