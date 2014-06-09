testing
testRunDuringStopsAtTheEnd
	| beacon |
	beacon := RecordingBeacon new.
	beacon runDuring: [ 
		self assert: beacon isRunning ].
	self assert: beacon isRunning not