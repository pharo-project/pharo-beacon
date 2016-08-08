*beacon-core-gt
gtInspectorGroupedIn: composite
	<gtInspectorPresentationOrder: 1>
	composite fastTable 
		title: 'Grouped';
		display: [ (self recordings reverse groupedBy: [ :each | each class ]) associations ];
		column: 'Class' evaluated: [ :each | each key ];
		column: 'Instances' evaluated: [ :each | each value size ];
		send: [ :each | each value ]