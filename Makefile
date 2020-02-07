.PHONY: run clean

run: dry2 dry2nr dry2o
	./dry2 ${1-50000} 2>/dev/null
	./dry2nr ${1-50000} 2>/dev/null
	./dry2o ${1-50000} 2>/dev/null
	rm -f dry1.o

dry2: dry.c
	${CC}    -c ${CFLAGS} dry.c -o dry1.o || exit 1
	${CC} -DPASS2 ${CFLAGS} dry.c dry1.o ${LFLAGS} -o dry2 || exit 1

dry2nr: dry.c
	${CC}    -c -DREG ${CFLAGS} dry.c -o dry1.o || exit 1
	${CC} -DPASS2 -DREG ${CFLAGS} dry.c dry1.o ${LFLAGS} -o dry2nr || exit 1

dry2o: dry.c
	${CC}    -c -O ${CFLAGS} dry.c -o dry1.o || exit 1
	${CC} -DPASS2 -O ${CFLAGS} dry.c dry1.o ${LFLAGS} -o dry2o || exit 1

clean:
	rm -f dry2 dry2nr dry2o
