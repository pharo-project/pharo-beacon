tracing
trace: anObject message: messageString
	| sender |

	sender := thisContext sender.
	(self isTracing: sender) ifFalse: [ ^ self ].

	(TraceObjectSignal
		fromContext: sender
		object: anObject) 
		traceMessage: messageString;
		emit