accessing
lineSeparator
	^ lineSeparator ifNil: [
		lineSeparator := self defaultLineSeparator ]