writing
writeMessageFrom: aLog on: aStream
	"the message part is not specified in the syslog protocol and can be any custom message.
	This message is a common format to write a tag/domain, a severity and the text of the message"
	((aLog respondsTo: #tag) and: [ aLog tag notNil ]) ifTrue: [ 
		aStream
			nextPutAll: aLog tag asString;
			nextPutAll: ': ' ].
	aStream
			nextPutAll:  aLog level shortName asUppercase ;
			nextPutAll: ': '.

	self writeEncodedString: aLog message asString on: aStream