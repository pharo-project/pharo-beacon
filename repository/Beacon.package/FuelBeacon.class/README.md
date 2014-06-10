This beacon saves each signal into a Fuel file in the current folder.

Example:
	self new runDuring: [ 
		MessageSignal log: 'This is a message'.
		MessageSignal log: 'This is a message'. ].
