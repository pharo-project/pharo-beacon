"
This is an abstract logger that forwards to a stream all signals that it receives.
"
Class {
	#name : 'StreamLogger',
	#superclass : 'SerializingLogger',
	#category : 'Beacon-SerializingLoggers',
	#package : 'Beacon-SerializingLoggers'
}

{ #category : 'operations' }
StreamLogger >> nextPutSerialized: anObject [
	
	self stream nextPutAll: anObject
]

{ #category : 'accessing' }
StreamLogger >> stream [
	^ self subclassResponsibility 
]
