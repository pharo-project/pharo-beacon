tests
testOneSignalLeadsToOnFile
	StringSignal log: 'test'.
	self assert: directory files size equals: 1