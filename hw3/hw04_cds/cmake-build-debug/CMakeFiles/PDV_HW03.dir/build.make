# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.21

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
CMAKE_COMMAND = /snap/clion/180/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /snap/clion/180/bin/cmake/linux/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/remelvic/studium/4.semestr/pdv/hw3/hw04_cds

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/remelvic/studium/4.semestr/pdv/hw3/hw04_cds/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/PDV_HW03.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/PDV_HW03.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/PDV_HW03.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/PDV_HW03.dir/flags.make

CMakeFiles/PDV_HW03.dir/main.cpp.o: CMakeFiles/PDV_HW03.dir/flags.make
CMakeFiles/PDV_HW03.dir/main.cpp.o: ../main.cpp
CMakeFiles/PDV_HW03.dir/main.cpp.o: CMakeFiles/PDV_HW03.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/remelvic/studium/4.semestr/pdv/hw3/hw04_cds/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/PDV_HW03.dir/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/PDV_HW03.dir/main.cpp.o -MF CMakeFiles/PDV_HW03.dir/main.cpp.o.d -o CMakeFiles/PDV_HW03.dir/main.cpp.o -c /home/remelvic/studium/4.semestr/pdv/hw3/hw04_cds/main.cpp

CMakeFiles/PDV_HW03.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/PDV_HW03.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/remelvic/studium/4.semestr/pdv/hw3/hw04_cds/main.cpp > CMakeFiles/PDV_HW03.dir/main.cpp.i

CMakeFiles/PDV_HW03.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/PDV_HW03.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/remelvic/studium/4.semestr/pdv/hw3/hw04_cds/main.cpp -o CMakeFiles/PDV_HW03.dir/main.cpp.s

CMakeFiles/PDV_HW03.dir/bst_tree.cpp.o: CMakeFiles/PDV_HW03.dir/flags.make
CMakeFiles/PDV_HW03.dir/bst_tree.cpp.o: ../bst_tree.cpp
CMakeFiles/PDV_HW03.dir/bst_tree.cpp.o: CMakeFiles/PDV_HW03.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/remelvic/studium/4.semestr/pdv/hw3/hw04_cds/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/PDV_HW03.dir/bst_tree.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/PDV_HW03.dir/bst_tree.cpp.o -MF CMakeFiles/PDV_HW03.dir/bst_tree.cpp.o.d -o CMakeFiles/PDV_HW03.dir/bst_tree.cpp.o -c /home/remelvic/studium/4.semestr/pdv/hw3/hw04_cds/bst_tree.cpp

CMakeFiles/PDV_HW03.dir/bst_tree.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/PDV_HW03.dir/bst_tree.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/remelvic/studium/4.semestr/pdv/hw3/hw04_cds/bst_tree.cpp > CMakeFiles/PDV_HW03.dir/bst_tree.cpp.i

CMakeFiles/PDV_HW03.dir/bst_tree.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/PDV_HW03.dir/bst_tree.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/remelvic/studium/4.semestr/pdv/hw3/hw04_cds/bst_tree.cpp -o CMakeFiles/PDV_HW03.dir/bst_tree.cpp.s

# Object files for target PDV_HW03
PDV_HW03_OBJECTS = \
"CMakeFiles/PDV_HW03.dir/main.cpp.o" \
"CMakeFiles/PDV_HW03.dir/bst_tree.cpp.o"

# External object files for target PDV_HW03
PDV_HW03_EXTERNAL_OBJECTS =

PDV_HW03: CMakeFiles/PDV_HW03.dir/main.cpp.o
PDV_HW03: CMakeFiles/PDV_HW03.dir/bst_tree.cpp.o
PDV_HW03: CMakeFiles/PDV_HW03.dir/build.make
PDV_HW03: /usr/lib/gcc/x86_64-linux-gnu/9/libgomp.so
PDV_HW03: /usr/lib/x86_64-linux-gnu/libpthread.so
PDV_HW03: CMakeFiles/PDV_HW03.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/remelvic/studium/4.semestr/pdv/hw3/hw04_cds/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable PDV_HW03"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/PDV_HW03.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/PDV_HW03.dir/build: PDV_HW03
.PHONY : CMakeFiles/PDV_HW03.dir/build

CMakeFiles/PDV_HW03.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/PDV_HW03.dir/cmake_clean.cmake
.PHONY : CMakeFiles/PDV_HW03.dir/clean

CMakeFiles/PDV_HW03.dir/depend:
	cd /home/remelvic/studium/4.semestr/pdv/hw3/hw04_cds/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/remelvic/studium/4.semestr/pdv/hw3/hw04_cds /home/remelvic/studium/4.semestr/pdv/hw3/hw04_cds /home/remelvic/studium/4.semestr/pdv/hw3/hw04_cds/cmake-build-debug /home/remelvic/studium/4.semestr/pdv/hw3/hw04_cds/cmake-build-debug /home/remelvic/studium/4.semestr/pdv/hw3/hw04_cds/cmake-build-debug/CMakeFiles/PDV_HW03.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/PDV_HW03.dir/depend

