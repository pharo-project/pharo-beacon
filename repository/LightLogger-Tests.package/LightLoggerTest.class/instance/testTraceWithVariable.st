tests
testTraceWithVariable
	| var |

	var := 42.
	BeaconLightLogger uniqueInstance trace: var.
	
	self assert: self recordings first senderClass equals: self class.	
	self assert: self recordings first senderSelector equals: #testTraceWithVariable.
	self assert: self recordings first sourcePosition equals: { 5. 2. 46 }.
	self assert: self recordings first traceName equals: #var.
	self assert: self recordings first object equals: 42