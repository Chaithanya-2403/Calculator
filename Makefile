# Define the names of your projects
APP_NAME = Calculator
TEST_PROJECT = Unit_Test

# Specify the project files
APP_PROJECT_FILE = $(APP_NAME)/$(APP_NAME).csproj
TEST_PROJECT_FILE = $(TEST_PROJECT)/$(TEST_PROJECT).csproj

# Define the output directory
OUTPUT_DIR = bin

# Default target
all: build run

# Build target
build:
	dotnet build $(APP_PROJECT_FILE) -o $(OUTPUT_DIR)

# Run target
run: build
	dotnet $(OUTPUT_DIR)/$(APP_NAME).dll

# Test target
test:
	dotnet test $(TEST_PROJECT_FILE)

# Clean target
clean:
	dotnet clean $(APP_PROJECT_FILE)
	dotnet clean $(TEST_PROJECT_FILE)
	rm -rf $(OUTPUT_DIR)

# Phony targets
.PHONY: all build run clean test
