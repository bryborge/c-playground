NAME := main
BIN_DIR := bin
BUILD_DIR := build
INCLUDE_DIR := include
OBJ_DIR := $(BUILD_DIR)/obj
SRC_DIR := src
TESTS_DIR := tests

# Source files and dependencies
SRCS := $(wildcard $(SRC_DIR)/*.c)
OBJS := $(SRCS:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)
DEPS := $(OBJS:.o=.d)

# Compiler and flags
CC := clang
LINTER := clang-tidy
FORMATTER := clang-format

# Colors for output
CYAN := \033[36m
GREEN := \033[32m
RESET := \033[0m

# Compiler flags
CFLAGS := -std=gnu17 \
	-D _GNU_SOURCE \
	-D __STDC_WANT_LIB_EXT1__ \
	-Wall \
	-Wextra \
	-pedantic \
	-I$(INCLUDE_DIR) \
	-MMD \
	-MP

# Different build configurations
ifeq ($(BUILD),release)
	CFLAGS += -O2 -DNDEBUG
else
	CFLAGS += -g -O0 -DDEBUG
endif

LDFLAGS := -lm

# Main targets
.PHONY: all clean test format lint check debug release

all: $(BIN_DIR)/$(NAME)

debug: CFLAGS += -g -O0 -DDEBUG
debug: all

release: CFLAGS += -O2 -DNDEBUG
release: all

# Build executable
$(BIN_DIR)/$(NAME): $(OBJS)
	@printf "$(CYAN)Linking executable $(NAME)...$(RESET)\n"
	@mkdir -p $(BIN_DIR)
	@$(CC) $(OBJS) -o $@ $(LDFLAGS)
	@printf "$(GREEN)Build complete!$(RESET)\n"

# Build object files with dependency tracking
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@printf "$(CYAN)Compiling $<...$(RESET)\n"
	@mkdir -p $(OBJ_DIR)
	@$(CC) $(CFLAGS) -c $< -o $@

# Tests
TEST_SRCS := $(wildcard $(TESTS_DIR)/*.c)
TEST_OBJS := $(TEST_SRCS:$(TESTS_DIR)/%.c=$(OBJ_DIR)/%.o)
PROG_OBJS := $(filter-out $(OBJ_DIR)/main.o, $(OBJS))
ALL_TEST_OBJS := $(PROG_OBJS) $(TEST_OBJS)

# Add rule to compile test source files
$(OBJ_DIR)/%.o: $(TESTS_DIR)/%.c
	@printf "$(CYAN)Compiling test $<...$(RESET)\n"
	@mkdir -p $(OBJ_DIR)
	@$(CC) $(CFLAGS) -I$(INCLUDE_DIR) -c $< -o $@

test: $(BIN_DIR)/$(NAME)_test
	@printf "$(CYAN)Running tests...$(RESET)\n"
	@./$(BIN_DIR)/$(NAME)_test
	@printf "$(GREEN)Tests complete!$(RESET)\n"

$(BIN_DIR)/$(NAME)_test: $(ALL_TEST_OBJS)
	@printf "$(CYAN)Linking test executable...$(RESET)\n"
	@mkdir -p $(BIN_DIR)
	@$(CC) $(ALL_TEST_OBJS) -o $@ -lcunit $(LDFLAGS)
	@printf "$(GREEN)Test build complete!$(RESET)\n"

# Code quality
format:
	@printf "$(CYAN)Formatting code...$(RESET)\n"
	@$(FORMATTER) -style=file -i $(SRC_DIR)/* $(INCLUDE_DIR)/* $(TESTS_DIR)/*

lint:
	@printf "$(CYAN)Linting code...$(RESET)\n"
	@$(LINTER) $(SRC_DIR)/* $(INCLUDE_DIR)/* $(TESTS_DIR)/*

check: $(BIN_DIR)/$(NAME)
	@printf "$(CYAN)Running memory checks...$(RESET)\n"
	@valgrind -s --leak-check=full --show-leak-kinds=all ./$< --help
	@valgrind -s --leak-check=full --show-leak-kinds=all ./$< --version
	@valgrind -s --leak-check=full --show-leak-kinds=all ./$< -v

# Cleanup
clean:
	@printf "$(CYAN)Cleaning build files...$(RESET)\n"
	@rm -rf $(BUILD_DIR) $(BIN_DIR)

# Include dependency files
-include $(DEPS)
