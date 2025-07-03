"
Example:
	String streamContents: [ :stream |
		(CustomStreamLogger with: stream)
			runDuring: [ 
				StringSignal emit: 'This is a message'.
				StringSignal emit: 'The red fox jumps over the lazy dog'.
				 ] ]
"
Class {
	#name : 'CustomStreamLogger',
	#superclass : 'StreamLogger',
	#instVars : [
		'stream'
	],
	#category : 'Beacon-SerializingLoggers',
	#package : 'Beacon-SerializingLoggers'
}

{ #category : 'instance creation' }
CustomStreamLogger class >> with: aStream [
	^ self new stream: aStream
]

{ #category : 'accessing' }
CustomStreamLogger >> nextPutSerialized: anObject [
	"Add a linefeed so that we can get a readable string"
	self stream 
		nextPutAll: anObject;
		nextPut: Character lf
]

{ #category : 'accessing' }
CustomStreamLogger >> stream [
	^ stream
]

{ #category : 'accessing' }
CustomStreamLogger >> stream: aStream [
	stream := aStream
]
