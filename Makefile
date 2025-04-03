CXX = clang++
CXXFLAGS = -std=c++17 -Wall -Wextra -g
LDFLAGS = -lgtest -lgtest_main -pthread

SRC = src
TEST_DIR = tests
BUILD_DIR = build
OBJ_DIR = $(BUILD_DIR)/obj

SRC_FILES = $(wildcard $(SRC)/*.cpp)
OBJ_FILES = $(patsubst $(SRC)/%.cpp,$(OBJ_DIR)/%.o,$(SRC_FILES))

TEST_FILES = $(wildcard $(TEST_DIR)/*.cpp)
TEST_OBJ_FILES = $(patsubst $(TEST_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(TEST_FILES))

TEST_EXES = $(BUILD_DIR)/runTests

INCLUDES = -I$(SRC)

LIBS = -lgtest -lgtest_main -pthread

all: $(TEST_EXES)

$(OBJ_DIR) $(BUILD_DIR):
	mkdir -p $@

$(OBJ_DIR)/%.o: $(SRC)/%.cpp | $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

$(OBJ_DIR)/%.o: $(TEST_DIR)/%.cpp | $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

$(TEST_EXES): $(OBJ_FILES) $(TEST_OBJ_FILES) | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $^ -o $@ $(LIBS)

test: $(TEST_EXES)
	./$(TEST_EXES)

clean: 
	rm -rf $(BUILD_DIR)

.PHONY: all clean test
