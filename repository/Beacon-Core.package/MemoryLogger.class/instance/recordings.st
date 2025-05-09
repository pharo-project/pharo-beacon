accessing
recordings

	self
		deprecated: 'Use entries'
		on: '28/03/2025'
		in: 'pharo13'
		transformWith: '`@receiver recordings'
						-> '`@receiver entries'.
	^ self entries 