rm awpFlex  awpFlex.c

flex -o awpFlex.c awpFlex.l
gcc -o awpFlex awpFlex.c -lfl
./awpFlex