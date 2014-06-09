This beacon simply records the signals that it receives.

Example1: Instance usage
	(RecordingBeacon new 
		runDuring: [ 
			MessageSignal log: 'This is a message' ]	)
				inspect.

Example 2: Global usage

	RecordingBeacon reset.
	RecordingBeacon start.
	MessageSignal log: 'This is a message' .
	RecordingBeacon instance recordings inspect.
	RecordingBeacon stop.