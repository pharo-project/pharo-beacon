registration
runDuring: aBlock
	"Make all BeaconSignals go to me during aBlock"

	self start.
	[ aBlock value ]
		ensure: [ self stop ]