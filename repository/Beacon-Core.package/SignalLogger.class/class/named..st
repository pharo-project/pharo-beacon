accessing
named: aString
	^ (Beacon loggersOf: self)
		detect: [ :each | each name = aString ]
		ifNone: [ self new name: aString ]