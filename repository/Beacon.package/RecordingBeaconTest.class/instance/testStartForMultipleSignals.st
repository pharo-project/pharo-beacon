testing
testStartForMultipleSignals
	| beacon |
	beacon := RecordingBeacon new.
	beacon startFor: StringSignal, CurrentStackSignal.
	StringSignal log: 'This should be recorded.'.
	CurrentStackSignal log.
	DummySignal new log.
	beacon stop.
	self assert: beacon recordings size = 2