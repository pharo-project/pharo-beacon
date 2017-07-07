registering
runDuring: aBlock
	"make all BeaconSignals go to me during aBlock"
	self start.
	[ aBlock value ]
		ensure: [ self stop ]
