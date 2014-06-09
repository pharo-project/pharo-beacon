registering
handle: anAnnoucement
	self stream 
		nextPutAll: anAnnoucement printString;
		cr