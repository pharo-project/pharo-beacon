*FuelBeacon
serializeInDirectory: aDirectoryReference 
	"Serializes the current signal into a fuel file named based on 
	the one line printout. Given that the one liner contains the 
	timestamp, it becomes unique"
	| oneLinerAsFileName |
	oneLinerAsFileName := String streamContents: [ :stream | 
		self printOneLineString do: [ :each |
			(#( $: $/ $.) includes: each)
				ifTrue: [ stream nextPut: $-  ]
				ifFalse: [ stream nextPut: each ] ] ].
	self serializeToFile: (aDirectoryReference / oneLinerAsFileName , 'fuel')