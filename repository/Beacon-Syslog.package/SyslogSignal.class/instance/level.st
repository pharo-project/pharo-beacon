accessing
level
	^ level ifNil: [ 
		level := LogLevel info ]