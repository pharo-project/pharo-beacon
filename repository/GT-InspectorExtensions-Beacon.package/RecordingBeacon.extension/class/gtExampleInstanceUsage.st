*GT-InspectorExtensions-Beacon
gtExampleInstanceUsage
	<gtExample>
	^ RecordingBeacon new 
		runDuring: [ 
			StringSignal log: 'This is a message'.
			StringSignal log: 'This is another message'. ]	