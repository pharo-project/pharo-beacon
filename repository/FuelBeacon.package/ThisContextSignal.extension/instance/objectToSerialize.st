*FuelBeacon
objectToSerialize
	"We limit the serialization to 100 stack items"
	| trimmedCopy |
	trimmedCopy := self copy.
	trimmedCopy 
		instVarNamed: #stack
		put: (self stack size > 100 
				ifTrue: [self stack first: 100] 
				ifFalse: [self stack]).
	^ trimmedCopy