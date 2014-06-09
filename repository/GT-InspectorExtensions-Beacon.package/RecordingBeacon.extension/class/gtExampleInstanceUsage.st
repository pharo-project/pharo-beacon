*GT-InspectorExtensions-Beacon
gtExampleInstanceUsage
	<gtExample>
	^ RecordingBeacon new 
		runDuring: [ 
			MessageSignal log: 'This is a message'.
			MessageSignal log: 'This is another message'. ]	