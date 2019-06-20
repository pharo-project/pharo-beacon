signalling
sample

	| process |

	process := Processor preemptedProcess.
	preemptedName := process name.
	preemptedPriority := process priority.
	preemptedStack := process copyStack suspendedContext stack.
	preemptedStack := (preemptedStack copyFrom: 1 to: (100 min: preemptedStack size))
		collect: [ :each | each method asRingDefinition ].

	process := Processor nextReadyProcess.
	nextReadyName := process name.
	nextReadyPriority := process priority.
	nextReadyStack := process copyStack suspendedContext stack.
	nextReadyStack := (preemptedStack copyFrom: 1 to: (100 min: preemptedStack size))
		collect: [ :each | each method asRingDefinition ].
