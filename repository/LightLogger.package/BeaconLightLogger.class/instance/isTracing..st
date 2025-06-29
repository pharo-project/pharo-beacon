private
isTracing: aReceiver

	filters ifNil: [ ^ true ].
	^ filters anySatisfy: [ :each | each isTracing: aReceiver ]