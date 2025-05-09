as yet unclassified
testUnaryMessage
	| node signalClass |
	
	logger trace: true not.
	
	node := thisContext method ast body statements first arguments first.
	signalClass := TraceSignalVisitor new visit: node.
	self assert: signalClass equals: TraceMessageSignal