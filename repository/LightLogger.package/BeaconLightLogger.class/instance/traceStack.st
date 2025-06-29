tracing
traceStack
	"trace stack"
	| sender |

	sender := thisContext sender.
	(self isTracing: sender) ifFalse: [ ^ self ].

	(TraceStackSignal fromContext: sender) emit