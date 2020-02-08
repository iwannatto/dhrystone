.PHONY: run clean

run: dry2 dry2nr dry2o
	./dry2 ${1-50000} 2>/dev/null
	./dry2nr ${1-50000} 2>/dev/null
	./dry2o ${1-50000} 2>/dev/null

dry2: dry.h dry1.c dry2.c
	${CC} -c ${CFLAGS} dry1.c -o dry1.o
	${CC} ${CFLAGS} dry2.c dry1.o ${LFLAGS} -o dry2 

dry2nr: dry.h dry1.c dry2.c
	${CC} -c -DREG ${CFLAGS} dry1.c -o dry1.o
	${CC} -DREG ${CFLAGS} dry2.c dry1.o ${LFLAGS} -o dry2nr

dry2o: dry.h dry1.c dry2.c
	${CC} -c -O ${CFLAGS} dry1.c -o dry1.o
	${CC} -O ${CFLAGS} dry2.c dry1.o ${LFLAGS} -o dry2o

clean:
	rm -f dry1.o dry2 dry2nr dry2o
