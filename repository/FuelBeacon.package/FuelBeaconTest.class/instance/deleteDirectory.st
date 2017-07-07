own services
deleteDirectory
	directory exists ifTrue: [
		directory files do: [ :each | each delete ].
		directory delete ]