# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra -Iinclude
LDFLAGS = -lm

# Directories
SRC_DIR = src
INCLUDE_DIR = include
BUILD_DIR = build
OBJ_DIR = $(BUILD_DIR)/obj

# Source files and corresponding object files
SRC = $(wildcard $(SRC_DIR)/*.c)
OBJ = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRC))

# Output binary
TARGET = $(BUILD_DIR)/main

# Default rule
all: $(TARGET)

# Link objects into the final binary
$(TARGET): $(OBJ) | $(BUILD_DIR)
	$(CC) $(OBJ) -o $(TARGET) $(LDFLAGS)

# Compile source files into object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Ensure build directories exist
$(BUILD_DIR) $(OBJ_DIR):
	mkdir -p $@

# Clean rule
clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean
