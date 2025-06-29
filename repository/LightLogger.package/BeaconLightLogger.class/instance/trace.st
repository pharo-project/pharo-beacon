tracing
trace
	"trace method (and line)"
	| sender |

	sender := thisContext sender.
	(self isTracing: sender) ifFalse: [ ^ self ].

	(TraceSignal fromContext: sender) emit