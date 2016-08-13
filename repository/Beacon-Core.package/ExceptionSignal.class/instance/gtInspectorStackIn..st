as yet unclassified
gtInspectorStackIn: composite
	<gtInspectorPresentationOrder: 0>
	composite fastTable
		title: 'Stack';
		display: [ self stack ];
		column: 'Class' evaluated: [:each | each parents first methodClass ];
		column: 'Method' evaluated: [:each | each parents first selector];
		column: 'Code' evaluated: [:each | each formattedCode]