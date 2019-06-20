inspecting
gtPreemptedStackFor: aView
	<gtView>
	^ aView explicit
		title: 'Preempted Stack' translated;
		priority: 50;
		stencil: [ BrSimpleList new display: preemptedStack ]