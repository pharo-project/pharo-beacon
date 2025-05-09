tracing
trace: anObject message: messageString

	(TraceObjectSignal
		fromContext: thisContext sender
		object: anObject) 
		traceMessage: messageString;
		emit