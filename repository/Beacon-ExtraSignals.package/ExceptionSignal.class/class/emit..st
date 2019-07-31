instance creation
emit: anException
	^ (self new 
		exception: anException; 
		stack: (anException signalerContext stack collect: [:each | each sourceNodeExecuted])) emit