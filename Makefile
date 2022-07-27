PARTS=	bottomMiddle.stl customDrawer.stl connector.stl
OPENSCAD_FLAGS=	--export-format binstl \
				-D drawRaws=4 \
				-D drawCols=1 \
				-D cdrawXCount=2 \
				-D cdrawYCount=1 \
				--render
OPENSCAD_FILE=	ResistorBoxV6.scad

${PARTS}: ${OPENSCAD_FILE}
	openscad ${OPENSCAD_FLAGS} -D part="\"${.TARGET:S/.stl//}\"" -o ${.TARGET} ${OPENSCAD_FILE}

all:	${PARTS}

clean:
	rm -f ${PARTS}

.PHONY: clean all
