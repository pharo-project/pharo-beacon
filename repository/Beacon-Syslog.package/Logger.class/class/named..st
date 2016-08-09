accessing
named: aString
	^ LogDispatcher current loggers
		detect: [ :each| each name = aString ]
		ifNone: [ nil ]