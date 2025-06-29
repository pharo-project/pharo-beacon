tracing
trace: anObject
	| sender |

	sender := thisContext sender.
	(self isTracing: sender) ifFalse: [ ^ self ].
	(TraceObjectSignal
		fromContext: sender
		object: anObject) 
		emit