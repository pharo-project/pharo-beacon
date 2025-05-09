tests
testTraceWithMessage

	BeaconLightLogger uniqueInstance trace: self messageForTest message: 'TEST'.
	
	self assert: self recordings first senderClass equals: self class.	
	self assert: self recordings first senderSelector equals: #testTraceWithMessage.
	self assert: self recordings first sourcePosition equals: { 3. 2. 24 }.
	self assert: self recordings first traceName equals: 'self messageForTest'.
	self assert: self recordings first traceMessage equals: 'TEST'.
	self assert: self recordings first object equals: 'a message'