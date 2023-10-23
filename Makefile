all: link

build: build-asm build-cpp build-main

asm: build-main link-asm
cpp: build-main link-cpp


build-main:
	g++ -o main.o -c main.cpp

build-asm:
	nasm -felf64 calc.asm

build-cpp:
	g++ -o calc-cpp.o -c calc.cpp

link: build-main link-asm link-cpp

link-asm: build-asm
	g++ -o calc calc.o main.o

link-cpp: build-cpp
	g++ -o calc-cpp calc-cpp.o main.o

clean: 
	rm *.o *.txt calc calc-cpp

run: build link
	./calc

test: build link
	echo "24 12" | /bin/time -v -o asm.txt ./calc
	echo "24 12" | /bin/time -v -o cpp.txt ./calc-cpp