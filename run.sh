#!/bin/bash

# Usage: `./run.sh`

echo "${CC=cc} -c ${CFLAGS} dry.c -o dry1.o"
      ${CC}    -c ${CFLAGS} dry.c -o dry1.o || exit 1
echo "${CC} -DPASS2 ${CFLAGS} dry.c dry1.o ${LFLAGS} -o dry2"
      ${CC} -DPASS2 ${CFLAGS} dry.c dry1.o ${LFLAGS} -o dry2 || exit 1
./dry2 ${1-50000} 2>/dev/null
echo "${CC=cc} -c -DREG ${CFLAGS} dry.c -o dry1.o"
      ${CC}    -c -DREG ${CFLAGS} dry.c -o dry1.o || exit 1
echo "${CC} -DPASS2 -DREG ${CFLAGS} dry.c dry1.o ${LFLAGS} -o dry2nr"
      ${CC} -DPASS2 -DREG ${CFLAGS} dry.c dry1.o ${LFLAGS} -o dry2nr || exit 1
./dry2nr ${1-50000} 2>/dev/null
echo "${CC=cc} -c -O ${CFLAGS} dry.c -o dry1.o"
      ${CC}    -c -O ${CFLAGS} dry.c -o dry1.o || exit 1
echo "${CC} -DPASS2 -O ${CFLAGS} dry.c dry1.o ${LFLAGS} -o dry2o"
      ${CC} -DPASS2 -O ${CFLAGS} dry.c dry1.o ${LFLAGS} -o dry2o || exit 1
./dry2o ${1-50000} 2>/dev/null
rm -f dry1.o

exit 0
