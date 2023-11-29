rm awp  awpBison.tab.c  awpBison.tab.h awpFlex.c

flex -o awpFlex.c awpFlex.l
bison -d awpBison.y
gcc -o awp awpFlex.c awpBison.tab.c -lfl -lm

./awp < input.txt