FLEX=flex
BISON=bison
CC=gcc
PROGRAMA = regalloc
LEXICO = lexico.l
SINTATICO = sintatico.y
OBJETOS = first.o Ast.o Lista.o lexico.yy.o	sintatico.tab.o
FLAGS = -std=c99

gerador: $(OBJETOS)
	$(CC) -g $(OBJETOS) -o gerador $(FLAGS)

first.o: first.c
	$(CC) -o first.o -c first.c -g $(FLAGS)

Ast.o: Ast.c Ast.h
	$(CC) -o Ast.o -c Ast.c -g $(FLAGS)

Lista.o: Lista.c Lista.h
	$(CC) -o Lista.o -c Lista.c -g $(FLAGS)

lexico.yy.h lexico.yy.c: $(LEXICO)
	$(FLEX) $(LEXICO)

sintatico.tab.h sintatico.tab.c: $(SINTATICO)
	$(BISON) -d -o sintatico.tab.c $(SINTATICO)

clean:
	rm -f *.yy.c
	rm -f *.yy.h
	rm -f *.tab.c
	rm -f *.tab.h
	rm -f *.o
	rm -f gerador
	rm -f *.tab.o
