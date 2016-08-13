instance creation
log: anException
	^ (self new 
		exception: anException; 
		stack: (anException signalerContext stack collect: [:each | each sourceNodeExecuted])) log