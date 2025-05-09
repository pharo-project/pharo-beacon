instance creation
fromContext: aContext
	| node |

	node := aContext sourceNodeExecuted arguments first.
	^ (self signalClassFor: node) new 
		fromContext: aContext 
		node: node