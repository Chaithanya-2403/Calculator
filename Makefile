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

----------------------------------------------------------------------------------

# Define the names of your projects
APP_NAME = Calculator
TEST_PROJECT = Unit_Test

# Specify the project files
APP_PROJECT_FILE = $(APP_NAME)/$(APP_NAME).csproj
TEST_PROJECT_FILE = $(TEST_PROJECT)/$(TEST_PROJECT).csproj

# Define the output directory
OUTPUT_DIR = bin

# Define the smoke test output file
SMOKE_TEST_OUTPUT = smoke_test_output.txt

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

# Smoke test target
smoke-test: build
	@echo "Running smoke tests..."
	@dotnet run --project $(APP_PROJECT_FILE) > $(SMOKE_TEST_OUTPUT)  # Capture output
	@tail -n 10 $(SMOKE_TEST_OUTPUT)  # Display last 10 lines for verification
	@if grep -q "expected output" $(SMOKE_TEST_OUTPUT); then \
		echo "Smoke test passed!"; \
	else \
		echo "Smoke test failed!"; \
	fi

# Clean target
clean:
	dotnet clean $(APP_PROJECT_FILE)
	dotnet clean $(TEST_PROJECT_FILE)
	rm -rf $(OUTPUT_DIR) $(SMOKE_TEST_OUTPUT)

# Phony targets
.PHONY: all build run clean test smoke-test

