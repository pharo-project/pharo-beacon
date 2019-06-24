signalling
sample

	| process |

	process := Processor preemptedProcess.
	preemptedName := process name.
	preemptedPriority := process priority.
	preemptedStack := process copyStack suspendedContext stack.
	preemptedStack := preemptedStack collect: [ :each | each receiver asString, ': ', each asString ].

	process := Processor nextReadyProcess.
	nextReadyName := process name.
	nextReadyPriority := process priority.
	nextReadyName = preemptedName ifFalse: [ 
		nextReadyStack := process copyStack suspendedContext stack.
		nextReadyStack := nextReadyStack collect: [ :each | each receiver asString, ': ', each asString ] ].
