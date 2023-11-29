rm awpFlex  awpFlex.c
clear
flex -o awpFlex.c awpFlex.l
gcc -o awpFlex awpFlex.c -lfl
./awpFlex < input1.txt