# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.18

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /tmp/tmp.GSvadcqACu

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /tmp/tmp.GSvadcqACu/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/example_thread.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/example_thread.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/example_thread.dir/flags.make

CMakeFiles/example_thread.dir/example_thread.cpp.o: CMakeFiles/example_thread.dir/flags.make
CMakeFiles/example_thread.dir/example_thread.cpp.o: ../example_thread.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/tmp.GSvadcqACu/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/example_thread.dir/example_thread.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/example_thread.dir/example_thread.cpp.o -c /tmp/tmp.GSvadcqACu/example_thread.cpp

CMakeFiles/example_thread.dir/example_thread.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/example_thread.dir/example_thread.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /tmp/tmp.GSvadcqACu/example_thread.cpp > CMakeFiles/example_thread.dir/example_thread.cpp.i

CMakeFiles/example_thread.dir/example_thread.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/example_thread.dir/example_thread.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /tmp/tmp.GSvadcqACu/example_thread.cpp -o CMakeFiles/example_thread.dir/example_thread.cpp.s

# Object files for target example_thread
example_thread_OBJECTS = \
"CMakeFiles/example_thread.dir/example_thread.cpp.o"

# External object files for target example_thread
example_thread_EXTERNAL_OBJECTS =

example_thread: CMakeFiles/example_thread.dir/example_thread.cpp.o
example_thread: CMakeFiles/example_thread.dir/build.make
example_thread: thirdpart/libco/libcolib.a
example_thread: CMakeFiles/example_thread.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/tmp/tmp.GSvadcqACu/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable example_thread"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/example_thread.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/example_thread.dir/build: example_thread

.PHONY : CMakeFiles/example_thread.dir/build

CMakeFiles/example_thread.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/example_thread.dir/cmake_clean.cmake
.PHONY : CMakeFiles/example_thread.dir/clean

CMakeFiles/example_thread.dir/depend:
	cd /tmp/tmp.GSvadcqACu/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /tmp/tmp.GSvadcqACu /tmp/tmp.GSvadcqACu /tmp/tmp.GSvadcqACu/cmake-build-debug /tmp/tmp.GSvadcqACu/cmake-build-debug /tmp/tmp.GSvadcqACu/cmake-build-debug/CMakeFiles/example_thread.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/example_thread.dir/depend
