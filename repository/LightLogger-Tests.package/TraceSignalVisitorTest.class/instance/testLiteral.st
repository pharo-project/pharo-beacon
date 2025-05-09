as yet unclassified
testLiteral
	| node signalClass |
	
	logger trace: 42.
	
	node := thisContext method ast body statements first arguments first.
	signalClass := TraceSignalVisitor new visit: node.
	self assert: signalClass equals: TraceLiteralSignal