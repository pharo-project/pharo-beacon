accessing
loggersOf: aClass
	"Returns the loggers of a certain class of loggers."

	^ ((announcer subscriptions subscriptions) collect: [:each | each subscriber] as: Set)
			select: [ :each | each isKindOf: aClass ]