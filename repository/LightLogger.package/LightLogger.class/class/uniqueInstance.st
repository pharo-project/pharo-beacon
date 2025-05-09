instance creation
uniqueInstance

	self = LightLogger ifTrue: [
		self error: 'I''m an abstract class. Use one of my children instead.' ].
	^ uniqueInstance ifNil: [ uniqueInstance := self basicNew initialize ]