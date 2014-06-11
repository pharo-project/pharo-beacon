testing
testStartForOnlyOneSignal
	| beacon |
	beacon := RecordingBeacon new.
	beacon startFor: StringSignal.
	StringSignal log: 'This should be recorded.'.
	CurrentStackSignal log.
	beacon stop.
	self assert: beacon recordings size = 1