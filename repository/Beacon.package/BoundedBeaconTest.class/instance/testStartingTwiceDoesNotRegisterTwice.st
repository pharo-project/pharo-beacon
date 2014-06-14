tests
testStartingTwiceDoesNotRegisterTwice
	| initialNumberOfSubscriptions |
	initialNumberOfSubscriptions := Beacon instance announcer numberOfSubscriptions.
	BoundedBeacon resetInstance.
	BoundedBeacon start.
	BoundedBeacon start.
	self 
		assert: Beacon instance announcer numberOfSubscriptions 
		equals: initialNumberOfSubscriptions + 1.
	BoundedBeacon stop.
	self 
		assert: Beacon instance announcer numberOfSubscriptions 
		equals: initialNumberOfSubscriptions