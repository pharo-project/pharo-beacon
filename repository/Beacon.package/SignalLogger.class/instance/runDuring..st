registering
runDuring: aBlock
	self start.
	[ aBlock value ]
		ensure: [ self stop ]
