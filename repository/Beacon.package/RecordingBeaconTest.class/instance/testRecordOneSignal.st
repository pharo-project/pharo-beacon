testing
testRecordOneSignal
	| beacon |
	beacon := RecordingBeacon new 
					runDuring: [ StringSignal log: 'test' ].
	self assert: beacon recordings size = 1.
	self assert: beacon recordings first message = 'test'