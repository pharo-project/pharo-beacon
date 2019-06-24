inspecting
gtStackTreeFor: aView
	<gtView>

	^aView mondrian 
		title: 'Stack Tree' translated;
		painting: [ :mondrian | self stackTreeFor: mondrian ]