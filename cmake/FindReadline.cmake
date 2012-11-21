# - Find the readline include files and libraries
# - Include finding of termcap or curses
#
# READLINE_FOUND
# READLINE_INCLUDE_DIR
# READLINE_LIBRARIES
#
include(FindCurses)
include(FindTermcap)

FIND_LIBRARY(READLINE_HISTORY_LIBRARY NAMES history)
FIND_LIBRARY(READLINE_READLINE_LIBRARY NAMES readline)
FIND_PATH(READLINE_INCLUDE_DIR readline/readline.h)
SET(READLINE_FOUND FALSE)

IF (READLINE_HISTORY_LIBRARY AND READLINE_READLINE_LIBRARY AND READLINE_INCLUDE_DIR)
	SET (READLINE_FOUND TRUE)
	IF (CURSES_FOUND)
		SET (READLINE_LIBRARIES ${CURSES_LIBRARIES} ${READLINE_HISTORY_LIBRARY} ${READLINE_READLINE_LIBRARY})
		SET (READLINE_INCLUDE_DIR ${CURSES_INCLUDE_DIR} ${READLINE_INCLUDE_DIR})
		MESSAGE(STATUS "Found GNU readline built with Curses: ${READLINE_HISTORY_LIBRARY}, ${READLINE_READLINE_LIBRARY}")
	ELSE(CURSES_FOUND)
		IF (TERMCAP_FOUND)
			SET (READLINE_LIBRARIES ${TERMCAP_LIBRARY} ${READLINE_HISTORY_LIBRARY} ${READLINE_READLINE_LIBRARY})
			SET (READLINE_INCLUDE_DIR ${TERMCAP_INCLUDE_DIR} ${READLINE_INCLUDE_DIR})
			MESSAGE(STATUS "Found GNU readline built with Termcap: ${READLINE_HISTORY_LIBRARY}, ${READLINE_READLINE_LIBRARY}")
		ENDIF (TERMCAP_FOUND)
	ENDIF(CURSES_FOUND)
ENDIF (READLINE_HISTORY_LIBRARY AND READLINE_READLINE_LIBRARY AND READLINE_INCLUDE_DIR)

MARK_AS_ADVANCED(
	READLINE_FOUND
	READLINE_INCLUDE_DIR
	READLINE_LIBRARIES
	)