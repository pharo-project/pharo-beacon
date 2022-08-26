accessing
newStream
	| newStream |
	newStream := fileReference writeStream.
	binary ifFalse: [ 
		newStream encoder: self encoder ].
	^ newStream 
