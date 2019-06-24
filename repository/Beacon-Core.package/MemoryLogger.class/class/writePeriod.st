accessing
writePeriod

	^WritePeriod ifNil: [ WritePeriod := 60 seconds ]