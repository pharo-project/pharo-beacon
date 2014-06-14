*FuelBeacon
printOneLineString
	^ String streamContents: [ :stream |
		self printOneLineOn: stream ]