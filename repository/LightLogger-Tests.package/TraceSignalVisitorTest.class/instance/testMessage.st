as yet unclassified
testMessage
	| node signalClass |
	
	logger trace: self message.
	
	node := thisContext method ast body statements first arguments first.
	signalClass := TraceSignalVisitor new visit: node.
	self assert: signalClass equals: TraceMessageSignal