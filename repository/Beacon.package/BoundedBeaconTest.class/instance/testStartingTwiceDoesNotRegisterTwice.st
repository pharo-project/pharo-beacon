tests
testStartingTwiceDoesNotRegisterTwice
	Beacon resetInstance.
	BoundedBeacon start.
	BoundedBeacon start.
	self assert: Beacon instance announcer numberOfSubscriptions = 1.
	BoundedBeacon stop.
	self assert: Beacon instance announcer numberOfSubscriptions = 0