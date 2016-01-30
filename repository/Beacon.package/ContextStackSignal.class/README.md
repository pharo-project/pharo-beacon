This signal  stores the Context objects and like this it is more suitable for reasoning about execution flows that also include information about receivers.

Usage:
	ContextStackSignal log
	
Full Example:
	TransmitBeacon new 
		runDuring: [ ContextStackSignal log ].
