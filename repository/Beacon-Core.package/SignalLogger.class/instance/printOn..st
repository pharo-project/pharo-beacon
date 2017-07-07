printing
printOn: aStream
	super printOn: aStream.
	aStream 
		nextPutAll: ' named: ';
		nextPutAll: name asString