printing
printOneLineOn: stream
	super printOneLineOn: stream.
	stream 
		space;
		nextPutAll: self message