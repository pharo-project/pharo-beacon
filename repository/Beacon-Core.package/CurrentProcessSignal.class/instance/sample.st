signalling
sample

	| process |

	process := Processor preemptedProcess.
	preemptedName := process name.
	preemptedPriority := process priority.
	preemptedStack := process copyStack suspendedContext stack.

	process := Processor nextReadyProcess.
	nextReadyName := process name.
	nextReadyPriority := process priority.
	nextReadyName = preemptedName ifFalse: [ 
		nextReadyStack := process copyStack suspendedContext stack ].
