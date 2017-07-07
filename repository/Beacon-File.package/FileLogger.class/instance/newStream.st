accessing
newStream
	| newStream |
	newStream := fileReference writeStream.
	binary ifFalse: [ 
		newStream converter: self converter ].
	^ newStream 