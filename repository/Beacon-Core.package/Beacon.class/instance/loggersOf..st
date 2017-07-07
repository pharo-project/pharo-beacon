accessing
loggersOf: aClass
	"announcments SubscriptionRegistry does not allow access to its subscriptions which
	Beacon needs. So there is a hack to access the instVar directly until access to 
	subscriptions has been solved"
	self flag: #hack.
	^ ((announcer subscriptions instVarNamed: #subscriptions) collect: #subscriber as: Set)
			select: [ :each | each isKindOf: aClass ]