as yet unclassified
printOneLineOn: stream
	super printOneLineOn: stream.
	stream 
		space;
		nextPutAll: self message