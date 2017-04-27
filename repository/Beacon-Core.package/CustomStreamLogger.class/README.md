Example:
	String streamContents: [ :stream |
		(CustomStringStreamLogger with: stream)
			runDuring: [ 
				StringSignal emit: 'This is a message' ] ]