as yet unclassified
testKeywordMessage
	| node signalClass |
	
	logger trace: $a -> $b.
	
	node := thisContext method ast body statements first arguments first.
	signalClass := TraceSignalVisitor new visit: node.
	self assert: signalClass equals: TraceMessageSignal