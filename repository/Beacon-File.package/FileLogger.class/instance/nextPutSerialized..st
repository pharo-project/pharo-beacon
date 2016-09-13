accessing
nextPutSerialized: aString
	super nextPutSerialized: aString.
	self stream nextPut: Character lf