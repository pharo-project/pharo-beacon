This beacon forwards to the Transcript all signals that it receives.

Example:
	TranscriptBeacon new 
		runDuring: [ 
			MessageSignal log: 'This is a message' ].
