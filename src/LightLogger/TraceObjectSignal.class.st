Class {
	#name : 'TraceObjectSignal',
	#superclass : 'TraceSignal',
	#instVars : [
		'object',
		'traceName',
		'traceMessage'
	],
	#category : 'LightLogger',
	#package : 'LightLogger'
}

{ #category : 'instance creation' }
TraceObjectSignal class >> fromContext: aContext [
	| node |

	node := aContext sourceNodeExecuted arguments first.
	^ (self signalClassFor: node) new 
		fromContext: aContext 
		node: node
]

{ #category : 'instance creation' }
TraceObjectSignal class >> fromContext: aContext object: anObject [

	^ (self fromContext: aContext)
		object: anObject;
		yourself
]

{ #category : 'instance creation' }
TraceObjectSignal class >> signalClassFor: aNode [

	^ TraceSignalVisitor new visit: aNode
]

{ #category : 'initialization' }
TraceObjectSignal >> fromContext: aContext node: aNode [

	self fromContext: aContext
]

{ #category : 'accessing' }
TraceObjectSignal >> object [

	^ object
]

{ #category : 'initialization' }
TraceObjectSignal >> object: anObject [

	object := anObject
]

{ #category : 'printing' }
TraceObjectSignal >> printOneLineContentsOn: stream [ 

	super printOneLineContentsOn: stream.
	
	traceMessage ifNotNil: [
		stream space. 
		stream << traceMessage ].
	stream space.
	self traceName ifNotNil: [ :aName | 
		stream << aName << '=' ].
	stream print: self object
]

{ #category : 'accessing' }
TraceObjectSignal >> traceMessage [

	^ traceMessage
]

{ #category : 'accessing' }
TraceObjectSignal >> traceMessage: anObject [

	traceMessage := anObject
]

{ #category : 'accessing' }
TraceObjectSignal >> traceName [

	^ traceName
]

{ #category : 'accessing' }
TraceObjectSignal >> traceName: anObject [

	traceName := anObject
]
