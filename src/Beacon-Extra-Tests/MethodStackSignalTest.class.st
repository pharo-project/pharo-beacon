"
A CurrentStackSignalTest is xxxxxxxxx.

"
Class {
	#name : 'MethodStackSignalTest',
	#superclass : 'TestCase',
	#category : 'Beacon-Extra-Tests',
	#package : 'Beacon-Extra-Tests'
}

{ #category : 'testing' }
MethodStackSignalTest >> testRemovesIrrelevantStackEntriesFromOnTop [
	| signal |
	signal := MethodStackSignal emit.
	self assert: signal stack first equals: thisContext stack first method asRingDefinition
]
