printing
printOneLineOn: stream
	stream 
		nextPutAll: self timestamp asString;
		space;
		nextPutAll: self class name;
		space.
	self printOneLineContentsOn: stream