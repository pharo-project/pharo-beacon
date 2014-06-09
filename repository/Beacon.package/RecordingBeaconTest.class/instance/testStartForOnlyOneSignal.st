testing
testStartForOnlyOneSignal
	| beacon |
	beacon := RecordingBeacon new.
	beacon startFor: MessageSignal.
	MessageSignal log: 'This should be recorded.'.
	CurrentStackSignal log.
	beacon stop.
	self assert: beacon recordings size = 1