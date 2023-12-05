rm ap2  ap2Bison.tab.c  ap2Bison.tab.h ap2Flex.c
clear
flex -o ap2Flex.c ap2Flex.l
bison -d ap2Bison.y
clear
gcc -o ap2 ap2Flex.c ap2Bison.tab.c -lfl -lm
./ap2 < input.txt