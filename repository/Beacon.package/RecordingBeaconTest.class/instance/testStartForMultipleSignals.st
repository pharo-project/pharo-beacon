testing
testStartForMultipleSignals
	| beacon |
	beacon := RecordingBeacon new.
	beacon runFor: StringSignal, StackSignal during: [ 
		StringSignal log: 'This should be recorded.'.
		StackSignal log.
		DummySignal new log ].
	self assert: beacon recordings size equals: 2