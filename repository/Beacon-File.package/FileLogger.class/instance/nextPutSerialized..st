accessing
nextPutSerialized: aString
self halt.
	super nextPutSerialized: aString.
	self stream nextPut: self lineSeparator 