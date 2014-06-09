testing
testRecordOneSignal
	| beacon |
	beacon := RecordingBeacon new 
					runDuring: [ MessageSignal log: 'test' ].
	self assert: beacon recordedAnnouncements size = 1.
	self assert: beacon recordedAnnouncements first message = 'test'