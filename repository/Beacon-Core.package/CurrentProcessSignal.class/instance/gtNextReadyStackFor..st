inspecting
gtNextReadyStackFor: aView
	<gtView>
	^ aView explicit
		title: 'NextReady Stack' translated;
		priority: 50;
		stencil: [ BrSimpleList new display: (nextReadyStack
												ifNil: [ preemptedStack ]
												ifNotNil: [ nextReadyStack ]) ]
