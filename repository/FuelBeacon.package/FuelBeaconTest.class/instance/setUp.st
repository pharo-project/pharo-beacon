running
setUp
	directory := FileSystem disk workingDirectory / 'testfuelbeacon'.
	self deleteDirectory.
	directory ensureCreateDirectory.
	fuelBeacon := FuelBeacon on: directory.
	fuelBeacon start