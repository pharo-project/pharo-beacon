This logger forwards to the Transcript all signals that it receives.

Example:
	TranscriptLogger new 
		runDuring: [ 
			StringSignal emit: 'This is a message' ].
