Extension { #name : 'BeaconSignal' }

{ #category : '*beacon-syslog' }
BeaconSignal >> defaultLevel [
	^ LogLevel info
]

{ #category : '*beacon-syslog' }
BeaconSignal >> level [
	^ self properties at: #level ifAbsent: [ self defaultLevel ]
]

{ #category : '*beacon-syslog' }
BeaconSignal >> level: aLevel [
	self properties at: #level put: aLevel
]

{ #category : '*beacon-syslog' }
BeaconSignal >> tag [
	^ self properties at: #tag ifAbsent: [ nil ]
]

{ #category : '*beacon-syslog' }
BeaconSignal >> tag: aTag [
	self properties at: #tag put: aTag
]
