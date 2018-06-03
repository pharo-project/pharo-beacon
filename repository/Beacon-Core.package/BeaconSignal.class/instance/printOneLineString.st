printing
printOneLineString
	^ String streamContents: [:stream | self printOneLineOn: stream]