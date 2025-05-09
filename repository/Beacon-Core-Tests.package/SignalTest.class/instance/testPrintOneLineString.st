tests
testPrintOneLineString
	| signal |
	signal := BeaconSignal new.
	self assert: (' ' split: signal printOneLineString) second equals: 'BeaconSignal'