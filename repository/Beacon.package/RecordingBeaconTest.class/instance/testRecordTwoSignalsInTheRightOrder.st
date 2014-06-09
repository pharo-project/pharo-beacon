testing
testRecordTwoSignalsInTheRightOrder
	| beacon |
	beacon := RecordingBeacon new 
					runDuring: [ 
						MessageSignal log: 'test1'.
						MessageSignal log: 'test2' ].
	self assert: beacon recordings size = 2.
	self assert: beacon recordings first message = 'test1'.
	self assert: beacon recordings last message = 'test2'