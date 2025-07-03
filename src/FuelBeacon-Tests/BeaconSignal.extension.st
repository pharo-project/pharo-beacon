Extension { #name : 'BeaconSignal' }

{ #category : '*FuelBeacon' }
BeaconSignal >> objectToSerialize [
	"By default we serialize self. However, subclasses 
	might override this method and return either a smaller 
	copy of self or a different object altogether"
	^ self
]

{ #category : '*FuelBeacon' }
BeaconSignal >> printOneLineString [
	^ String streamContents: [ :stream |
		self printOneLineOn: stream ]
]

{ #category : '*FuelBeacon' }
BeaconSignal >> serializeInDirectory: aDirectoryReference [ 
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
]

{ #category : '*FuelBeacon' }
BeaconSignal >> serializeToFile: aFileReference [
	FLSerializer 
		serialize: self objectToSerialize
		toFileNamed: aFileReference fullName
]
