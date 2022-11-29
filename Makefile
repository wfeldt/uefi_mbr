all: uefi_mbr.bin

uefi_mbr.bin: uefi_mbr.asm
	nasm -O99 -f bin -l $@.lst -o $@ $<

test: all
	./test_setup test.img

clean:
	rm -f *.bin *.lst *.o *.img *~ uefi_mbr
