testing
testStartForMultipleSignals
	| beacon |
	beacon := RecordingBeacon new.
	beacon runFor: StringSignal, MethodStackSignal during: [ 
		StringSignal log: 'This should be recorded.'.
		MethodStackSignal log.
		DummySignal new log ].
	self assert: beacon recordings size equals: 2