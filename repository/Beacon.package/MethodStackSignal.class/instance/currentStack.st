initialize
currentStack
	| stackWithoutSelf |
	stackWithoutSelf := thisContext stack reject: [ :each | 
								each receiver = self or: [ 
									each receiver = self class ] ].
	^ stackWithoutSelf collect: [ :each | each method asRingDefinition ]