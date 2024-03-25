#to compile the project:
# mkdir _build
# cd _build
# cmake -D CMAKE_TOOLCHAIN_FILE=../sys/cmake/riscv-none-elf.cmake ..
# make

cmake_minimum_required(VERSION 3.10)

set(SYS_DIR ${CMAKE_SOURCE_DIR}/../../sys)
include(${SYS_DIR}/cmake/riscv-none-elf.cmake)

#with that, cmake will not try to compile a simple test program
# (that may fail for an embedded target)
set(CMAKE_TRY_COMPILE_TARGET_TYPE "STATIC_LIBRARY")

# set the project name
project(lab2 C)


#application sources
set(SRCS
	${CMAKE_SOURCE_DIR}/main.c
)

include(${SYS_DIR}/cmake/secaim.cmake)
