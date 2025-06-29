tracing
var: aVariable
	| sender |

	sender := thisContext sender.
	(self isTracing: sender) ifFalse: [ ^ self ].

	(TraceObjectSignal 
		fromContext: sender
		object: aVariable) 
		emit