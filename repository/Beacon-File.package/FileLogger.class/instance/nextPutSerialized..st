accessing
nextPutSerialized: aString
	super nextPutSerialized: aString.
	self stream nextPut: self lineSeparator 