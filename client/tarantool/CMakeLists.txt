project(tnt_cli)
set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/" ${CMAKE_MODULE_PATH})

include(FindReadline)

if (NOT READLINE_FOUND)
    message(FATAL_ERROR "readline library not found.")
endif()

set (cli "tarantool")
set (cli_sources tc.c tc_opt.c tc_admin.c tc_query.c tc_print.c tc_buf.c
                 tc_cli.c tc_store.c tc_print_xlog.c tc_print_snap.c)

set (cli_libs tntrpl tntnet tntsql tnt gopt ${READLINE_LIBRARIES})

include_directories(${READLINE_INCLUDE_DIR})

list(APPEND cli_sources ${CMAKE_SOURCE_DIR}/src/errcode.c)

add_executable(${cli} ${cli_sources})
set_source_files_compile_flags("TARANTOOL" ${cli_sources})
target_link_libraries (${cli} ${cli_libs})

install (TARGETS ${cli} DESTINATION bin)
