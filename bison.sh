rm awp  awpBison.tab.c  awpBison.tab.h awpFlex.c
clear
flex -o awpFlex.c awpFlex.l
bison -d awpBison.y
gcc -o awp awpFlex.c awpBison.tab.c -lfl -lm

./awp < input1.txt