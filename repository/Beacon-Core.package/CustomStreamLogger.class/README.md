Example:
	String streamContents: [ :stream |
		(CustomStreamLogger with: stream)
			runDuring: [ 
				StringSignal emit: 'This is a message'.
				StringSignal emit: 'The red fox jumps over the lazy dog'.
				 ] ]