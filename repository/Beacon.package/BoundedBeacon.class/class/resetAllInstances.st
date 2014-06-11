accessing
resetAllInstances
	self withAllSubclassesDo: [ :each | each resetInstance ]