Extension { #name : 'StackSignal' }

{ #category : '*GT-InspectorExtensions-Beacon' }
StackSignal >> gtInspectorStackIn: composite [
	<gtInspectorPresentationOrder: 40>
	composite list 
		title: 'Stack';
		display: [ self stack ]
]
