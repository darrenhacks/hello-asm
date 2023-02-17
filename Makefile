.DEFAULT_GOAL := hello
.PHONY: clean

hello: hello.o
	ld -macosx_version_min 11.1.0 -o hello -lSystem -L/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -no_pie hello.o

hello.o: hello.asm
	nasm -f macho64 -g -F dwarf hello.asm -l hello.lst

clean:
	rm hello hello.o hello.lst
