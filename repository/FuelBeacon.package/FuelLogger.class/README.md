This beacon saves each signal into a Fuel file in the current folder.

Example:
	self new runDuring: [ 
		StringSignal log: 'This is a message'.
		StringSignal log: 'This is another message'. ].
