inspector
inspectionEntries: aBuilder
	<inspectorPresentationOrder: 10 title: 'Entries'>

	^ aBuilder newList 
		addStyle: 'stList';
		items: entries;
		yourself