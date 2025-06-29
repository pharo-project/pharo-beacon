tracing
info: aString
	| sender |

	sender := thisContext sender.
	(self isTracing: sender) ifFalse: [ ^ self ].

	(TraceObjectSignal
		fromContext: sender
		object: aString)
		traceMessage: 'INFO';
		emit