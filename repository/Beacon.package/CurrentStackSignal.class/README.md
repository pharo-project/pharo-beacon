This is a convenience signal to record the current stack. This is particularly useful when you need to track the behavior of sensitive methods that do not allow for halting (e.g., a debugger or a rendering method).

Usage:
	CurrentStackSignal log
	
Full Example:
	TransmitBeacon new 
		runDuring: [ 
			CurrentStackSignal log ].
