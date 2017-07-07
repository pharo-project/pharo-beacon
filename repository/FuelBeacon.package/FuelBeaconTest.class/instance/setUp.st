running
setUp
	directory := FileSystem disk workingDirectory / 'testfuelbeacon'.
	self deleteDirectory.
	directory ensureCreateDirectory.
	fuelBeacon := FuelLogger on: directory.
	fuelBeacon start