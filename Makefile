-include config.mk

TARGET ?= sample
SRCS   ?= src/sample_main.c
OBJS   := $(SRCS:.c=.o)

.PHONY: all clean check

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS) $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

check: $(TARGET)
	./$(TARGET)

clean:
	rm -f $(TARGET) $(OBJS)