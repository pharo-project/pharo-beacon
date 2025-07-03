Extension { #name : 'ZnLogEvent' }

{ #category : '*Beacon-Zinc' }
ZnLogEvent class >> logToBeacon [
	self stopLoggingToBeacon.
	^ self announcer when: ZnLogEvent do: [ :event | (ZnLogEventSignal on: event) emit ].
]

{ #category : '*Beacon-Zinc' }
ZnLogEvent class >> stopLoggingToBeacon [.
	self announcer unsubscribe: self
]
