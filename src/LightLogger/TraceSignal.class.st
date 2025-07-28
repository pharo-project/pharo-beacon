Class {
	#name : 'TraceSignal',
	#superclass : 'BeaconSignal',
	#instVars : [
		'senderClass',
		'senderSelector',
		'sourcePosition'
	],
	#category : 'LightLogger',
	#package : 'LightLogger'
}

{ #category : 'instance creation' }
TraceSignal class >> fromContext: aContext [

	^ self new fromContext: aContext
]

{ #category : 'private' }
TraceSignal >> calculatePosition: aContext [ 
	| start currentIndex |

	currentIndex := 1.
	start := aContext sourceNodeExecuted start.
	aContext method sourceCode lines withIndexDo: [ :line :lineNumber |
		| lineLength |
		lineLength := line size + 1.
		(currentIndex + lineLength - 1) >= start 
			ifTrue: [ ^ { lineNumber. start - currentIndex + 1. start } ].
		currentIndex := currentIndex + lineLength ].
	
	self error: 'Should not arrive here'
]

{ #category : 'initialization' }
TraceSignal >> fromContext: aContext [

	senderClass := aContext methodClass.
	senderSelector := aContext selector.
	sourcePosition := self calculatePosition: aContext
]

{ #category : 'printing' }
TraceSignal >> printOneLineContentsOn: stream [

	stream 
		<< self senderClass name  << '>>#' << self senderSelector 
		<< '@';
			print: self sourcePosition first
]

{ #category : 'printing' }
TraceSignal >> printOneLineOn: stream [

	self timestamp printYMDOn: stream.
	stream space.
	self timestamp rounded printHMSOn: stream.
	stream space.
	stream nextPutAll: (self signalName padRightTo: 10).
	stream space.

	self printOneLineContentsOn: stream
]

{ #category : 'accessing' }
TraceSignal >> senderClass [

	^ senderClass
]

{ #category : 'accessing' }
TraceSignal >> senderSelector [

	^ senderSelector
]

{ #category : 'accessing' }
TraceSignal >> signalName [

	^ 'trace'
]

{ #category : 'accessing' }
TraceSignal >> sourcePosition [

	^ sourcePosition
]
