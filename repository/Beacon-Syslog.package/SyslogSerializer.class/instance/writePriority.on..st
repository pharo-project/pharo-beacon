writing
writePriority: aNumber on: aStream
	aStream 
		nextPut: $< ;
		nextPutAll: aNumber asString;
		nextPut: $> 