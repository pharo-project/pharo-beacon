printing
printOn: aStream
	super printOn: aStream.
	aStream 
		nextPutAll: ' sending to '.
	hosts 
		do: [ :each | 
			aStream 
				nextPutAll: each key;
				nextPut: $:;
				nextPutAll: each value asString ]
		separatedBy: [ aStream nextPutAll: ', ' ]