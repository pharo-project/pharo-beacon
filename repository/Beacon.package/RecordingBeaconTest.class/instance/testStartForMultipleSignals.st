testing
testStartForMultipleSignals
	| beacon |
	beacon := RecordingBeacon new.
	beacon startFor: MessageSignal, CurrentStackSignal.
	MessageSignal log: 'This should be recorded.'.
	CurrentStackSignal log.
	DummySignal new log.
	beacon stop.
	self assert: beacon recordings size = 2