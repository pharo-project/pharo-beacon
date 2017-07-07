tests
testTwoSignalsLeadToTwoFiles
	StringSignal log: 'test'.
	StringSignal log: 'test2'.
	self assert: directory files size equals: 2