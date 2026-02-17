CC      := ${CC}
CFLAGS  := ${CFLAGS}
LDFLAGS := ${LDFLAGS}
PREFIX  := ${PREFIX}

TARGET  := sample
SRCS    := sample_main.c
OBJS    := \$(SRCS:.c=.o)

.PHONY: all clean check install uninstall

all: \$(TARGET)

\$(TARGET): \$(OBJS)
	\$(CC) \$(CFLAGS) -o \$@ \$(OBJS) \$(LDFLAGS)

%.o: %.c
	\$(CC) \$(CFLAGS) -c \$< -o \$@

check: \$(TARGET)
	./\$(TARGET)

install: \$(TARGET)
	install -d "\$(DESTDIR)\$(PREFIX)/bin"
	install -m 0755 "\$(TARGET)" "\$(DESTDIR)\$(PREFIX)/bin/\$(TARGET)"

uninstall:
	rm -f "\$(DESTDIR)\$(PREFIX)/bin/\$(TARGET)"

clean:
	rm -f \$(TARGET) \$(OBJS)