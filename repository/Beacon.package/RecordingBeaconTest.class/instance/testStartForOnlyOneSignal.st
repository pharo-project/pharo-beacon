testing
testStartForOnlyOneSignal
	| beacon |
	beacon := RecordingBeacon new.
	beacon runFor: StringSignal during: [ 
		StringSignal log: 'This should be recorded.'.
		StackSignal log ].
	self assert: beacon recordings size equals: 1