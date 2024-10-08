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
# smoke-test: build
# 	@echo "Running smoke tests..."
# 	@cat input.txt | dotnet run --project $(APP_PROJECT_FILE) > $(SMOKE_TEST_OUTPUT)  # Capture output
# 	@echo "Output:"
# 	@cat $(SMOKE_TEST_OUTPUT)
# 	@if grep -q "Addition: *8 + *2 = *10" $(SMOKE_TEST_OUTPUT) && \
# 	    grep -q "Subtraction: *8 - *2 = *6" $(SMOKE_TEST_OUTPUT) && \
# 	    grep -q "Multiplication: *8 * *2 = *16" $(SMOKE_TEST_OUTPUT) && \
# 	    grep -q "Division: *8 / *2 = *4" $(SMOKE_TEST_OUTPUT); then \
# 	@echo "Smoke test Completed!"; \
# 	fi
smoke-test: build
	@echo "Running smoke tests..."
	@cat input.txt | dotnet run --project $(APP_PROJECT_FILE) > $(SMOKE_TEST_OUTPUT)  # Capture output
	@echo "Output:"
	@cat $(SMOKE_TEST_OUTPUT)
	@RESULT=0; \
	if grep -q "Addition: 8 + 2 = 10" $(SMOKE_TEST_OUTPUT); then \
		echo "Addition test passed"; \
	else \
		echo "Addition test failed"; \
		RESULT=1; \
	fi; \
	if grep -q "Subtraction: 8 - 2 = 6" $(SMOKE_TEST_OUTPUT); then \
		echo "Subtraction test passed"; \
	else \
		echo "Subtraction test failed"; \
		RESULT=1; \
	fi; \
	if grep -q -E "Multiplication:\s*8 \* 2\s*=\s*16" $(SMOKE_TEST_OUTPUT); then \
		echo "Multiplication test passed"; \
	else \
		echo "Multiplication test failed"; \
		echo "Expected: Multiplication: 8 * 2 = 16"; \
		echo "Actual: "; grep "Multiplication" $(SMOKE_TEST_OUTPUT); \
		RESULT=1; \
	fi; \
	if grep -q "Division: 8 / 2 = 4" $(SMOKE_TEST_OUTPUT); then \
		echo "Division test passed"; \
	else \
		echo "Division test failed"; \
		RESULT=1; \
	fi; \
	if [ $$RESULT -eq 0 ]; then \
		echo "Smoke test passed!"; \
	else \
		echo "Smoke test failed!"; \
	fi; \
	echo "Smoke test Completed!"


# Clean target
clean:
	dotnet clean $(APP_PROJECT_FILE)
	dotnet clean $(TEST_PROJECT_FILE)
	rm -rf $(OUTPUT_DIR) $(SMOKE_TEST_OUTPUT)

# Phony targets
.PHONY: all build run clean test smoke-test

