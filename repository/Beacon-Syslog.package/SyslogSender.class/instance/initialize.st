initialization
initialize

	super initialize.
	self facility: 16. "Use 1 (=user level) or 16-23 (=local use local0-7)"
	hosts := OrderedCollection new