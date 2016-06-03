This beacon forwards to the Transcript all signals that it receives.

Example:
	TranscriptBeacon new 
		runDuring: [ 
			StringSignal log: 'This is a message' ].
