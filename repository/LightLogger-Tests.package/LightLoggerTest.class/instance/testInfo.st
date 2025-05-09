tests
testInfo

	BeaconLightLogger uniqueInstance info: self message.
	
	self assert: self recordings first senderClass equals: self class.	
	self assert: self recordings first senderSelector equals: #testVariable.
	self assert: self recordings first message equals: self message