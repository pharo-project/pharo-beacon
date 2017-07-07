tests
testAsBeaconSignalDoesNotAffectAnExistingSignal
	| signal |
	signal := StringSignal new.
	self assert: signal asBeaconSignal = signal