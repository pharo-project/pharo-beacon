operations
serializeSignal: aSignal
	^ self serializer
		serializeSignal: aSignal
		logger: self