Class {
	#name : 'LightLoggerTest',
	#superclass : 'TestCase',
	#category : 'LightLogger-Tests',
	#package : 'LightLogger-Tests'
}

{ #category : 'accessing' }
LightLoggerTest >> messageForTest [

	^ 'a message'
]

{ #category : 'accessing' }
LightLoggerTest >> recordings [

	^ MemoryLogger instance entries
]

{ #category : 'running' }
LightLoggerTest >> setUp [
	super setUp.

	MemoryLogger reset; start
]

{ #category : 'running' }
LightLoggerTest >> tearDown [
	
	MemoryLogger reset; stop.
	super tearDown
]

{ #category : 'tests' }
LightLoggerTest >> testInfo [

	BeaconLightLogger uniqueInstance info: self message.
	
	self assert: self recordings first senderClass equals: self class.	
	self assert: self recordings first senderSelector equals: #testVariable.
	self assert: self recordings first message equals: self message
]

{ #category : 'tests' }
LightLoggerTest >> testTrace [

	BeaconLightLogger uniqueInstance trace.
	
	self assert: self recordings first senderClass equals: self class.	
	self assert: self recordings first senderSelector equals: #testTrace.
	self assert: self recordings first sourcePosition equals: { 3. 2. 13 }
]

{ #category : 'tests' }
LightLoggerTest >> testTraceWithMessage [

	BeaconLightLogger uniqueInstance trace: self messageForTest message: 'TEST'.
	
	self assert: self recordings first senderClass equals: self class.	
	self assert: self recordings first senderSelector equals: #testTraceWithMessage.
	self assert: self recordings first sourcePosition equals: { 3. 2. 24 }.
	self assert: self recordings first traceName equals: 'self messageForTest'.
	self assert: self recordings first traceMessage equals: 'TEST'.
	self assert: self recordings first object equals: 'a message'
]

{ #category : 'tests' }
LightLoggerTest >> testTraceWithSelector [

	BeaconLightLogger uniqueInstance trace: self messageForTest.
	
	self assert: self recordings first senderClass equals: self class.	
	self assert: self recordings first senderSelector equals: #testTraceWithSelector.
	self assert: self recordings first sourcePosition equals: { 3. 2. 25 }.
	self assert: self recordings first traceName equals: 'self messageForTest'.
	self assert: self recordings first object equals: 'a message'
]

{ #category : 'tests' }
LightLoggerTest >> testTraceWithVariable [
	| var |

	var := 42.
	BeaconLightLogger uniqueInstance trace: var.
	
	self assert: self recordings first senderClass equals: self class.	
	self assert: self recordings first senderSelector equals: #testTraceWithVariable.
	self assert: self recordings first sourcePosition equals: { 5. 2. 46 }.
	self assert: self recordings first traceName equals: #var.
	self assert: self recordings first object equals: 42
]
