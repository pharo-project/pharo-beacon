*FuelBeacon
serializeToFile: aFileReference
	FLSerializer 
		serialize: self objectToSerialize
		toFileNamed: aFileReference fullName