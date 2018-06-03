initialize
currentStack
	^ self relevantStackWithoutSelf collect: [ :each | each method asRingDefinition ]