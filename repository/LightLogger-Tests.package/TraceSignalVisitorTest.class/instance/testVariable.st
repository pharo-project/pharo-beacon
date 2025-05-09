as yet unclassified
testVariable
	| var node signalClass |
	
	var := 42.
	logger trace: var.
	
	node := thisContext method ast body statements second arguments first.
	signalClass := TraceSignalVisitor new visit: node.
	self assert: signalClass equals: TraceVariableSignal