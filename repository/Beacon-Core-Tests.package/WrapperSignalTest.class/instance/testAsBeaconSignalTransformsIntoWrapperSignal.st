tests
testAsBeaconSignalTransformsIntoWrapperSignal
	self assert: (42 asBeaconSignal isKindOf: WrapperSignal).
	self assert: 42 asBeaconSignal target equals: 42.
