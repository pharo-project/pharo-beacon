"
A CustomStreamLoggerTest is xxxxxxxxx.

"
Class {
	#name : 'CustomStreamLoggerTest',
	#superclass : 'TestCase',
	#category : 'Beacon-Extra-Tests',
	#package : 'Beacon-Extra-Tests'
}

{ #category : 'tests' }
CustomStreamLoggerTest >> testLoggingAffectsTheStream [
	| loggedResult |
	loggedResult := String streamContents: [ :stream |
		(CustomStreamLogger with: stream)
			runDuring: [ 
				StringSignal emit: 'This is a message' ] ].
	self assert: loggedResult lines size equals: 1
]
