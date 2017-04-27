This signal logger simply records the signals that it receives.

!!Example1: Instance usage
[[[
	(MemoryLogger new 
		runDuring: [ 
			StringSignal emit: 'This is a message' ]	)
				inspect.
]]]

!!Example 2: Global usage
[[[
	MemoryLogger reset.
	MemoryLogger start.
	StringSignal emit: 'This is a message' .
	MemoryLogger instance recordings inspect.
	MemoryLogger stop.
]]]