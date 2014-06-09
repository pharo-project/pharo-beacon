This is a convenience signal to record the current stack.

Usage:
	CurrentStackSignal log
	
Full Example:
	TransmitBeacon new 
		runDuring: [ 
			CurrentStackSignal log ].
