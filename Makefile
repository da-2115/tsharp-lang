# Makefile for tsharp (C++17 + ANTLR4 runtime via Homebrew)

# Compiler and flags
CXX ?= clang++
CXXFLAGS ?= -std=c++17 -O2 -g -Wall -Wextra -MMD -MP

# Detect Homebrew ANTLR4 C++ runtime installation
ANTLR4_PREFIX := $(shell brew --prefix antlr4-cpp-runtime 2>/dev/null)
# Fallbacks in case brew --prefix does not return (common macOS locations)
ifeq ($(ANTLR4_PREFIX),)
  ANTLR4_PREFIX := /opt/homebrew/opt/antlr4-cpp-runtime
endif

# Include paths
INCLUDE_DIRS := include gen src $(ANTLR4_PREFIX)/include $(ANTLR4_PREFIX)/include/antlr4-runtime
CPPFLAGS := $(addprefix -I,$(INCLUDE_DIRS))

# Linker flags for ANTLR4
LDFLAGS += -L$(ANTLR4_PREFIX)/lib
LDLIBS += -lantlr4-runtime

# Source and build layout
SRCDIRS := . gen src
SOURCES := $(wildcard $(SRCDIRS:%=%/*.cpp))
BUILD_DIR := build
BINARY := tsharp

# Object/dependency files mirror source tree under build/
OBJECTS := $(patsubst %.cpp,$(BUILD_DIR)/%.o,$(SOURCES))
DEPS := $(OBJECTS:.o=.d)

# Default target
.PHONY: all
all: $(BINARY)

# Link final executable
$(BINARY): $(OBJECTS)
	$(CXX) $(OBJECTS) $(LDFLAGS) $(LDLIBS) -o $@

# Compile .cpp to .o with auto-include of headers
$(BUILD_DIR)/%.o: %.cpp
	@mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) -c $< -o $@

# Dependency includes
-include $(DEPS)

# Convenience targets
.PHONY: clean run print-config
clean:
	rm -rf $(BUILD_DIR) $(BINARY)

# Run the built binary with optional ARGS: make run ARGS="..."
run: $(BINARY)
	./$(BINARY) $(ARGS)

# Show detected configuration
print-config:
	@echo "CXX=$(CXX)"
	@echo "CXXFLAGS=$(CXXFLAGS)"
	@echo "ANTLR4_PREFIX=$(ANTLR4_PREFIX)"
	@echo "CPPFLAGS=$(CPPFLAGS)"
	@echo "LDFLAGS=$(LDFLAGS)"
	@echo "LDLIBS=$(LDLIBS)"
	@echo "SOURCES=$(SOURCES)"
	@echo "OBJECTS=$(OBJECTS)"