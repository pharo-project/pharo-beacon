CircularMemoryLogger records the signals that it receives in a circular buffer, default size 5000 entries.

!!Example1: Instance usage
[[[
	(CircularMemoryLogger new 
		runDuring: [ 
			StringSignal emit: 'This is a message' ]	)
				inspect.
]]]

!!Example 2: Global usage
[[[
	CircularMemoryLogger reset.
	CircularMemoryLogger start.
	StringSignal emit: 'This is a message' .
	CircularMemoryLogger instance recordings inspect.
	CircularMemoryLogger stop.
]]]