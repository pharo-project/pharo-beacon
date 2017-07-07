accessing
stream
	^ stream ifNil: [ 
		stream := self newStream ] 