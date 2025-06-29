tracing
error: error
	| sender |

	sender := thisContext sender.
	(self isTracing: sender) ifFalse: [ ^ self ].

	(TraceObjectSignal
		fromContext: sender
		object: error)
		traceMessage: 'ERROR';
		emit