query
named: aString
	"Return a log level by either fullname or shortname"
	
	^ self levels 
		detect: [ :level | level name = aString or: [ level shortName = aString ] ] 
		ifNone: [ self error: aString , ' is not a log level' ].