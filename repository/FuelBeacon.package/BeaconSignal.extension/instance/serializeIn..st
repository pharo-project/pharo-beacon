*FuelBeacon
serializeIn: aDirectoryReference 
	"Serializes the current signal into a fuel file named based on 
	the one line printout. Given that the one liner contains the 
	timestamp, it becomes unique"
	FLSerializer 
		serialize: self 
		toFileNamed: (aDirectoryReference / self printOneLineString , 'fuel') fullName