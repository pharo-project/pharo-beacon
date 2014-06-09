tests
testAsBeaconSignalDoesNotAffectAnExistingSignal
	| signal |
	signal := MessageSignal new.
	self assert: signal asBeaconSignal = signal