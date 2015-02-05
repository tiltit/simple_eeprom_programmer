PRG = eeprom_write

CC = sdcc

all: $(PRG).hex

$(PRG).asm: $(PRG).c
	$(CC) -S -V -mpic14 -p16f877a -D__16f877a --use-non-free $(PRG).c

$(PRG).o: $(PRG).asm
	gpasm -c $(PRG).asm

$(PRG).hex: $(PRG).o
	gplink -m -s /usr/share/gputils/lkr/16f877a.lkr \
	-o $(PRG).hex /usr/share/sdcc/non-free/lib/pic14/pic16f877a.lib \
	/usr/share/sdcc/lib/pic14/libsdcc.lib	\
	$(PRG).o

clean:
	rm $(PRG).asm
	rm $(PRG).o
	rm $(PRG).lst
	rm $(PRG).cod
	rm $(PRG).map
	rm $(PRG).hex


