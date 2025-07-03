"
Root of log formatters.

in essence a subclass should answer differently to 
	
	serializeSignal: aSignal logger: aLogger 

and you get a new formatter.	
	
	serializeSignal: aSignal on: aStream logger: aLogger 
	
will be useful to call into for writing to a given stream of the logger
	

"
Class {
	#name : 'SignalSerializer',
	#superclass : 'Object',
	#category : 'Beacon-SerializingLoggers',
	#package : 'Beacon-SerializingLoggers'
}

{ #category : 'serializing' }
SignalSerializer >> serializeSignal: aSignal logger: aLogger [ 

	^ aSignal printString
]

{ #category : 'serializing' }
SignalSerializer >> serializeSignal: aSignal on: aStream logger: aLogger [ 

	aSignal printOn: aStream.
	aStream cr
]
