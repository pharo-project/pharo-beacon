accessing
loggersOf: aClass
	^ (announcer subscriptions subscriptions collect: #subscriber as: Set)
			select: [ :each | each isKindOf: aClass ]