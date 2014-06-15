This is a convenience signal to record the current stack. This is particularly useful when you need to track the behavior of sensitive methods that do not allow for halting (e.g., a debugger or a rendering method).

Additionally, the signal only stores the RingMethodDefinition and like that it does not hold the real entire stack. This is safer and smaller to store and serialize.

Usage:
	StackSignal log
	
Full Example:
	TransmitBeacon new 
		runDuring: [ StackSignal log ].
