accessing
stack
	^ stack ifNil: [ stack := self currentStack ]