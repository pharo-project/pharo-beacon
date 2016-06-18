ui
gtInspectorSignalTypesIn: composite
	<gtInspectorPresentationOrder: 0>
	| live |
	live := true.
	composite fastTable 
		title: 'Signals';
		display: [ (self recordings groupedBy: [ :each | each class ]) associations ];
		column: 'Type' evaluated: [ :assoc | assoc key ];
		column: 'Amount' evaluated: [ :assoc | assoc value size ];
		send: [ :assoc | assoc value ];
		updateOn: Announcement from: [ self announcer ]