"
This signal stores the Context objects and like this it is more suitable for reasoning about execution flows that also include information about receivers.

Usage:

[[[
	ContextStackSignal emit
]]]

Full Example:

[[[
	TranscriptLogger new 
		runDuring: [ ContextStackSignal emit ].
]]]
"
Class {
	#name : 'ContextStackSignal',
	#superclass : 'ThisContextSignal',
	#category : 'Beacon-ExtraSignals',
	#package : 'Beacon-ExtraSignals'
}

{ #category : 'initialize' }
ContextStackSignal >> currentStack [
	^ self relevantStackWithoutSelf
]
