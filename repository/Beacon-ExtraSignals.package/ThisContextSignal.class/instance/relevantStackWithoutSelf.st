initialize
relevantStackWithoutSelf
	| s |
	s := thisContext stack.
	^ s allButFirst: (s findLast: [ :each | each receiver = self or: [ each receiver = self class ] ])