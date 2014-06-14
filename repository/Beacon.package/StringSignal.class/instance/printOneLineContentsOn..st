printing
printOneLineContentsOn: stream
	super printOneLineContentsOn: stream.
	stream 
		space;
		nextPutAll: self message