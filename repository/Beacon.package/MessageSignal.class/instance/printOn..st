printing
printOn: stream
	super printOn: stream.
	stream 
		space;
		nextPutAll: self message