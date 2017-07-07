registering
nextPutAll: aCollection
	
	aCollection do: [ :each | self nextPut: each ]