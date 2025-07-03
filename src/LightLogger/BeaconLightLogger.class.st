Class {
	#name : 'BeaconLightLogger',
	#superclass : 'LightLogger',
	#category : 'LightLogger',
	#package : 'LightLogger'
}

{ #category : 'private' }
BeaconLightLogger >> addFilter: aFilter [

	filters ifNil: [ filters := OrderedCollection new ].
	filters add: aFilter
]

{ #category : 'accessing' }
BeaconLightLogger >> disable [
	filters := nil.
	super disable.
	self stopFileLoggers
]

{ #category : 'tracing' }
BeaconLightLogger >> error: error [
	| sender |

	sender := thisContext sender.
	(self isTracing: sender) ifFalse: [ ^ self ].

	(TraceObjectSignal
		fromContext: sender
		object: error)
		traceMessage: 'ERROR';
		emit
]

{ #category : 'accessing - filtering' }
BeaconLightLogger >> filterByClass: aClass [

	self addFilter: (LightFilterClass newClass: aClass)
]

{ #category : 'accessing - filtering' }
BeaconLightLogger >> filterByClasses: aCollection [

	aCollection do: [ :each | self filterByClass: each ]
]

{ #category : 'accessing - filtering' }
BeaconLightLogger >> filterByPackage: aPackageOrSymbol [

	self addFilter: (LightFilterPackage newPackage: aPackageOrSymbol)
]

{ #category : 'accessing - filtering' }
BeaconLightLogger >> filterByPackages: aCollection [
	aCollection do: [ :each | self filterByPackage: each ]
]

{ #category : 'tracing' }
BeaconLightLogger >> info: aString [
	| sender |

	sender := thisContext sender.
	(self isTracing: sender) ifFalse: [ ^ self ].

	(TraceObjectSignal
		fromContext: sender
		object: aString)
		traceMessage: 'INFO';
		emit
]

{ #category : 'testing' }
BeaconLightLogger >> isEnabled [

	^ true
]

{ #category : 'private' }
BeaconLightLogger >> isTracing: aReceiver [

	filters ifNil: [ ^ true ].
	^ filters anySatisfy: [ :each | each isTracing: aReceiver ]
]

{ #category : 'tracing' }
BeaconLightLogger >> object: aVariable [

	(TraceObjectSignal 
		fromContext: thisContext sender
		object: aVariable) 
		emit
]

{ #category : 'accessing - output' }
BeaconLightLogger >> sendToFile: aFile [

	FileLogger new 
		stream: (ZnNewLineWriterStream on: aFile);
		start
]

{ #category : 'accessing - output' }
BeaconLightLogger >> sendToStdout [

	self sendToFile: Stdio stdout
]

{ #category : 'private' }
BeaconLightLogger >> stopFileLoggers [

	FileLogger allInstancesDo: #stop
]

{ #category : 'tracing' }
BeaconLightLogger >> trace [
	"trace method (and line)"
	| sender |

	sender := thisContext sender.
	(self isTracing: sender) ifFalse: [ ^ self ].

	(TraceSignal fromContext: sender) emit
]

{ #category : 'tracing' }
BeaconLightLogger >> trace: anObject [
	| sender |

	sender := thisContext sender.
	(self isTracing: sender) ifFalse: [ ^ self ].
	(TraceObjectSignal
		fromContext: sender
		object: anObject) 
		emit
]

{ #category : 'tracing' }
BeaconLightLogger >> trace: anObject message: messageString [
	| sender |

	sender := thisContext sender.
	(self isTracing: sender) ifFalse: [ ^ self ].

	(TraceObjectSignal
		fromContext: sender
		object: anObject) 
		traceMessage: messageString;
		emit
]

{ #category : 'tracing' }
BeaconLightLogger >> traceStack [
	"trace stack"
	| sender |

	sender := thisContext sender.
	(self isTracing: sender) ifFalse: [ ^ self ].

	(TraceStackSignal fromContext: sender) emit
]

{ #category : 'tracing' }
BeaconLightLogger >> var: aVariable [
	| sender |

	sender := thisContext sender.
	(self isTracing: sender) ifFalse: [ ^ self ].

	(TraceObjectSignal 
		fromContext: sender
		object: aVariable) 
		emit
]

{ #category : 'tracing' }
BeaconLightLogger >> variable: aVariable [
	| sender |

	sender := thisContext sender.
	(self isTracing: sender) ifFalse: [ ^ self ].

	(TraceObjectSignal 
		fromContext: sender
		object: aVariable) 
		emit
]
