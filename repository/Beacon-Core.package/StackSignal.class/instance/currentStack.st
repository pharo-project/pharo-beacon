accessing
currentStack
	
	| fullStack |
	stack := fullStack := thisContext copyStack.
	[ fullStack sender selector = #emit or: [ fullStack sender isNil ] ] 
		whileFalse: [ fullStack := fullStack sender ].
	fullStack ifNotNil: [ stack := fullStack.
							"we skip the emit and emit new emit"
							stack := stack sender sender sender. ].
	^ stack