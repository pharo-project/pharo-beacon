accessing
serializer
	^ serializer ifNil: [ serializer := self defaultSerializer ]  