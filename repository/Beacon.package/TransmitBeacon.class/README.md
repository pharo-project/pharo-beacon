This beacon forwards to the Transmit all signals that it receives.

Example
	TransmitBeacon new 
		runDuring: [ 
			MessageSignal log: 'This is a message' ].
