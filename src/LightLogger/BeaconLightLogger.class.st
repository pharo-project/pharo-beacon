Class {
	#name : 'BeaconLightLogger',
	#superclass : 'LightLogger',
	#instVars : [
		'filters',
		'logLevel'
	],
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

{ #category : 'tracing - donotuse' }
BeaconLightLogger >> error: error [
	| sender |
	logLevel >= 3 ifFalse: [ ^ self ].

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
	logLevel >= 1 ifFalse: [ ^ self ].
	sender := thisContext sender.
	(self isTracing: sender) ifFalse: [ ^ self ].

	(InfoSignal
		fromContext: sender
		message: aString)
		emit
]

{ #category : 'initialization' }
BeaconLightLogger >> initialize [

	super initialize.
	self logLevelTrace
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

{ #category : 'accessing - loglevel' }
BeaconLightLogger >> logLevelInfo [

	logLevel := 1
]

{ #category : 'accessing - loglevel' }
BeaconLightLogger >> logLevelTrace [

	logLevel := 3
]

{ #category : 'accessing - loglevel' }
BeaconLightLogger >> logLevelWarning [

	logLevel := 2
]

{ #category : 'tracing - donotuse' }
BeaconLightLogger >> object: aVariable [
	logLevel >= 3 ifFalse: [ ^ self ].

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
	logLevel >= 3 ifFalse: [ ^ self ].

	sender := thisContext sender.
	(self isTracing: sender) ifFalse: [ ^ self ].

	(TraceSignal fromContext: sender) emit
]

{ #category : 'tracing' }
BeaconLightLogger >> trace: anObject [
	| sender |
	logLevel >= 3 ifFalse: [ ^ self ].

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
	logLevel >= 3 ifFalse: [ ^ self ].

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
	logLevel >= 3 ifFalse: [ ^ self ].

	sender := thisContext sender.
	(self isTracing: sender) ifFalse: [ ^ self ].

	(TraceStackSignal fromContext: sender) emit
]

{ #category : 'tracing - donotuse' }
BeaconLightLogger >> var: aVariable [
	| sender |
	logLevel >= 3 ifFalse: [ ^ self ].

	sender := thisContext sender.
	(self isTracing: sender) ifFalse: [ ^ self ].

	(TraceObjectSignal 
		fromContext: sender
		object: aVariable) 
		emit
]

{ #category : 'tracing - donotuse' }
BeaconLightLogger >> variable: aVariable [
	| sender |
	logLevel >= 3 ifFalse: [ ^ self ].

	sender := thisContext sender.
	(self isTracing: sender) ifFalse: [ ^ self ].

	(TraceObjectSignal 
		fromContext: sender
		object: aVariable) 
		emit
]

{ #category : 'tracing' }
BeaconLightLogger >> warning: aString [
	| sender |
	logLevel >= 2 ifFalse: [ ^ self ].

	sender := thisContext sender.
	(self isTracing: sender) ifFalse: [ ^ self ].

	(WarningSignal
		fromContext: sender
		message: aString)
		emit
]
