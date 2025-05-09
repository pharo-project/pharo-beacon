tests
testTrace

	BeaconLightLogger uniqueInstance trace.
	
	self assert: self recordings first senderClass equals: self class.	
	self assert: self recordings first senderSelector equals: #testTrace.
	self assert: self recordings first sourcePosition equals: { 3. 2. 13 }