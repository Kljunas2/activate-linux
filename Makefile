CC	= gcc
RM	= rm
BINARY	= activate-linux
CFLAGS	= $(shell pkg-config --cflags --libs gtk+-3.0 gtk-layer-shell-0)

activate-linux:
	mkdir -p bin
	$(CC) src/activate_linux.c -o bin/$(BINARY) $(CFLAGS)

.PHONY: clean
clean:
	$(RM) -rf bin/
