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
CMAKE_COMMAND = /snap/clion/184/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /snap/clion/184/bin/cmake/linux/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/remelvic/studium/4.semestr/pdv/hw04/hw05_database

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/remelvic/studium/4.semestr/pdv/hw04/hw05_database/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/DatabaseQueries.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/DatabaseQueries.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/DatabaseQueries.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/DatabaseQueries.dir/flags.make

CMakeFiles/DatabaseQueries.dir/main.cpp.o: CMakeFiles/DatabaseQueries.dir/flags.make
CMakeFiles/DatabaseQueries.dir/main.cpp.o: ../main.cpp
CMakeFiles/DatabaseQueries.dir/main.cpp.o: CMakeFiles/DatabaseQueries.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/remelvic/studium/4.semestr/pdv/hw04/hw05_database/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/DatabaseQueries.dir/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/DatabaseQueries.dir/main.cpp.o -MF CMakeFiles/DatabaseQueries.dir/main.cpp.o.d -o CMakeFiles/DatabaseQueries.dir/main.cpp.o -c /home/remelvic/studium/4.semestr/pdv/hw04/hw05_database/main.cpp

CMakeFiles/DatabaseQueries.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/DatabaseQueries.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/remelvic/studium/4.semestr/pdv/hw04/hw05_database/main.cpp > CMakeFiles/DatabaseQueries.dir/main.cpp.i

CMakeFiles/DatabaseQueries.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/DatabaseQueries.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/remelvic/studium/4.semestr/pdv/hw04/hw05_database/main.cpp -o CMakeFiles/DatabaseQueries.dir/main.cpp.s

CMakeFiles/DatabaseQueries.dir/_generator/generator.cpp.o: CMakeFiles/DatabaseQueries.dir/flags.make
CMakeFiles/DatabaseQueries.dir/_generator/generator.cpp.o: ../_generator/generator.cpp
CMakeFiles/DatabaseQueries.dir/_generator/generator.cpp.o: CMakeFiles/DatabaseQueries.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/remelvic/studium/4.semestr/pdv/hw04/hw05_database/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/DatabaseQueries.dir/_generator/generator.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/DatabaseQueries.dir/_generator/generator.cpp.o -MF CMakeFiles/DatabaseQueries.dir/_generator/generator.cpp.o.d -o CMakeFiles/DatabaseQueries.dir/_generator/generator.cpp.o -c /home/remelvic/studium/4.semestr/pdv/hw04/hw05_database/_generator/generator.cpp

CMakeFiles/DatabaseQueries.dir/_generator/generator.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/DatabaseQueries.dir/_generator/generator.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/remelvic/studium/4.semestr/pdv/hw04/hw05_database/_generator/generator.cpp > CMakeFiles/DatabaseQueries.dir/_generator/generator.cpp.i

CMakeFiles/DatabaseQueries.dir/_generator/generator.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/DatabaseQueries.dir/_generator/generator.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/remelvic/studium/4.semestr/pdv/hw04/hw05_database/_generator/generator.cpp -o CMakeFiles/DatabaseQueries.dir/_generator/generator.cpp.s

# Object files for target DatabaseQueries
DatabaseQueries_OBJECTS = \
"CMakeFiles/DatabaseQueries.dir/main.cpp.o" \
"CMakeFiles/DatabaseQueries.dir/_generator/generator.cpp.o"

# External object files for target DatabaseQueries
DatabaseQueries_EXTERNAL_OBJECTS =

DatabaseQueries: CMakeFiles/DatabaseQueries.dir/main.cpp.o
DatabaseQueries: CMakeFiles/DatabaseQueries.dir/_generator/generator.cpp.o
DatabaseQueries: CMakeFiles/DatabaseQueries.dir/build.make
DatabaseQueries: /usr/lib/gcc/x86_64-linux-gnu/9/libgomp.so
DatabaseQueries: /usr/lib/x86_64-linux-gnu/libpthread.so
DatabaseQueries: CMakeFiles/DatabaseQueries.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/remelvic/studium/4.semestr/pdv/hw04/hw05_database/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable DatabaseQueries"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/DatabaseQueries.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/DatabaseQueries.dir/build: DatabaseQueries
.PHONY : CMakeFiles/DatabaseQueries.dir/build

CMakeFiles/DatabaseQueries.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/DatabaseQueries.dir/cmake_clean.cmake
.PHONY : CMakeFiles/DatabaseQueries.dir/clean

CMakeFiles/DatabaseQueries.dir/depend:
	cd /home/remelvic/studium/4.semestr/pdv/hw04/hw05_database/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/remelvic/studium/4.semestr/pdv/hw04/hw05_database /home/remelvic/studium/4.semestr/pdv/hw04/hw05_database /home/remelvic/studium/4.semestr/pdv/hw04/hw05_database/cmake-build-debug /home/remelvic/studium/4.semestr/pdv/hw04/hw05_database/cmake-build-debug /home/remelvic/studium/4.semestr/pdv/hw04/hw05_database/cmake-build-debug/CMakeFiles/DatabaseQueries.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/DatabaseQueries.dir/depend

