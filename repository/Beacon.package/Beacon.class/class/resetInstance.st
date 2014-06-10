accessing
resetInstance
	instance ifNotNil: [ 
		instance announcer subscriptions reset ].
	instance := nil