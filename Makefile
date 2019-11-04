FLEX=flex
BISON=bison
CC=gcc
PROGRAMA = regalloc
LEXICO = lexico.l
SINTATICO = sintatico.y
OBJETOS = first.o
FLAGS = -std=c99

gerador: $(OBJETOS)
	$(CC) -g $(OBJETOS) -o gerador $(FLAGS)

first.o: first.c
	$(CC) -o first.o -c first.c -g $(FLAGS)

lexico.yy.h lexico.yy.c: lexico.l
	flex lexico.l

sintatico.tab.h sintatico.tab.c: sintatico.y
	$(BISON) -d -o sintatico.tab.c $(SINTATICO)

clean:
	rm -f *.yy.c
	rm -f *.yy.h
	rm -f *.tab.c
	rm -f *.tab.h
	rm -f *.o
	rm -f regalloc
	rm -f *.tab.o
