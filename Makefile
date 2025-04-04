
CXX = g++ -g -O0
CXXFLAGS = -Wall
LDFLAGS =

SRC = webwindow.cxx

TARGET = webwindow

ROOT_CXX_FLAGS = $(shell root-config --cflags)
ROOT_LD_FLAGS = $(shell root-config --ldflags --glibs) -lROOTWebDisplay -lWebGui6

INCDIR =
INCLUDES := $(foreach inc,$(INCDIR),-I $(inc))

LIBDIR =
LIBDIRS := $(foreach libdir,$(LIBDIR),-L $(libdir))

all: $(TARGET)

$(TARGET): $(SRC)
	$(CXX) $< -o $@ ${INCLUDES} ${ROOT_CXX_FLAGS} ${CXXFLAGS} ${LDFLAGS} ${LIBDIRS} ${ROOT_LD_FLAGS}

# Clean up object files and executable
clean:
	rm -rf $(TARGET)

.PHONY: all clean format
