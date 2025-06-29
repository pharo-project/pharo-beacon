private
addFilter: aFilter

	filters ifNil: [ filters := OrderedCollection new ].
	filters add: aFilter