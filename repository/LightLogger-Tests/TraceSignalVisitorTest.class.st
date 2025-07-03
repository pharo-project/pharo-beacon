Class {
	#name : 'TraceSignalVisitorTest',
	#superclass : 'TestCase',
	#instVars : [
		'logger'
	],
	#category : 'LightLogger-Tests',
	#package : 'LightLogger-Tests'
}

{ #category : 'as yet unclassified' }
TraceSignalVisitorTest >> message [

	^ 42
]

{ #category : 'running' }
TraceSignalVisitorTest >> setUp [
	super setUp.

	logger := EmptyLightLogger uniqueInstance
]

{ #category : 'as yet unclassified' }
TraceSignalVisitorTest >> testKeywordMessage [
	| node signalClass |
	
	logger trace: $a -> $b.
	
	node := thisContext method ast body statements first arguments first.
	signalClass := TraceSignalVisitor new visit: node.
	self assert: signalClass equals: TraceMessageSignal
]

{ #category : 'as yet unclassified' }
TraceSignalVisitorTest >> testLiteral [
	| node signalClass |
	
	logger trace: 42.
	
	node := thisContext method ast body statements first arguments first.
	signalClass := TraceSignalVisitor new visit: node.
	self assert: signalClass equals: TraceLiteralSignal
]

{ #category : 'as yet unclassified' }
TraceSignalVisitorTest >> testMessage [
	| node signalClass |
	
	logger trace: self message.
	
	node := thisContext method ast body statements first arguments first.
	signalClass := TraceSignalVisitor new visit: node.
	self assert: signalClass equals: TraceMessageSignal
]

{ #category : 'as yet unclassified' }
TraceSignalVisitorTest >> testUnaryMessage [
	| node signalClass |
	
	logger trace: true not.
	
	node := thisContext method ast body statements first arguments first.
	signalClass := TraceSignalVisitor new visit: node.
	self assert: signalClass equals: TraceMessageSignal
]

{ #category : 'as yet unclassified' }
TraceSignalVisitorTest >> testVariable [
	| var node signalClass |
	
	var := 42.
	logger trace: var.
	
	node := thisContext method ast body statements second arguments first.
	signalClass := TraceSignalVisitor new visit: node.
	self assert: signalClass equals: TraceVariableSignal
]
