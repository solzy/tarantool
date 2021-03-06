# - Find the readline include files and libraries
# - Include finding of termcap or curses
#
# READLINE_FOUND
# READLINE_INCLUDE_DIR
# READLINE_LIBRARIES
#
include(FindTermcap)

FIND_LIBRARY(READLINE_READLINE_LIBRARY NAMES readline)
FIND_PATH(READLINE_INCLUDE_DIR readline/readline.h)
SET(READLINE_FOUND FALSE)

IF (READLINE_READLINE_LIBRARY AND READLINE_INCLUDE_DIR)
	SET (READLINE_FOUND TRUE)
	SET (READLINE_INCLUDE_DIR ${READLINE_INCLUDE_DIR})
	SET (READLINE_LIBRARIES ${READLINE_READLINE_LIBRARY})
	MESSAGE(STATUS "Found GNU readline: ${READLINE_READLINE_LIBRARY}")
	IF (TERMCAP_FOUND)
		SET (READLINE_LIBRARIES ${READLINE_LIBRARIES} ${TERMCAP_LIBRARY})
	ENDIF (TERMCAP_FOUND)
ENDIF (READLINE_READLINE_LIBRARY AND READLINE_INCLUDE_DIR)

MARK_AS_ADVANCED(
	READLINE_FOUND
	READLINE_INCLUDE_DIR
	READLINE_LIBRARIES
	)
