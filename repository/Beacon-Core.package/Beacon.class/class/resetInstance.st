private - initialization
resetInstance

	Instance ifNotNil: [
		Instance announcer subscriptions reset ].
	Instance := nil