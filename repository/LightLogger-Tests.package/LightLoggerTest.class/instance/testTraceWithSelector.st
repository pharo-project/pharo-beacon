tests
testTraceWithSelector

	BeaconLightLogger uniqueInstance trace: self messageForTest.
	
	self assert: self recordings first senderClass equals: self class.	
	self assert: self recordings first senderSelector equals: #testTraceWithSelector.
	self assert: self recordings first sourcePosition equals: { 3. 2. 25 }.
	self assert: self recordings first traceName equals: 'self messageForTest'.
	self assert: self recordings first object equals: 'a message'