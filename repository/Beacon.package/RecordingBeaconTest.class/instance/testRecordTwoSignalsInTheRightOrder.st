testing
testRecordTwoSignalsInTheRightOrder
	| beacon |
	beacon := RecordingBeacon new 
					runDuring: [ 
						MessageSignal log: 'test1'.
						MessageSignal log: 'test2' ].
	self assert: beacon recordedAnnouncements size = 2.
	self assert: beacon recordedAnnouncements first message = 'test1'.
	self assert: beacon recordedAnnouncements last message = 'test2'