instance creation
emit: aString
	^ self new 
		message: aString;
		emit