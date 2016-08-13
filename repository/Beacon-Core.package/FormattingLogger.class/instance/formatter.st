accessing
formatter
	^ formatter ifNil: [ formatter := self defaultFormatter ]