writing
writeTimestamp: aDateAndTime on: aStream
	|  dayOfMonth |
	dayOfMonth := aDateAndTime dayOfMonth .
	aStream 
		nextPutAll: aDateAndTime monthAbbreviation;
		nextPut: Character space;
		nextPutAll: (dayOfMonth asString padLeftTo: 2);
			nextPut: Character space.
		aDateAndTime rounded asTime print24: true on: aStream.