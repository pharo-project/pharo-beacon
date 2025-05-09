tracing
trace: anObject

	(TraceObjectSignal
		fromContext: thisContext sender
		object: anObject) 
		emit