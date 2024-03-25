#RISC-V ABI
set(RISCV_OPTIONS -march=rv32i -mabi=ilp32)

#Compilation flags
add_compile_options(
  -std=c99 
  -Os 
  -g 
  -Wall 
  -ffunction-sections 
  ${RISCV_OPTIONS}
)

set ( STACK_SIZE 0xf00 )



#other src files.
add_executable(${PROJECT_NAME}.elf ${SRCS} ${SYS_DIR}/startup.c) 

#Link
set(LINKER_DIR ${SYS_DIR})
set(LINKER_SCRIPT "linkScript.ld")
set_target_properties(${PROJECT_NAME}.elf PROPERTIES LINK_DEPENDS "${LINKER_DIR}/${LINKER_SCRIPT}")

target_link_libraries(${PROJECT_NAME}.elf
	${CPU_OPTIONS}
	${LINKER_FLAGS}
  -nostartfiles
  -Xlinker
  -T${LINKER_DIR}/${LINKER_SCRIPT}
  -Wl,-Map=${PROJECT_NAME}.map
  -march=rv32i
  -mabi=ilp32
)

# hex file 
set(HEXFILE ${PROJECT_NAME}.hex)
add_custom_command(
  OUTPUT ${HEXFILE}
  DEPENDS ${PROJECT_NAME}.elf
  COMMAND ${CMAKE_OBJCOPY} -O ihex  ${PROJECT_NAME}.elf  ${HEXFILE}
  COMMENT "Generate Intel Hex file")

#logisim rom file
add_custom_target(logisim ALL
  DEPENDS ${HEXFILE}
  COMMAND ${SYS_DIR}/hex2logisim.py ${HEXFILE}
  WORKING_DIRECTORY ${CMAKE_BUILD_DIR}
  COMMENT "Generate Logisim dump file")

#output ASM
add_custom_target(asm ALL
  DEPENDS ${PROJECT_NAME}.elf
  COMMAND ${CMAKE_OBJDUMP} -d ${PROJECT_NAME}.elf > ${PROJECT_NAME}.asm
  WORKING_DIRECTORY ${CMAKE_BUILD_DIR}
  COMMENT "Extract asm dump file")

