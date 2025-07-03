"
This is an abstract class for all loggers that need to serialize objects. Basically there are two types of loggers: one that stores signals in memory and this which exports signal to the outer world. In order to do that objects need to be serialized in some way.

In order to create a new serializing logger subclasses should overwrite two methods. On the class side overwrite #defaultSerializer to select the SignalSerializer that converts an object to an external representation. Second overwrite #nextPutSerialized:: to transmit the object to the outside world
"
Class {
	#name : 'SerializingLogger',
	#superclass : 'SignalLogger',
	#instVars : [
		'serializer'
	],
	#category : 'Beacon-SerializingLoggers',
	#package : 'Beacon-SerializingLoggers'
}

{ #category : 'defaults' }
SerializingLogger class >> defaultSerializer [

	^ SignalSerializer new
]

{ #category : 'defaults' }
SerializingLogger >> defaultSerializer [
	^ self class defaultSerializer
]

{ #category : 'initialize' }
SerializingLogger >> initialize [ 
	super initialize.
	serializer := self defaultSerializer.
]

{ #category : 'registering' }
SerializingLogger >> nextPut: aSignal [ 

	self nextPutSerialized: (self serializeSignal: aSignal)
]

{ #category : 'operations' }
SerializingLogger >> nextPutSerialized: anObject [
	self subclassResponsibility 
]

{ #category : 'operations' }
SerializingLogger >> serializeSignal: aSignal [
	^ self serializer
		serializeSignal: aSignal
		logger: self
]

{ #category : 'accessing' }
SerializingLogger >> serializer [
	^ serializer ifNil: [ serializer := self defaultSerializer ]  
]

{ #category : 'accessing' }
SerializingLogger >> serializer: aSerializer [
	
	serializer := aSerializer
]
