printing
printOneLineContentsOn: stream 

	super printOneLineContentsOn: stream.
	
	traceMessage ifNotNil: [
		stream space. 
		stream << traceMessage ].
	stream space.
	self traceName ifNotNil: [ :aName | 
		stream << aName << '=' ].
	stream print: self object