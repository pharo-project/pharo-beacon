internal
levels
	^ LogLevels ifNil: [ 
		LogLevels := SmallDictionary new  ]